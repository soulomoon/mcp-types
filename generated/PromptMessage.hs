{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module PromptMessage where

import Prelude

import Data.Aeson (Value)

import TextContent
import ImageContent
import AudioContent
import EmbeddedResource
import Role

data PromptMessage
    = PromptMessage {content :: (Either TextContent
                                        (Either ImageContent
                                                (Either AudioContent EmbeddedResource))),
                     role :: Role}
