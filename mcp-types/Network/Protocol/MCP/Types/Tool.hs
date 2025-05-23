{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Tool where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.ToolAnnotations

data Properties = Properties {}
data InputSchema
    = InputSchema {properties :: Properties,
                   required :: [Text],
                   type_ :: Text}
data Tool
    = Tool {annotations :: ToolAnnotations,
            description :: Text,
            inputSchema :: InputSchema,
            name :: Text}
