{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module JSONRPCResponse where

import Prelude

import Data.Aeson (Value)

import RequestId
import Result

data JSONRPCResponse
    = JSONRPCResponse {id :: RequestId,
                       jsonrpc :: String,
                       result :: Result}
