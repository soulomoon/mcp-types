{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module GetPromptRequest where

import Prelude

import Data.Aeson (Value)


data Arguments = Arguments {}
data Params = Params {arguments :: Arguments, name :: String}
data GetPromptRequest
    = GetPromptRequest {method :: String, params :: Params}
