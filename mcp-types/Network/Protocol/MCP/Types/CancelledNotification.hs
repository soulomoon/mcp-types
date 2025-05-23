{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CancelledNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.RequestId

data Params = Params {reason :: Text, requestId :: RequestId}
data CancelledNotification
    = CancelledNotification {method :: Text, params :: Params}
