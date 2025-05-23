{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Cursor where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


type Cursor = Text
