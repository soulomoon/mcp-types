{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Role where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Role
    = Assistant
    | User
