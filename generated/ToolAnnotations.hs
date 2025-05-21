{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ToolAnnotations where

import Prelude

import Data.Aeson (Value)


data ToolAnnotations
    = ToolAnnotations {destructiveHint :: Bool,
                       idempotentHint :: Bool,
                       openWorldHint :: Bool,
                       readOnlyHint :: Bool,
                       title :: String}
