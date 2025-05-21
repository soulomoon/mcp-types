{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListRootsResult where

import Prelude

import Data.Aeson (Value)

import Root

data Meta_ = Meta_ {}
data ListRootsResult
    = ListRootsResult {meta_ :: Meta_, roots :: [Root]}
