{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ResourceUpdatedNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Params = Params {uri :: Text}
data ResourceUpdatedNotification
    = ResourceUpdatedNotification {method :: Text, params :: Params}
