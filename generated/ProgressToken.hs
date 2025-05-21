{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ProgressToken where

import Prelude

import Data.Aeson (Value)


data ProgressToken
    = ProgressTokenString String
    | ProgressTokenInteger Integer
