{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module CompleteRequest where

import Prelude

import Data.Aeson (Value)

import PromptReference
import ResourceReference

data Argument = Argument {name :: String, value :: String}
data Params
    = Params {argument :: Argument,
              ref :: (Either PromptReference ResourceReference)}
data CompleteRequest
    = CompleteRequest {method :: String, params :: Params}
