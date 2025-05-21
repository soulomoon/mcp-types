{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListResourcesRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {cursor :: String}
data ListResourcesRequest
    = ListResourcesRequest {method :: String, params :: Params}
