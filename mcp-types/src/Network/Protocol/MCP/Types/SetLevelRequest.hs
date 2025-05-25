{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.SetLevelRequest where

import           Data.Aeson                              (FromJSON,
                                                          Options (..), ToJSON,
                                                          Value, defaultOptions,
                                                          genericParseJSON,
                                                          genericToJSON,
                                                          parseJSON, toJSON)
import qualified Data.Aeson                              as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                              as Data.Aeson.Types.Internal
import qualified Data.Aeson                              as Data.Aeson.Types.ToJSON
import           Data.Text                               (Text)
import           GHC.Generics                            (Generic)
import           Prelude
import           Test.QuickCheck                         (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic       (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.LoggingLevel (LoggingLevel)

data Params
    = Params {level :: LoggingLevel}
    deriving Arbitrary via (GenericArbitrary Params)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Params
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Params
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data SetLevelRequest
    = SetLevelRequest {method :: Text, params :: Params}
    deriving Arbitrary via (GenericArbitrary SetLevelRequest)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON SetLevelRequest
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON SetLevelRequest
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
