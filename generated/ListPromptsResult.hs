{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListPromptsResult where

import Prelude

import Data.Aeson (Value)

import Prompt

data Meta_ = Meta_ {}
data ListPromptsResult
    = ListPromptsResult {meta_ :: Meta_,
                         nextCursor :: String,
                         prompts :: [Prompt]}
