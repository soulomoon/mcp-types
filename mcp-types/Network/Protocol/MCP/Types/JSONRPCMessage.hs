{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCMessage where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

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
