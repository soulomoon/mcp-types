{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module JSONRPCBatchRequest where

import Prelude

import Data.Aeson (Value)

import JSONRPCRequest
import JSONRPCNotification

type JSONRPCBatchRequest = [Either JSONRPCRequest
                                   JSONRPCNotification]
