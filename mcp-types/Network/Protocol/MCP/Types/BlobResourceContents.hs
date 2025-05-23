{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.BlobResourceContents where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data BlobResourceContents
    = BlobResourceContents {blob :: Text,
                            mimeType :: Text,
                            uri :: Text}
