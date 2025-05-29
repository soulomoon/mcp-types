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
import           Utils                                          (Sum)

import           Network.Protocol.MCP.Types.CallToolResult      (CallToolResult)
import           Network.Protocol.MCP.Types.CompleteResult      (CompleteResult)
import           Network.Protocol.MCP.Types.GetPromptResult     (GetPromptResult)
import           Network.Protocol.MCP.Types.InitializeResult    (InitializeResult)
import           Network.Protocol.MCP.Types.ListPromptsResult   (ListPromptsResult)
import           Network.Protocol.MCP.Types.ListResourcesResult (ListResourcesResult)
import           Network.Protocol.MCP.Types.ListToolsResult     (ListToolsResult)
import           Network.Protocol.MCP.Types.ReadResourceResult  (ReadResourceResult)
import           Network.Protocol.MCP.Types.Result              (Result)

type ServerResult = Sum Result
                        (Sum InitializeResult
                             (Sum ListResourcesResult
                                  (Sum ReadResourceResult
                                       (Sum ListPromptsResult
                                            (Sum GetPromptResult
                                                 (Sum ListToolsResult
                                                      (Sum CallToolResult CompleteResult)))))))
