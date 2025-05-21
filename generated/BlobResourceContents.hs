{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module BlobResourceContents where

import Prelude

import Data.Aeson (Value)


data BlobResourceContents
    = BlobResourceContents {blob :: String,
                            mimeType :: String,
                            uri :: String}
