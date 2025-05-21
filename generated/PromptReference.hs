{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module PromptReference where

import Prelude

import Data.Aeson (Value)


data PromptReference
    = PromptReference {name :: String, type_ :: String}
