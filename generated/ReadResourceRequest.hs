{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ReadResourceRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {uri :: String}
data ReadResourceRequest
    = ReadResourceRequest {method :: String, params :: Params}
