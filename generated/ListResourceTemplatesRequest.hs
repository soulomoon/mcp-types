{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListResourceTemplatesRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {cursor :: String}
data ListResourceTemplatesRequest
    = ListResourceTemplatesRequest {method :: String, params :: Params}
