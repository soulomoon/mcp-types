{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListPromptsRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {cursor :: String}
data ListPromptsRequest
    = ListPromptsRequest {method :: String, params :: Params}
