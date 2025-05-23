{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CompleteRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.PromptReference
import Network.Protocol.MCP.Types.ResourceReference

data Argument = Argument {name :: Text, value :: Text}
data Params
    = Params {argument :: Argument,
              ref :: (Either PromptReference ResourceReference)}
data CompleteRequest
    = CompleteRequest {method :: Text, params :: Params}
