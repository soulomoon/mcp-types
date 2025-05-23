{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.UnsubscribeRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {uri :: Text}
data UnsubscribeRequest
    = UnsubscribeRequest {method :: Text, params :: Params}
