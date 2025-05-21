{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ResourceReference where

import Prelude

import Data.Aeson (Value)


data ResourceReference
    = ResourceReference {type_ :: String, uri :: String}
