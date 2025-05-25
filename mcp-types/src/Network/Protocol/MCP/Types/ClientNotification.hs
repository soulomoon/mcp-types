{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DerivingVia #-}

module Network.Protocol.MCP.Types.ClientNotification where

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
import Network.Protocol.MCP.Types.InitializedNotification(InitializedNotification)
import Network.Protocol.MCP.Types.ProgressNotification(ProgressNotification)
import Network.Protocol.MCP.Types.RootsListChangedNotification(RootsListChangedNotification)

type ClientNotification = Either CancelledNotification
                                 (Either InitializedNotification
                                         (Either ProgressNotification RootsListChangedNotification))
