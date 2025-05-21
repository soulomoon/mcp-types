{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ResourceContents where

import Prelude

import Data.Aeson (Value)


data ResourceContents
    = ResourceContents {mimeType :: String, uri :: String}
