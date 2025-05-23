{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ServerNotification where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

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
