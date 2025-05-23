{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListResourceTemplatesRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {cursor :: Text}
data ListResourceTemplatesRequest
    = ListResourceTemplatesRequest {method :: Text, params :: Params}
