{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DerivingVia #-}

module Network.Protocol.MCP.Types.JSONRPCMessage where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import Test.QuickCheck (Arbitrary)
import Test.QuickCheck.Arbitrary.Generic (GenericArbitrary(..))
import qualified Utils

import Network.Protocol.MCP.Types.JSONRPCRequest(JSONRPCRequest)
import Network.Protocol.MCP.Types.JSONRPCNotification(JSONRPCNotification)
import Network.Protocol.MCP.Types.JSONRPCRequest(JSONRPCRequest)
import Network.Protocol.MCP.Types.JSONRPCNotification(JSONRPCNotification)
import Network.Protocol.MCP.Types.JSONRPCResponse(JSONRPCResponse)
import Network.Protocol.MCP.Types.JSONRPCError(JSONRPCError)
import Network.Protocol.MCP.Types.JSONRPCResponse(JSONRPCResponse)
import Network.Protocol.MCP.Types.JSONRPCError(JSONRPCError)

type JSONRPCMessage = Either JSONRPCRequest
                             (Either JSONRPCNotification
                                     (Either [Either JSONRPCRequest JSONRPCNotification]
                                             (Either JSONRPCResponse
                                                     (Either JSONRPCError
                                                             [Either JSONRPCResponse
                                                                     JSONRPCError]))))
