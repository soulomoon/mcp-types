{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module AudioContent where

import Prelude

import Data.Aeson (Value)

import Annotations

data AudioContent
    = AudioContent {annotations :: Annotations,
                    data_ :: String,
                    mimeType :: String,
                    type_ :: String}
