{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DerivingVia #-}

module Network.Protocol.MCP.Types.ClientRequest where

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

import Network.Protocol.MCP.Types.InitializeRequest(InitializeRequest)
import Network.Protocol.MCP.Types.PingRequest(PingRequest)
import Network.Protocol.MCP.Types.ListResourcesRequest(ListResourcesRequest)
import Network.Protocol.MCP.Types.ReadResourceRequest(ReadResourceRequest)
import Network.Protocol.MCP.Types.SubscribeRequest(SubscribeRequest)
import Network.Protocol.MCP.Types.UnsubscribeRequest(UnsubscribeRequest)
import Network.Protocol.MCP.Types.ListPromptsRequest(ListPromptsRequest)
import Network.Protocol.MCP.Types.GetPromptRequest(GetPromptRequest)
import Network.Protocol.MCP.Types.ListToolsRequest(ListToolsRequest)
import Network.Protocol.MCP.Types.CallToolRequest(CallToolRequest)
import Network.Protocol.MCP.Types.SetLevelRequest(SetLevelRequest)
import Network.Protocol.MCP.Types.CompleteRequest(CompleteRequest)

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
