{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListRootsRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.ProgressToken

data Meta_ = Meta_ {progressToken :: ProgressToken}
data Params = Params {meta_ :: Meta_}
data ListRootsRequest
    = ListRootsRequest {method :: Text, params :: Params}
