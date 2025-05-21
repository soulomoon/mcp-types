{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module JSONRPCBatchResponse where

import Prelude

import Data.Aeson (Value)

import JSONRPCResponse
import JSONRPCError

type JSONRPCBatchResponse = [Either JSONRPCResponse JSONRPCError]
