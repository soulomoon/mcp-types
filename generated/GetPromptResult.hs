{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module GetPromptResult where

import Prelude

import Data.Aeson (Value)

import PromptMessage

data Meta_ = Meta_ {}
data GetPromptResult
    = GetPromptResult {description :: String,
                       messages :: [PromptMessage],
                       meta_ :: Meta_}
