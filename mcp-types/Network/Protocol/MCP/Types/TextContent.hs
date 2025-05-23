{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.TextContent where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Annotations

data TextContent
    = TextContent {annotations :: Annotations,
                   text :: Text,
                   type_ :: Text}
