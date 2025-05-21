{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module JSONRPCError where

import Prelude

import Data.Aeson (Value)

import RequestId

data Error = Error {code :: Int, data_ :: Value, message :: String}
data JSONRPCError
    = JSONRPCError {error :: Error, id :: RequestId, jsonrpc :: String}
