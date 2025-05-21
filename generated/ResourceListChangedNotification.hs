{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ResourceListChangedNotification where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data ResourceListChangedNotification
    = ResourceListChangedNotification {method :: String,
                                       params :: Params}
