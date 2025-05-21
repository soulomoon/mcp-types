{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ServerRequest where

import Prelude

import Data.Aeson (Value)

import PingRequest
import CreateMessageRequest
import ListRootsRequest

type ServerRequest = Either PingRequest
                            (Either CreateMessageRequest ListRootsRequest)
