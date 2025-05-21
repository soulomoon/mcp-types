{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ListResourceTemplatesResult where

import Prelude

import Data.Aeson (Value)

import ResourceTemplate

data Meta_ = Meta_ {}
data ListResourceTemplatesResult
    = ListResourceTemplatesResult {meta_ :: Meta_,
                                   nextCursor :: String,
                                   resourceTemplates :: [ResourceTemplate]}
