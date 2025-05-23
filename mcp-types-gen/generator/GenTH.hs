{-# LANGUAGE OrPatterns #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module GenTH (genDataTypesTH, genDataTypeTH, hsTypeTH) where

import Control.Monad.RWS (MonadWriter)
import Control.Monad.Writer (MonadWriter (..))
import Control.Monad.Writer.Strict (runWriter)
import Data.Aeson (Value)
import Data.Map qualified as M
import Data.Text (Text)
import Data.Text qualified as T
import Debug.Trace (traceM)
import Language.Haskell.TH
import Types
import Utils
import GenName

-- | Generate Haskell data type declarations from schema definitions using Template Haskell
genDataTypesTH :: [NameEntity] -> Q [Dec]
genDataTypesTH defs = do
  let obs = concatMap flattenObject defs
  traceM $ "Flattened objects: \n" ++ unlines (show <$> obs)
  a <- concat <$> mapM genDataTypeTH obs
  traceM $ show a
  return a

goExpandObj :: (MonadWriter [(NameEntity)] m) => NameEntity -> m ()
goExpandObj item@(_, obj) = do
  newItem <- expandObj item
  case obj of
    SObjectType _ -> return ()
    _ -> tell [(fst item, newItem)]

expandObj :: (MonadWriter [(NameEntity)] m) => NameEntity -> m SEntity
expandObj (name, obj) = do
  case obj of
    SObjectType obj@(SObject props _ _) -> do
      let fields = M.toList props
      newFields <- mapM expandObj fields
      let newNamedObj = (name, SObjectType obj {sProperties = M.fromList (zip (fst <$> fields) newFields)})
      tellAndReturn newNamedObj
    SArrayType (Array_ o d) -> do
      let itemName = toItemName name
      newObj <- expandObj (itemName, o)
      return $ SArrayType (Array_ newObj d)
    SOneOf entities -> do
      let namedEntities = zipWith (\x e -> (mkItemNameI x, e)) [1 ::Int ..] entities
      newEntities <- mapM expandObj namedEntities
      return $ SOneOf newEntities
    _ -> return obj
  where
    tellAndReturn x@(rName,_) = tell (return x) >> return (SRef $ Ref rName.genHsName (Just ""))

flattenObject :: NameEntity -> [NameEntity]
flattenObject x =
  let ans = runWriter (goExpandObj x)
   in snd ans

genDataTypeTH :: NameEntity -> Q [Dec]
genDataTypeTH (name, obj) = case obj of
  SArrayType (Array_ (SOneOf _) _); SRef _ ->
    return [TySynD typeName [] $ hsTypeTH obj]
  SStringType str ->
    case str.enumValues of
      Just enums | not (null enums) -> do
        cons <- mapM (mkCon []) enums
        return [DataD [] typeName [] Nothing cons []]
      _ -> do
        return [TySynD typeName [] (hsTypeTH obj)]
  STypeAlternativeTypeAlternative ob -> do
    cons <- typeListFields name $ sTypes ob
    return [DataD [] typeName [] Nothing cons []]
  SOneOf _ -> return [TySynD typeName [] (hsTypeTH obj)]
  SObjectType ob -> do
    let fields = mkFields $ propertiesField ob
    sequence [recC typeName fields >>= \con -> return $ DataD [] typeName [] Nothing [con] []]
  _ -> error $ "Unsupported type: " ++ show name ++ " " ++ show obj
  where
    typeName = mkName $ T.unpack name.genTypeName
    mkFields nameTypes =
      [ varBangType
          (mkName $ T.unpack fName.genHsName)
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
      normalC (mkName $ T.unpack prefix.genHsName ++ cName) fTypes
    typeListFields :: GenName -> [Text] -> Q [Con]
    typeListFields prefix = mapM (typeListField prefix)
    propertiesField object =
      [ (fName, hsTypeTH fType)
      | (fName, fType) <- M.toList (sProperties object)
      ]

-- | Map SEntity to Haskell type (TH Type)
hsTypeTH :: SEntity -> Type
hsTypeTH entity = case entity of
  SStringType _ -> conT' ''Text
  SNumberType _ -> conT' ''Double
  SIntegerType _ -> conT' ''Int
  SBooleanType _ -> conT' ''Bool
  SArrayType arr -> AppT ListT (hsTypeTH $ item arr)
  SRef ref ->
    let raw = refValue ref
        n = T.unpack $ stripDefinitions raw
     in conT' (mkName (capitalize n))
  STypeAlternativeTypeAlternative _ -> conT' ''Value -- Could be refined if needed
  SOneOf entities ->
    case entities of
      [a, b] -> AppT (AppT (ConT (mkName "Either")) (hsTypeTH a)) (hsTypeTH  b)
      (x : xs) -> foldr1 (AppT . AppT (ConT (mkName "Either"))) (map hsTypeTH (x : xs))
      [] -> conT' ''Value
  SJSONType _ -> conT' ''Value
  SObjectType _ -> error $ "Object type only at top level after expandObj: " ++ show entity

conT' :: Name -> Type
conT' name = ConT $ removeInternal name
