{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListToolsRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {cursor :: String}
data ListToolsRequest
    = ListToolsRequest {method :: String, params :: Params}
