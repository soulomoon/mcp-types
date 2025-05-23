{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCBatchRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.JSONRPCRequest
import Network.Protocol.MCP.Types.JSONRPCNotification

type JSONRPCBatchRequest = [Either JSONRPCRequest
                                   JSONRPCNotification]
