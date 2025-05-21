{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Prompt where

import Prelude

import Data.Aeson (Value)

import PromptArgument

data Prompt
    = Prompt {arguments :: [PromptArgument],
              description :: String,
              name :: String}
