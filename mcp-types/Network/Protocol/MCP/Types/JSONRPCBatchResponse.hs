{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCBatchResponse where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.JSONRPCResponse
import Network.Protocol.MCP.Types.JSONRPCError

type JSONRPCBatchResponse = [Either JSONRPCResponse JSONRPCError]
