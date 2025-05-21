{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module CallToolRequest where

import Prelude

import Data.Aeson (Value)


data Arguments = Arguments {}
data Params = Params {arguments :: Arguments, name :: String}
data CallToolRequest
    = CallToolRequest {method :: String, params :: Params}
