{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ServerResult where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

import Network.Protocol.MCP.Types.Result
import Network.Protocol.MCP.Types.InitializeResult
import Network.Protocol.MCP.Types.ListResourcesResult
import Network.Protocol.MCP.Types.ReadResourceResult
import Network.Protocol.MCP.Types.ListPromptsResult
import Network.Protocol.MCP.Types.GetPromptResult
import Network.Protocol.MCP.Types.ListToolsResult
import Network.Protocol.MCP.Types.CallToolResult
import Network.Protocol.MCP.Types.CompleteResult

type ServerResult = Either Result
                           (Either InitializeResult
                                   (Either ListResourcesResult
                                           (Either ReadResourceResult
                                                   (Either ListPromptsResult
                                                           (Either GetPromptResult
                                                                   (Either ListToolsResult
                                                                           (Either CallToolResult
                                                                                   CompleteResult)))))))
