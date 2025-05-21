{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module InitializeResult where

import Prelude

import Data.Aeson (Value)

import ServerCapabilities
import Implementation

data Meta_ = Meta_ {}
data InitializeResult
    = InitializeResult {capabilities :: ServerCapabilities,
                        instructions :: String,
                        meta_ :: Meta_,
                        protocolVersion :: String,
                        serverInfo :: Implementation}
