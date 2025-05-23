{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.AudioContent where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Annotations

data AudioContent
    = AudioContent {annotations :: Annotations,
                    data_ :: Text,
                    mimeType :: Text,
                    type_ :: Text}
