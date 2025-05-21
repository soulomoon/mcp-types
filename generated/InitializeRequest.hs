{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module InitializeRequest where

import Prelude

import Data.Aeson (Value)

import ClientCapabilities
import Implementation

data Params
    = Params {capabilities :: ClientCapabilities,
              clientInfo :: Implementation,
              protocolVersion :: String}
data InitializeRequest
    = InitializeRequest {method :: String, params :: Params}
