{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListPromptsRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {cursor :: Text}
data ListPromptsRequest
    = ListPromptsRequest {method :: Text, params :: Params}
