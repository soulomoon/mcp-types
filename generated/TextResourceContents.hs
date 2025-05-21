{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module TextResourceContents where

import Prelude

import Data.Aeson (Value)


data TextResourceContents
    = TextResourceContents {mimeType :: String,
                            text :: String,
                            uri :: String}
