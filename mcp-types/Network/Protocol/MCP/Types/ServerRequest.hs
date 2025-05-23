{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ServerRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.PingRequest
import Network.Protocol.MCP.Types.CreateMessageRequest
import Network.Protocol.MCP.Types.ListRootsRequest

type ServerRequest = Either PingRequest
                            (Either CreateMessageRequest ListRootsRequest)
