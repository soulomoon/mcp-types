{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListRootsResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.Root

data Meta_ = Meta_ {}
data ListRootsResult
    = ListRootsResult {meta_ :: Meta_, roots :: [Root]}
