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
    = InitializeResult {meta_ :: Meta_,
                        capabilities :: ServerCapabilities,
                        instructions :: Text,
                        protocolVersion :: Text,
                        serverInfo :: Implementation}
