{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ClientRequest where

import Prelude

import Data.Aeson (Value)

import InitializeRequest
import PingRequest
import ListResourcesRequest
import ReadResourceRequest
import SubscribeRequest
import UnsubscribeRequest
import ListPromptsRequest
import GetPromptRequest
import ListToolsRequest
import CallToolRequest
import SetLevelRequest
import CompleteRequest

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
