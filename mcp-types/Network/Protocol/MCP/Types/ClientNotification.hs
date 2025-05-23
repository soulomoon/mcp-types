{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ClientNotification where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

import Network.Protocol.MCP.Types.CancelledNotification
import Network.Protocol.MCP.Types.InitializedNotification
import Network.Protocol.MCP.Types.ProgressNotification
import Network.Protocol.MCP.Types.RootsListChangedNotification

type ClientNotification = Either CancelledNotification
                                 (Either InitializedNotification
                                         (Either ProgressNotification RootsListChangedNotification))
