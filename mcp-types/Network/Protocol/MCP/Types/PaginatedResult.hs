{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PaginatedResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Meta_ = Meta_ {}
data PaginatedResult
    = PaginatedResult {meta_ :: Meta_, nextCursor :: Text}
