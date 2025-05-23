{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ClientNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.CancelledNotification
import Network.Protocol.MCP.Types.InitializedNotification
import Network.Protocol.MCP.Types.ProgressNotification
import Network.Protocol.MCP.Types.RootsListChangedNotification

type ClientNotification = Either CancelledNotification
                                 (Either InitializedNotification
                                         (Either ProgressNotification RootsListChangedNotification))
