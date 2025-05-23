{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PromptMessage where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.TextContent
import Network.Protocol.MCP.Types.ImageContent
import Network.Protocol.MCP.Types.AudioContent
import Network.Protocol.MCP.Types.EmbeddedResource
import Network.Protocol.MCP.Types.Role

data PromptMessage
    = PromptMessage {content :: (Either TextContent
                                        (Either ImageContent
                                                (Either AudioContent EmbeddedResource))),
                     role :: Role}
