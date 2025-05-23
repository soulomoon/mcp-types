{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.GetPromptRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Arguments = Arguments {}
data Params = Params {arguments :: Arguments, name :: Text}
data GetPromptRequest
    = GetPromptRequest {method :: Text, params :: Params}
