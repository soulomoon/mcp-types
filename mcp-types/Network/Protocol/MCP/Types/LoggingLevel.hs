{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.LoggingLevel where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data LoggingLevel
    = Alert
    | Critical
    | Debug
    | Emergency
    | Error
    | Info
    | Notice
    | Warning
