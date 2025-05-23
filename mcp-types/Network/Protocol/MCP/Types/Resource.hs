{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Resource where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Annotations

data Resource
    = Resource {annotations :: Annotations,
                description :: Text,
                mimeType :: Text,
                name :: Text,
                size :: Int,
                uri :: Text}
