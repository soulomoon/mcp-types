{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module EmbeddedResource where

import Prelude

import Data.Aeson (Value)

import Annotations
import TextResourceContents
import BlobResourceContents

data EmbeddedResource
    = EmbeddedResource {annotations :: Annotations,
                        resource :: (Either TextResourceContents BlobResourceContents),
                        type_ :: String}
