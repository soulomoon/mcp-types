{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.InitializeRequest where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

import Network.Protocol.MCP.Types.ClientCapabilities
import Network.Protocol.MCP.Types.Implementation

data Params
    = Params {capabilities :: ClientCapabilities,
              clientInfo :: Implementation,
              protocolVersion :: Text}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Params
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Params
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
data InitializeRequest
    = InitializeRequest {method :: Text, params :: Params}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON InitializeRequest
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON InitializeRequest
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
