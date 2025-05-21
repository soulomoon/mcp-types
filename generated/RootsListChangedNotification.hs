{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module RootsListChangedNotification where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data RootsListChangedNotification
    = RootsListChangedNotification {method :: String, params :: Params}
