{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Implementation where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Implementation
    = Implementation {name :: Text, version :: Text}
