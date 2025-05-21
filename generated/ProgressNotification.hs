{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ProgressNotification where

import Prelude

import Data.Aeson (Value)

import ProgressToken

data Params
    = Params {message :: String,
              progress :: Double,
              progressToken :: ProgressToken,
              total :: Double}
data ProgressNotification
    = ProgressNotification {method :: String, params :: Params}
