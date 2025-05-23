{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PromptArgument where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data PromptArgument
    = PromptArgument {description :: Text,
                      name :: Text,
                      required :: Bool}
