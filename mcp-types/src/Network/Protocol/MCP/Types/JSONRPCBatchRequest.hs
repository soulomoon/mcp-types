{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCBatchRequest where

import           Data.Aeson                                     (FromJSON,
                                                                 Options (..),
                                                                 ToJSON, Value,
                                                                 defaultOptions,
                                                                 genericParseJSON,
                                                                 genericToJSON,
                                                                 parseJSON,
                                                                 toJSON)
import qualified Data.Aeson                                     as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                                     as Data.Aeson.Types.Internal
import qualified Data.Aeson                                     as Data.Aeson.Types.ToJSON
import           Data.Text                                      (Text)
import           GHC.Generics                                   (Generic)
import           Prelude
import           Test.QuickCheck                                (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic              (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.JSONRPCNotification (JSONRPCNotification)
import           Network.Protocol.MCP.Types.JSONRPCRequest      (JSONRPCRequest)

type JSONRPCBatchRequest = [Either JSONRPCRequest
                                   JSONRPCNotification]
