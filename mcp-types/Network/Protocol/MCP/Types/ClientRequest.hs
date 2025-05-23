{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ClientRequest where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils

import Network.Protocol.MCP.Types.InitializeRequest
import Network.Protocol.MCP.Types.PingRequest
import Network.Protocol.MCP.Types.ListResourcesRequest
import Network.Protocol.MCP.Types.ReadResourceRequest
import Network.Protocol.MCP.Types.SubscribeRequest
import Network.Protocol.MCP.Types.UnsubscribeRequest
import Network.Protocol.MCP.Types.ListPromptsRequest
import Network.Protocol.MCP.Types.GetPromptRequest
import Network.Protocol.MCP.Types.ListToolsRequest
import Network.Protocol.MCP.Types.CallToolRequest
import Network.Protocol.MCP.Types.SetLevelRequest
import Network.Protocol.MCP.Types.CompleteRequest

type ClientRequest = Either InitializeRequest
                            (Either PingRequest
                                    (Either ListResourcesRequest
                                            (Either ReadResourceRequest
                                                    (Either SubscribeRequest
                                                            (Either UnsubscribeRequest
                                                                    (Either ListPromptsRequest
                                                                            (Either GetPromptRequest
                                                                                    (Either ListToolsRequest
                                                                                            (Either CallToolRequest
                                                                                                    (Either SetLevelRequest
                                                                                                            CompleteRequest))))))))))
