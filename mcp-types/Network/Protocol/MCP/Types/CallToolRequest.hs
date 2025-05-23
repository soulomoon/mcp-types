{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CallToolRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Arguments = Arguments {}
data Params = Params {arguments :: Arguments, name :: Text}
data CallToolRequest
    = CallToolRequest {method :: Text, params :: Params}
