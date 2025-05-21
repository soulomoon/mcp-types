{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ClientResult where

import Prelude

import Data.Aeson (Value)

import Result
import CreateMessageResult
import ListRootsResult

type ClientResult = Either Result
                           (Either CreateMessageResult ListRootsResult)
