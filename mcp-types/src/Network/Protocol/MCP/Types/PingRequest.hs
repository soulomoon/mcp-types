{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PingRequest where

import           Data.Aeson                               (FromJSON,
                                                           Options (..), ToJSON,
                                                           Value,
                                                           defaultOptions,
                                                           genericParseJSON,
                                                           genericToJSON,
                                                           parseJSON, toJSON)
import qualified Data.Aeson                               as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                               as Data.Aeson.Types.Internal
import qualified Data.Aeson                               as Data.Aeson.Types.ToJSON
import           Data.Text                                (Text)
import           GHC.Generics                             (Generic)
import           Prelude
import           Test.QuickCheck                          (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic        (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.ProgressToken (ProgressToken)

data Meta_
    = Meta_ {progressToken :: (Maybe ProgressToken)}
    deriving Arbitrary via (GenericArbitrary Meta_)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Meta_
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Meta_
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data Params
    = Params {meta_ :: (Maybe Meta_)}
    deriving Arbitrary via (GenericArbitrary Params)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Params
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Params
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data PingRequest
    = PingRequest {method :: Text, params :: (Maybe Params)}
    deriving Arbitrary via (GenericArbitrary PingRequest)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON PingRequest
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON PingRequest
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
