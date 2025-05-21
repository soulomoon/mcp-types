{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ModelPreferences where

import Prelude

import Data.Aeson (Value)

import ModelHint

data ModelPreferences
    = ModelPreferences {costPriority :: Double,
                        hints :: [ModelHint],
                        intelligencePriority :: Double,
                        speedPriority :: Double}
