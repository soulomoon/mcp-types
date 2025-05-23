{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.SetLevelRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.LoggingLevel

data Params = Params {level :: LoggingLevel}
data SetLevelRequest
    = SetLevelRequest {method :: Text, params :: Params}
