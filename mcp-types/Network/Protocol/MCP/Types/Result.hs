{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Result where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Meta_ = Meta_ {}
data Result = Result {meta_ :: Meta_}
