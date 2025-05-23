{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CreateMessageResult where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

import Network.Protocol.MCP.Types.TextContent
import Network.Protocol.MCP.Types.ImageContent
import Network.Protocol.MCP.Types.AudioContent
import Network.Protocol.MCP.Types.Role

data Meta_
    = Meta_ {}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Meta_
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Meta_
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
data CreateMessageResult
    = CreateMessageResult {meta_ :: Meta_,
                           content :: (Either TextContent (Either ImageContent AudioContent)),
                           model :: Text,
                           role :: Role,
                           stopReason :: Text}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON CreateMessageResult
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON CreateMessageResult
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
