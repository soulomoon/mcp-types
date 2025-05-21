{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module SubscribeRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {uri :: String}
data SubscribeRequest
    = SubscribeRequest {method :: String, params :: Params}
