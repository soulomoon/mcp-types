{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE MultilineStrings #-}
{-# LANGUAGE OverloadedStrings #-}

module Types where

import Control.Applicative ((<|>))
import Data.Aeson (FromJSON, Result (..), Value (..), fromJSON)
import Data.Aeson.Key qualified as K
import Data.Aeson.KeyMap qualified as KM
import Data.Aeson.Types (Parser, parseJSON, withObject, (.:), (.:?))
import Data.Data (Data)
import Data.Map qualified as M
import Data.Maybe (mapMaybe)
import Data.Text qualified as T

-- Reference type

data Ref = Ref
  { refValue :: T.Text,
    refDescription :: Maybe T.Text
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON Ref where
  parseJSON = withObject "Ref" $ \obj -> do
    refValue <- obj .: "$ref"
    refDescription <- obj .:? "description"
    return $ Ref refValue refDescription

-- String type

data SString = SString
  { sConst :: Maybe T.Text,
    enumValues :: Maybe [T.Text],
    sDescription :: Maybe T.Text
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON SString where
  parseJSON = withObject "SString" $ \obj -> do
    constValue <- obj .:? "const"
    des <- obj .:? "description"
    enumValues <- obj .:? "enum"
    return $ SString constValue enumValues des

-- Number type

data SNumber = SNumber
  { sRange :: Maybe (Int, Int),
    sDescription :: Maybe T.Text
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON SNumber where
  parseJSON = withObject "SNumber" $ \obj -> do
    minValue <- obj .:? "minimum"
    maxValue <- obj .:? "maximum"
    range <- case (minValue, maxValue) of
      (Just minV, Just maxV) -> return $ Just (minV, maxV)
      _ -> return Nothing
    des <- obj .:? "description"
    return $ SNumber range des

-- Boolean type

data SBoolean = SBoolean
  { sConst :: Maybe Bool,
    sDescription :: Maybe T.Text
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON SBoolean where
  parseJSON = withObject "SBoolean" $ \obj -> do
    constValue <- obj .:? "const"
    des <- obj .:? "description"
    return $ SBoolean constValue des

-- TypeList type

data STypeAlternative = STypeAlternative
  { sTypes :: [T.Text],
    sDescription :: Maybe T.Text
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON STypeAlternative where
  parseJSON = withObject "STypeAlternative" $ \obj -> do
    typesList <- obj .: "type"
    des <- obj .:? "description"
    return $ STypeAlternative typesList des

-- JSON type

data SJSON = SJSON
  { sDescription :: T.Text
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON SJSON where
  parseJSON = withObject "SJSON" $ \obj -> do
    des <- obj .: "description"
    return $ SJSON des

-- Array type

data SArray = Array_
  { item :: SEntity,
    description :: Maybe T.Text
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON SArray where
  parseJSON = withObject "SArray" $ \obj -> do
    type_ <- obj .: "items"
    des <- obj .:? "description"
    return $ Array_ type_ des

-- Object type

data SObject = SObject
  { sProperties :: M.Map T.Text SEntity,
    sDescription :: Maybe T.Text,
    sRequired :: Maybe [T.Text]
  }
  deriving (Show, Eq, Ord, Data)

instance FromJSON SObject where
  parseJSON = withObject "SObject" $ \obj -> do
    properties <- obj .:? "properties"
    des <- obj .:? "description"
    required <- obj .:? "required"
    case properties of
      Just props -> return $ SObject props des required
      Nothing -> return $ SObject M.empty des required

data SEntity
  = SStringType SString
  | SNumberType SNumber
  | SBooleanType SBoolean
  | SIntegerType SNumber
  | STypeAlternativeTypeAlternative STypeAlternative
  | SRef Ref
  | SJSONType SJSON
  | SObjectType SObject
  | SArrayType SArray
  | SOneOf [SEntity]
  deriving (Show, Eq, Ord, Data)

lowerFirst :: T.Text -> T.Text
lowerFirst = T.toLower . T.take 1 <> T.tail

instance FromJSON SEntity where
  parseJSON = withObject "SEntity" $ \obj -> do
    mTypeVal <- obj .:? "type" :: Parser (Maybe Value)
    case mTypeVal of
      Just (String t) -> case lowerFirst t of
        "string" -> SStringType <$> parseJSON (Object obj)
        "number" -> SNumberType <$> parseJSON (Object obj)
        "integer" -> SIntegerType <$> parseJSON (Object obj)
        "array" -> SArrayType <$> parseJSON (Object obj)
        -- "array"   -> error "SEntity: Array type should be handled separately"
        "object" -> SObjectType <$> parseJSON (Object obj)
        "boolean" -> SBooleanType <$> parseJSON (Object obj)
        _ -> fail $ "SEntity: Unsupported type: " ++ show t
      Just (Array _) -> STypeAlternativeTypeAlternative <$> parseJSON (Object obj)
      Nothing ->
        (SRef <$> parseJSON (Object obj))
          <|> parseSOneOf obj
          <|> (STypeAlternativeTypeAlternative <$> parseJSON (Object obj))
          <|> (SJSONType <$> parseJSON (Object obj))
      _ -> fail "SEntity: Unexpected type field (not string or array)"
    where
      parseSOneOf o = do
        oneOfList <- o .:? "anyOf"
        case oneOfList of
          Just oneOf -> SOneOf <$> mapM parseJSON oneOf
          Nothing -> fail "No 'oneOf' field found."

isJsonType :: SEntity -> Bool
isJsonType (SJSONType _) = True
isJsonType _ = False

-- MetaModel type
newtype MetaModel = MetaModel
  {structures :: [(T.Text, SEntity)]}
  deriving (Eq, Ord, Data)

instance Show MetaModel where
  show (MetaModel sts) =
    "MetaModel: \n"
      ++ "\nstructures:\n"
      ++ unlines (map show sts)
      ++ "\n\n"
      ++ "Number of structures: "
      ++ show (length sts)
      ++ "\n"

-- Utility for extracting key-object pairs from a KeyMap
kmKeyObjects :: KM.KeyMap Value -> [(K.Key, KM.KeyMap Value)]
kmKeyObjects obj =
  mapMaybe
    ( \(k, v) -> case fromJSON v of
        Success o -> Just (k, o)
        _ -> Nothing
    )
    (KM.toList obj)
