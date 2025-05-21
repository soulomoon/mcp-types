{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListRootsRequest where

import Prelude

import Data.Aeson (Value)

import ProgressToken

data Meta_ = Meta_ {progressToken :: ProgressToken}
data Params = Params {meta_ :: Meta_}
data ListRootsRequest
    = ListRootsRequest {method :: String, params :: Params}
