{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Prompt where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.PromptArgument

data Prompt
    = Prompt {arguments :: [PromptArgument],
              description :: Text,
              name :: Text}
