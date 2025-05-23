{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.LoggingMessageNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.LoggingLevel

data Params
    = Params {data_ :: Value, level :: LoggingLevel, logger :: Text}
data LoggingMessageNotification
    = LoggingMessageNotification {method :: Text, params :: Params}
