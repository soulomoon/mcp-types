{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module CompleteResult where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Completion
    = Completion {hasMore :: Bool, total :: Int, values :: [String]}
data CompleteResult
    = CompleteResult {completion :: Completion, meta_ :: Meta_}
