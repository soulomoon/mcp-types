{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.SubscribeRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {uri :: Text}
data SubscribeRequest
    = SubscribeRequest {method :: Text, params :: Params}
