{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCResponse where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.RequestId
import Network.Protocol.MCP.Types.Result

data JSONRPCResponse
    = JSONRPCResponse {id :: RequestId,
                       jsonrpc :: Text,
                       result :: Result}
