{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCMessage where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.JSONRPCRequest
import Network.Protocol.MCP.Types.JSONRPCNotification
import Network.Protocol.MCP.Types.JSONRPCRequest
import Network.Protocol.MCP.Types.JSONRPCNotification
import Network.Protocol.MCP.Types.JSONRPCResponse
import Network.Protocol.MCP.Types.JSONRPCError
import Network.Protocol.MCP.Types.JSONRPCResponse
import Network.Protocol.MCP.Types.JSONRPCError

type JSONRPCMessage = Either JSONRPCRequest
                             (Either JSONRPCNotification
                                     (Either [Either JSONRPCRequest JSONRPCNotification]
                                             (Either JSONRPCResponse
                                                     (Either JSONRPCError
                                                             [Either JSONRPCResponse
                                                                     JSONRPCError]))))
