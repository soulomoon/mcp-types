{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module InitializedNotification where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data InitializedNotification
    = InitializedNotification {method :: String, params :: Params}
