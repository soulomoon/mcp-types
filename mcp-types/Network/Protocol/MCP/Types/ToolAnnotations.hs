{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ToolAnnotations where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data ToolAnnotations
    = ToolAnnotations {destructiveHint :: Bool,
                       idempotentHint :: Bool,
                       openWorldHint :: Bool,
                       readOnlyHint :: Bool,
                       title :: Text}
