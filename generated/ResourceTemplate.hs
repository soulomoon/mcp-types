{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ResourceTemplate where

import Prelude

import Data.Aeson (Value)

import Annotations

data ResourceTemplate
    = ResourceTemplate {annotations :: Annotations,
                        description :: String,
                        mimeType :: String,
                        name :: String,
                        uriTemplate :: String}
