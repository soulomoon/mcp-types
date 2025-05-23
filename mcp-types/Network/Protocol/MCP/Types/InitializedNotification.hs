{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.InitializedNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data InitializedNotification
    = InitializedNotification {method :: Text, params :: Params}
