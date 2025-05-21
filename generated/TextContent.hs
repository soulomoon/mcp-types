{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module TextContent where

import Prelude

import Data.Aeson (Value)

import Annotations

data TextContent
    = TextContent {annotations :: Annotations,
                   text :: String,
                   type_ :: String}
