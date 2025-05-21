{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module CallToolResult where

import Prelude

import Data.Aeson (Value)

import TextContent
import ImageContent
import AudioContent
import EmbeddedResource

data Meta_ = Meta_ {}
data CallToolResult
    = CallToolResult {content :: [Either TextContent
                                         (Either ImageContent
                                                 (Either AudioContent EmbeddedResource))],
                      isError :: Bool,
                      meta_ :: Meta_}
