{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ReadResourceResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.TextResourceContents
import Network.Protocol.MCP.Types.BlobResourceContents

data Meta_ = Meta_ {}
data ReadResourceResult
    = ReadResourceResult {meta_ :: Meta_,
                          contents :: [Either TextResourceContents BlobResourceContents]}
