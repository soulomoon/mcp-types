{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ResourceContents where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data ResourceContents
    = ResourceContents {mimeType :: Text, uri :: Text}
