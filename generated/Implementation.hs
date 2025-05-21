{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Implementation where

import Prelude

import Data.Aeson (Value)


data Implementation
    = Implementation {name :: String, version :: String}
