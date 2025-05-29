{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ServerRequest where

import           Data.Aeson                                      (FromJSON,
                                                                  Options (..),
                                                                  ToJSON, Value,
                                                                  defaultOptions,
                                                                  genericParseJSON,
                                                                  genericToJSON,
                                                                  parseJSON,
                                                                  toJSON)
import qualified Data.Aeson                                      as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                                      as Data.Aeson.Types.Internal
import qualified Data.Aeson                                      as Data.Aeson.Types.ToJSON
import           Data.Text                                       (Text)
import           GHC.Generics                                    (Generic)
import           Prelude
import           Test.QuickCheck                                 (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic               (GenericArbitrary (..))
import qualified Utils
import           Utils                                           (Sum)

import           Network.Protocol.MCP.Types.CreateMessageRequest (CreateMessageRequest)
import           Network.Protocol.MCP.Types.ListRootsRequest     (ListRootsRequest)
import           Network.Protocol.MCP.Types.PingRequest          (PingRequest)

type ServerRequest = Sum PingRequest
                         (Sum CreateMessageRequest ListRootsRequest)
