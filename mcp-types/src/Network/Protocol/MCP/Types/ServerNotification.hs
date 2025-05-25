{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DerivingVia #-}

module Network.Protocol.MCP.Types.ServerNotification where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import Test.QuickCheck (Arbitrary)
import Test.QuickCheck.Arbitrary.Generic (GenericArbitrary(..))
import qualified Utils

import Network.Protocol.MCP.Types.CancelledNotification(CancelledNotification)
import Network.Protocol.MCP.Types.ProgressNotification(ProgressNotification)
import Network.Protocol.MCP.Types.ResourceListChangedNotification(ResourceListChangedNotification)
import Network.Protocol.MCP.Types.ResourceUpdatedNotification(ResourceUpdatedNotification)
import Network.Protocol.MCP.Types.PromptListChangedNotification(PromptListChangedNotification)
import Network.Protocol.MCP.Types.ToolListChangedNotification(ToolListChangedNotification)
import Network.Protocol.MCP.Types.LoggingMessageNotification(LoggingMessageNotification)

type ServerNotification = Either CancelledNotification
                                 (Either ProgressNotification
                                         (Either ResourceListChangedNotification
                                                 (Either ResourceUpdatedNotification
                                                         (Either PromptListChangedNotification
                                                                 (Either ToolListChangedNotification
                                                                         LoggingMessageNotification)))))
