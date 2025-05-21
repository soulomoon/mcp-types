{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Tool where

import Prelude

import Data.Aeson (Value)

import ToolAnnotations

data Properties = Properties {}
data InputSchema
    = InputSchema {properties :: Properties,
                   required :: [String],
                   type_ :: String}
data Tool
    = Tool {annotations :: ToolAnnotations,
            description :: String,
            inputSchema :: InputSchema,
            name :: String}
