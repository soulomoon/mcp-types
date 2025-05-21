{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module SetLevelRequest where

import Prelude

import Data.Aeson (Value)

import LoggingLevel

data Params = Params {level :: LoggingLevel}
data SetLevelRequest
    = SetLevelRequest {method :: String, params :: Params}
