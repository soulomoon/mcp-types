{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CompleteResult where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Meta_ = Meta_ {}
data Completion
    = Completion {hasMore :: Bool, total :: Int, values :: [Text]}
data CompleteResult
    = CompleteResult {completion :: Completion, meta_ :: Meta_}
