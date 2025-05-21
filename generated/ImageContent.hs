{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ImageContent where

import Prelude

import Data.Aeson (Value)

import Annotations

data ImageContent
    = ImageContent {annotations :: Annotations,
                    data_ :: String,
                    mimeType :: String,
                    type_ :: String}
