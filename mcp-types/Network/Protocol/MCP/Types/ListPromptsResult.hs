{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListPromptsResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Prompt

data Meta_ = Meta_ {}
data ListPromptsResult
    = ListPromptsResult {meta_ :: Meta_,
                         nextCursor :: Text,
                         prompts :: [Prompt]}
