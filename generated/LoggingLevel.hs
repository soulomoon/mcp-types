{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module LoggingLevel where

import Prelude

import Data.Aeson (Value)


data LoggingLevel
    = Alert
    | Critical
    | Debug
    | Emergency
    | Error
    | Info
    | Notice
    | Warning
