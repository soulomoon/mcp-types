{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ResourceTemplate where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Annotations

data ResourceTemplate
    = ResourceTemplate {annotations :: Annotations,
                        description :: Text,
                        mimeType :: Text,
                        name :: Text,
                        uriTemplate :: Text}
