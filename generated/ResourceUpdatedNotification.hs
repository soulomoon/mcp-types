{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ResourceUpdatedNotification where

import Prelude

import Data.Aeson (Value)


data Params = Params {uri :: String}
data ResourceUpdatedNotification
    = ResourceUpdatedNotification {method :: String, params :: Params}
