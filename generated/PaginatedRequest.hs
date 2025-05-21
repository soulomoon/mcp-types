{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module PaginatedRequest where

import Prelude

import Data.Aeson (Value)


data Params = Params {cursor :: String}
data PaginatedRequest
    = PaginatedRequest {method :: String, params :: Params}
