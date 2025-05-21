{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module CreateMessageRequest where

import Prelude

import Data.Aeson (Value)

import SamplingMessage
import ModelPreferences

data Metadata = Metadata {}
data Params
    = Params {includeContext :: String,
              maxTokens :: Int,
              messages :: [SamplingMessage],
              metadata :: Metadata,
              modelPreferences :: ModelPreferences,
              stopSequences :: [String],
              systemPrompt :: String,
              temperature :: Double}
data CreateMessageRequest
    = CreateMessageRequest {method :: String, params :: Params}
