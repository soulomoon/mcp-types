{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PaginatedRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {cursor :: Text}
data PaginatedRequest
    = PaginatedRequest {method :: Text, params :: Params}
