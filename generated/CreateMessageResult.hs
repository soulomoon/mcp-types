{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module CreateMessageResult where

import Prelude

import Data.Aeson (Value)

import TextContent
import ImageContent
import AudioContent
import Role

data Meta_ = Meta_ {}
data CreateMessageResult
    = CreateMessageResult {content :: (Either TextContent
                                              (Either ImageContent AudioContent)),
                           meta_ :: Meta_,
                           model :: String,
                           role :: Role,
                           stopReason :: String}
