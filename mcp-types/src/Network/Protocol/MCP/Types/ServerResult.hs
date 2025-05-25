{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ServerResult where

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

import           Network.Protocol.MCP.Types.CallToolResult      (CallToolResult)
import           Network.Protocol.MCP.Types.CompleteResult      (CompleteResult)
import           Network.Protocol.MCP.Types.GetPromptResult     (GetPromptResult)
import           Network.Protocol.MCP.Types.InitializeResult    (InitializeResult)
import           Network.Protocol.MCP.Types.ListPromptsResult   (ListPromptsResult)
import           Network.Protocol.MCP.Types.ListResourcesResult (ListResourcesResult)
import           Network.Protocol.MCP.Types.ListToolsResult     (ListToolsResult)
import           Network.Protocol.MCP.Types.ReadResourceResult  (ReadResourceResult)
import           Network.Protocol.MCP.Types.Result              (Result)

type ServerResult = Either Result
                           (Either InitializeResult
                                   (Either ListResourcesResult
                                           (Either ReadResourceResult
                                                   (Either ListPromptsResult
                                                           (Either GetPromptResult
                                                                   (Either ListToolsResult
                                                                           (Either CallToolResult
                                                                                   CompleteResult)))))))
