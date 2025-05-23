{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListToolsResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Tool

data Meta_ = Meta_ {}
data ListToolsResult
    = ListToolsResult {meta_ :: Meta_,
                       nextCursor :: Text,
                       tools :: [Tool]}
