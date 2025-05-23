{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ImageContent where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Annotations

data ImageContent
    = ImageContent {annotations :: Annotations,
                    data_ :: Text,
                    mimeType :: Text,
                    type_ :: Text}
