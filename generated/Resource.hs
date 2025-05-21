{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Resource where

import Prelude

import Data.Aeson (Value)

import Annotations

data Resource
    = Resource {annotations :: Annotations,
                description :: String,
                mimeType :: String,
                name :: String,
                size :: Int,
                uri :: String}
