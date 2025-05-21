{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module PingRequest where

import Prelude

import Data.Aeson (Value)

import ProgressToken

data Meta_ = Meta_ {progressToken :: ProgressToken}
data Params = Params {meta_ :: Meta_}
data PingRequest = PingRequest {method :: String, params :: Params}
