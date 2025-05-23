{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ModelPreferences where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.ModelHint

data ModelPreferences
    = ModelPreferences {costPriority :: Double,
                        hints :: [ModelHint],
                        intelligencePriority :: Double,
                        speedPriority :: Double}
