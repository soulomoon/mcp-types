{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module JSONRPCRequest where

import Prelude

import Data.Aeson (Value)

import RequestId
import ProgressToken

data Meta_ = Meta_ {progressToken :: ProgressToken}
data Params = Params {meta_ :: Meta_}
data JSONRPCRequest
    = JSONRPCRequest {id :: RequestId,
                      jsonrpc :: String,
                      method :: String,
                      params :: Params}
