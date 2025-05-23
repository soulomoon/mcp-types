{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListResourceTemplatesResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.ResourceTemplate

data Meta_ = Meta_ {}
data ListResourceTemplatesResult
    = ListResourceTemplatesResult {meta_ :: Meta_,
                                   nextCursor :: Text,
                                   resourceTemplates :: [ResourceTemplate]}
