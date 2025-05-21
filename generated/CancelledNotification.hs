{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module CancelledNotification where

import Prelude

import Data.Aeson (Value)

import RequestId

data Params = Params {reason :: String, requestId :: RequestId}
data CancelledNotification
    = CancelledNotification {method :: String, params :: Params}
