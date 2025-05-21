{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module UnsubscribeRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {uri :: String}
data UnsubscribeRequest
    = UnsubscribeRequest {method :: String, params :: Params}
