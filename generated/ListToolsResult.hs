{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListToolsResult where

import Prelude

import Data.Aeson (Value)

import Tool

data Meta_ = Meta_ {}
data ListToolsResult
    = ListToolsResult {meta_ :: Meta_,
                       nextCursor :: String,
                       tools :: [Tool]}
