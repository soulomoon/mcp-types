{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.RequestId
import Network.Protocol.MCP.Types.ProgressToken

data Meta_ = Meta_ {progressToken :: ProgressToken}
data Params = Params {meta_ :: Meta_}
data JSONRPCRequest
    = JSONRPCRequest {id :: RequestId,
                      jsonrpc :: Text,
                      method :: Text,
                      params :: Params}
