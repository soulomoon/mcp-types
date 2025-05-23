{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ReadResourceRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {uri :: Text}
data ReadResourceRequest
    = ReadResourceRequest {method :: Text, params :: Params}
