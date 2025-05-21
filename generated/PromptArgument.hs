{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module PromptArgument where

import Prelude

import Data.Aeson (Value)


data PromptArgument
    = PromptArgument {description :: String,
                      name :: String,
                      required :: Bool}
