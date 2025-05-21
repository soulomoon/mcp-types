{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ToolListChangedNotification where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data ToolListChangedNotification
    = ToolListChangedNotification {method :: String, params :: Params}
