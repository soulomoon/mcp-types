{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Request where

import Prelude

import Data.Aeson (Value)

import ProgressToken

data Meta_ = Meta_ {progressToken :: ProgressToken}
data Params = Params {meta_ :: Meta_}
data Request = Request {method :: String, params :: Params}
