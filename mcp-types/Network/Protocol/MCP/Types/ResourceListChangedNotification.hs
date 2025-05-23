{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ResourceListChangedNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data ResourceListChangedNotification
    = ResourceListChangedNotification {method :: Text,
                                       params :: Params}
