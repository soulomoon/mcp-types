{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.EmbeddedResource where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Annotations
import Network.Protocol.MCP.Types.TextResourceContents
import Network.Protocol.MCP.Types.BlobResourceContents

data EmbeddedResource
    = EmbeddedResource {annotations :: Annotations,
                        resource :: (Either TextResourceContents BlobResourceContents),
                        type_ :: Text}
