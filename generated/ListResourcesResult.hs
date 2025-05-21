{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListResourcesResult where

import Prelude

import Data.Aeson (Value)

import Resource

data Meta_ = Meta_ {}
data ListResourcesResult
    = ListResourcesResult {meta_ :: Meta_,
                           nextCursor :: String,
                           resources :: [Resource]}
