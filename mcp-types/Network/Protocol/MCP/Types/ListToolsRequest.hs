{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListToolsRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {cursor :: Text}
data ListToolsRequest
    = ListToolsRequest {method :: Text, params :: Params}
