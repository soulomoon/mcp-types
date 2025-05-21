{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module LoggingMessageNotification where

import Prelude

import Data.Aeson (Value)

import LoggingLevel

data Params
    = Params {data_ :: Value, level :: LoggingLevel, logger :: String}
data LoggingMessageNotification
    = LoggingMessageNotification {method :: String, params :: Params}
