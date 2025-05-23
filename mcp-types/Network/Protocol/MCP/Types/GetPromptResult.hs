{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.GetPromptResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.PromptMessage

data Meta_ = Meta_ {}
data GetPromptResult
    = GetPromptResult {description :: Text,
                       messages :: [PromptMessage],
                       meta_ :: Meta_}
