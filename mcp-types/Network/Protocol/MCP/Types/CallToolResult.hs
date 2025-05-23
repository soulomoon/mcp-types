{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CallToolResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.TextContent
import Network.Protocol.MCP.Types.ImageContent
import Network.Protocol.MCP.Types.AudioContent
import Network.Protocol.MCP.Types.EmbeddedResource

data Meta_ = Meta_ {}
data CallToolResult
    = CallToolResult {content :: [Either TextContent
                                         (Either ImageContent
                                                 (Either AudioContent EmbeddedResource))],
                      isError :: Bool,
                      meta_ :: Meta_}
