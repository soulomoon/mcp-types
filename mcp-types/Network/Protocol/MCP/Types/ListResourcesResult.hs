{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListResourcesResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Resource

data Meta_ = Meta_ {}
data ListResourcesResult
    = ListResourcesResult {meta_ :: Meta_,
                           nextCursor :: Text,
                           resources :: [Resource]}
