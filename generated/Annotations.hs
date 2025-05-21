{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Annotations where

import Prelude

import Data.Aeson (Value)

import Role

data Annotations
    = Annotations {audience :: [Role], priority :: Double}
