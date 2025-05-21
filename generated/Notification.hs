{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Notification where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data Notification
    = Notification {method :: String, params :: Params}
