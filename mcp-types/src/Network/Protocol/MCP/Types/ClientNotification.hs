{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ClientNotification where

import           Data.Aeson                                              (FromJSON,
                                                                          Options (..),
                                                                          ToJSON,
                                                                          Value,
                                                                          defaultOptions,
                                                                          genericParseJSON,
                                                                          genericToJSON,
                                                                          parseJSON,
                                                                          toJSON)
import qualified Data.Aeson                                              as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                                              as Data.Aeson.Types.Internal
import qualified Data.Aeson                                              as Data.Aeson.Types.ToJSON
import           Data.Text                                               (Text)
import           GHC.Generics                                            (Generic)
import           Prelude
import           Test.QuickCheck                                         (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic                       (GenericArbitrary (..))
import qualified Utils
import           Utils                                                   (Sum)

import           Network.Protocol.MCP.Types.CancelledNotification        (CancelledNotification)
import           Network.Protocol.MCP.Types.InitializedNotification      (InitializedNotification)
import           Network.Protocol.MCP.Types.ProgressNotification         (ProgressNotification)
import           Network.Protocol.MCP.Types.RootsListChangedNotification (RootsListChangedNotification)

type ClientNotification = Sum CancelledNotification
                              (Sum InitializedNotification
                                   (Sum ProgressNotification RootsListChangedNotification))
