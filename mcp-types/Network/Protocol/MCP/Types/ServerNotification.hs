{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ServerNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.CancelledNotification
import Network.Protocol.MCP.Types.ProgressNotification
import Network.Protocol.MCP.Types.ResourceListChangedNotification
import Network.Protocol.MCP.Types.ResourceUpdatedNotification
import Network.Protocol.MCP.Types.PromptListChangedNotification
import Network.Protocol.MCP.Types.ToolListChangedNotification
import Network.Protocol.MCP.Types.LoggingMessageNotification

type ServerNotification = Either CancelledNotification
                                 (Either ProgressNotification
                                         (Either ResourceListChangedNotification
                                                 (Either ResourceUpdatedNotification
                                                         (Either PromptListChangedNotification
                                                                 (Either ToolListChangedNotification
                                                                         LoggingMessageNotification)))))
