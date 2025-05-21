{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ModelHint where

import Prelude

import Data.Aeson (Value)


data ModelHint = ModelHint {name :: String}
