{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module PaginatedResult where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data PaginatedResult
    = PaginatedResult {meta_ :: Meta_, nextCursor :: String}
