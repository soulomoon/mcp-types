{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ReadResourceResult where

import Prelude

import Data.Aeson (Value)

import TextResourceContents
import BlobResourceContents

data Meta_ = Meta_ {}
data ReadResourceResult
    = ReadResourceResult {contents :: [Either TextResourceContents
                                              BlobResourceContents],
                          meta_ :: Meta_}
