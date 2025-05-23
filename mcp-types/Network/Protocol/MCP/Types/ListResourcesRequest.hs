{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListResourcesRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {cursor :: Text}
data ListResourcesRequest
    = ListResourcesRequest {method :: Text, params :: Params}
