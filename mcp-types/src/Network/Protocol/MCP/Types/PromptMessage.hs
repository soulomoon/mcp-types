{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DerivingVia #-}

module Network.Protocol.MCP.Types.PromptMessage where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import Test.QuickCheck (Arbitrary)
import Test.QuickCheck.Arbitrary.Generic (GenericArbitrary(..))
import qualified Utils

import Network.Protocol.MCP.Types.TextContent(TextContent)
import Network.Protocol.MCP.Types.ImageContent(ImageContent)
import Network.Protocol.MCP.Types.AudioContent(AudioContent)
import Network.Protocol.MCP.Types.EmbeddedResource(EmbeddedResource)
import Network.Protocol.MCP.Types.Role(Role)

data PromptMessage
    = PromptMessage {content :: (Either TextContent
                                        (Either ImageContent
                                                (Either AudioContent EmbeddedResource))),
                     role :: Role}
    deriving Arbitrary via (GenericArbitrary PromptMessage)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON PromptMessage
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON PromptMessage
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
