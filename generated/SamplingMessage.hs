{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module SamplingMessage where

import Prelude

import Data.Aeson (Value)

import TextContent
import ImageContent
import AudioContent
import Role

data SamplingMessage
    = SamplingMessage {content :: (Either TextContent
                                          (Either ImageContent AudioContent)),
                       role :: Role}
