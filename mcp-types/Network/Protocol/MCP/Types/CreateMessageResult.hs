{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CreateMessageResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.TextContent
import Network.Protocol.MCP.Types.ImageContent
import Network.Protocol.MCP.Types.AudioContent
import Network.Protocol.MCP.Types.Role

data Meta_ = Meta_ {}
data CreateMessageResult
    = CreateMessageResult {content :: (Either TextContent
                                              (Either ImageContent AudioContent)),
                           meta_ :: Meta_,
                           model :: Text,
                           role :: Role,
                           stopReason :: Text}
