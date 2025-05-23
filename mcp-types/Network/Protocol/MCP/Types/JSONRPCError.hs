{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCError where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

import Network.Protocol.MCP.Types.RequestId

data Error
    = Error {code :: Int, data_ :: Value, message :: Text}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Error
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Error
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
data JSONRPCError
    = JSONRPCError {error :: Error, id :: RequestId, jsonrpc :: Text}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON JSONRPCError
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON JSONRPCError
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
