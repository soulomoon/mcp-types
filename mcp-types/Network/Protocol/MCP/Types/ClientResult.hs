{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ClientResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Result
import Network.Protocol.MCP.Types.CreateMessageResult
import Network.Protocol.MCP.Types.ListRootsResult

type ClientResult = Either Result
                           (Either CreateMessageResult ListRootsResult)
