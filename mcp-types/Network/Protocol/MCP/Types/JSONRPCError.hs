{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCError where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.RequestId

data Error = Error {code :: Int, data_ :: Value, message :: Text}
data JSONRPCError
    = JSONRPCError {error :: Error, id :: RequestId, jsonrpc :: Text}
