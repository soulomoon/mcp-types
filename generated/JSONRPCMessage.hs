{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module JSONRPCMessage where

import Prelude

import Data.Aeson (Value)

import JSONRPCRequest
import JSONRPCNotification
import JSONRPCRequest
import JSONRPCNotification
import JSONRPCResponse
import JSONRPCError
import JSONRPCResponse
import JSONRPCError

type JSONRPCMessage = Either JSONRPCRequest
                             (Either JSONRPCNotification
                                     (Either [Either JSONRPCRequest JSONRPCNotification]
                                             (Either JSONRPCResponse
                                                     (Either JSONRPCError
                                                             [Either JSONRPCResponse
                                                                     JSONRPCError]))))
