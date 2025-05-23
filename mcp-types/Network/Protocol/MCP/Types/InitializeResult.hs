{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.InitializeResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.ServerCapabilities
import Network.Protocol.MCP.Types.Implementation

data Meta_ = Meta_ {}
data InitializeResult
    = InitializeResult {capabilities :: ServerCapabilities,
                        instructions :: Text,
                        meta_ :: Meta_,
                        protocolVersion :: Text,
                        serverInfo :: Implementation}
