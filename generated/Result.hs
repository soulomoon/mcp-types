{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Result where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Result = Result {meta_ :: Meta_}
