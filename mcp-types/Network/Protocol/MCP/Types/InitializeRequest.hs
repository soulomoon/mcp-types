{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.InitializeRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.ClientCapabilities
import Network.Protocol.MCP.Types.Implementation

data Params
    = Params {capabilities :: ClientCapabilities,
              clientInfo :: Implementation,
              protocolVersion :: Text}
data InitializeRequest
    = InitializeRequest {method :: Text, params :: Params}
