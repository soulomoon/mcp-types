{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ResourceTemplate where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

import Network.Protocol.MCP.Types.Annotations

data ResourceTemplate
    = ResourceTemplate {annotations :: Annotations,
                        description :: Text,
                        mimeType :: Text,
                        name :: Text,
                        uriTemplate :: Text}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON ResourceTemplate
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON ResourceTemplate
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
