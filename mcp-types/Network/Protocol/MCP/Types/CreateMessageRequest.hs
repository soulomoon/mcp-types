{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CreateMessageRequest where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.SamplingMessage
import Network.Protocol.MCP.Types.ModelPreferences

data Metadata = Metadata {}
data Params
    = Params {includeContext :: Text,
              maxTokens :: Int,
              messages :: [SamplingMessage],
              metadata :: Metadata,
              modelPreferences :: ModelPreferences,
              stopSequences :: [Text],
              systemPrompt :: Text,
              temperature :: Double}
data CreateMessageRequest
    = CreateMessageRequest {method :: Text, params :: Params}
