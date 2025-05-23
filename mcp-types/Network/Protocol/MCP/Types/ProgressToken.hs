{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ProgressToken where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data ProgressToken
    = ProgressTokenString String
    | ProgressTokenInteger Integer
