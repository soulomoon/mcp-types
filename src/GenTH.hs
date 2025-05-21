{-# LANGUAGE OrPatterns #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module GenTH (genDataTypesTH, genDataTypeTH, hsTypeTH) where

import Control.Monad.RWS (MonadWriter)
import Control.Monad.Writer (MonadWriter (..))
import Control.Monad.Writer.Strict (runWriter)
import Data.Aeson (Value)
import Data.Bifunctor (first)
import Data.Map qualified as M
import Data.Text (Text)
import Data.Text qualified as T
import Debug.Trace (traceM)
import Language.Haskell.TH
import Types
import Utils

-- | Generate Haskell data type declarations from schema definitions using Template Haskell
genDataTypesTH :: [(Text, SEntity)] -> Q [Dec]
genDataTypesTH defs = do
  let objs = concatMap flattenObject defs
  traceM $ "Flattened objects: \n" ++ unlines (show <$> objs)
  a <- concat <$> mapM (genDataTypeTH . first T.unpack) objs
  traceM $ show a
  return a

goExpandObj :: (MonadWriter [(Text, SEntity)] m) => (Text, SEntity) -> m ()
goExpandObj item@(_, obj) = do
  newItem <- expandObj item
  case obj of
    SObjectType _ -> return ()
    _ -> tell [(fst item, newItem)]

renameField :: Text -> Text
renameField "_meta" = "meta_"
renameField "data" = "data_"
renameField "type" = "type_"
renameField fieldName = fieldName

expandObj :: (MonadWriter [(Text, SEntity)] m) => (Text, SEntity) -> m SEntity
expandObj (name, obj) = do
  case obj of
    SObjectType obj@(SObject props _ _) -> do
      let fields = first renameField <$> M.toList props
      newFields <- mapM expandObj fields
      let newNamedObj = (name, SObjectType obj {sProperties = M.fromList (zip (fst <$> fields) newFields)})
      tellAndReturn newNamedObj
    SArrayType (Array_ o d) -> do
      let itemName = mkItemName name
      newObj <- expandObj (itemName, o)
      return $ SArrayType (Array_ newObj d)
    SOneOf entities -> do
      let namedEntities = zipWith (\x e -> (mkItemNameI x, e)) [1 ..] entities
      newEntities <- mapM expandObj namedEntities
      return $ SOneOf newEntities
    _ -> return obj
  where
    tellAndReturn x = tell (return x) >> return (SRef $ Ref (fst x) (Just ""))

flattenObject :: (Text, SEntity) -> [(Text, SEntity)]
flattenObject x =
  let ans = runWriter (goExpandObj x)
   in snd ans

genDataTypeTH :: (String, SEntity) -> Q [Dec]
genDataTypeTH (name, obj) = case obj of
  SArrayType (Array_ (SOneOf _) _); SRef _ ->
    return [TySynD (mkName (capitalize name)) [] $ hsTypeTH name obj]
  SStringType str ->
    case str.enumValues of
      Just enums | not (null enums) -> do
        cons <- mapM (mkCon []) enums
        return [DataD [] typeName [] Nothing cons []]
      _ -> do
        return [TySynD typeName [] (hsTypeTH name obj)]
  STypeAlternativeTypeAlternative ob -> do
    cons <- typeListFields name $ sTypes ob
    return [DataD [] typeName [] Nothing cons []]
  SOneOf _ -> return [TySynD typeName [] (hsTypeTH name obj)]
  SObjectType ob -> do
    let fields = mkFields $ propertiesField ob
    sequence [recC typeName fields >>= \con -> return $ DataD [] typeName [] Nothing [con] []]
  _ -> error $ "Unsupported type: " ++ name ++ " " ++ show obj
  where
    typeName = mkName (capitalize name)
    mkFields nameTypes =
      [ varBangType
          (mkName $ T.unpack fName)
          ( bangType
              (bang noSourceUnpackedness noSourceStrictness)
              (return p)
          )
      | (fName, p) <- nameTypes
      ]
    mkCon fields enumVal = normalC (mkName (capitalize (T.unpack enumVal))) fields
    typeListField prefix fNameRaw = do
      let cName = capitalize $ T.unpack fNameRaw
          fTypes = [bangType (bang noSourceUnpackedness noSourceStrictness) (return $ conT' $ mkName cName)]
      normalC (mkName $ prefix ++ cName) fTypes
    typeListFields prefix = mapM (typeListField prefix)
    propertiesField object =
      [ (fName, hsTypeTH (T.unpack fName) fType)
      | (fName, fType) <- M.toList (sProperties object)
      ]

-- | Map SEntity to Haskell type (TH Type)
hsTypeTH :: String -> SEntity -> Type
hsTypeTH name entity = case entity of
  SStringType _ -> conT' ''String
  SNumberType _ -> conT' ''Double
  SIntegerType _ -> conT' ''Int
  SBooleanType _ -> conT' ''Bool
  SArrayType arr -> AppT ListT (hsTypeTH "" $ item arr)
  SRef ref ->
    let raw = refValue ref
        n = T.unpack $ stripDefinitions raw
     in conT' (mkName (capitalize n))
  STypeAlternativeTypeAlternative _ -> conT' ''Value -- Could be refined if needed
  SOneOf entities ->
    case entities of
      [a, b] -> AppT (AppT (ConT (mkName "Either")) (hsTypeTH (name ++ "A") a)) (hsTypeTH (name ++ "B") b)
      (x : xs) -> foldr1 (AppT . AppT (ConT (mkName "Either"))) (map (hsTypeTH name) (x : xs))
      [] -> conT' ''Value
  SJSONType _ -> conT' ''Value
  SObjectType _ -> error $ "Object type only at top level after expandObj: " ++ show (name, entity)

conT' :: Name -> Type
conT' name = ConT $ removeInternal name
