{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}
module Props where

import           Test.Tasty                                                 (TestTree,
                                                                             testGroup)
import           Test.Tasty.QuickCheck                                      (testProperty)
import           Utils

import           Network.Protocol.MCP.Types.Annotations                     (Annotations)
import           Network.Protocol.MCP.Types.AudioContent                    (AudioContent)
import           Network.Protocol.MCP.Types.BlobResourceContents            (BlobResourceContents)
import           Network.Protocol.MCP.Types.CallToolRequest                 (CallToolRequest)
import           Network.Protocol.MCP.Types.CallToolResult                  (CallToolResult)
import           Network.Protocol.MCP.Types.CancelledNotification           (CancelledNotification)
import           Network.Protocol.MCP.Types.ClientCapabilities              (ClientCapabilities)
import           Network.Protocol.MCP.Types.ClientNotification              (ClientNotification)
import           Network.Protocol.MCP.Types.ClientRequest                   (ClientRequest)
import           Network.Protocol.MCP.Types.ClientResult                    (ClientResult)
import           Network.Protocol.MCP.Types.CompleteRequest                 (CompleteRequest)
import           Network.Protocol.MCP.Types.CompleteResult                  (CompleteResult)
import           Network.Protocol.MCP.Types.CreateMessageRequest            (CreateMessageRequest)
import           Network.Protocol.MCP.Types.CreateMessageResult             (CreateMessageResult)
import           Network.Protocol.MCP.Types.Cursor                          (Cursor)
import           Network.Protocol.MCP.Types.EmbeddedResource                (EmbeddedResource)
import           Network.Protocol.MCP.Types.EmptyResult                     (EmptyResult)
import           Network.Protocol.MCP.Types.GetPromptRequest                (GetPromptRequest)
import           Network.Protocol.MCP.Types.GetPromptResult                 (GetPromptResult)
import           Network.Protocol.MCP.Types.ImageContent                    (ImageContent)
import           Network.Protocol.MCP.Types.Implementation                  (Implementation)
import           Network.Protocol.MCP.Types.InitializedNotification         (InitializedNotification)
import           Network.Protocol.MCP.Types.InitializeRequest               (InitializeRequest)
import           Network.Protocol.MCP.Types.InitializeResult                (InitializeResult)
import           Network.Protocol.MCP.Types.JSONRPCBatchRequest             (JSONRPCBatchRequest)
import           Network.Protocol.MCP.Types.JSONRPCBatchResponse            (JSONRPCBatchResponse)
import           Network.Protocol.MCP.Types.JSONRPCError                    (JSONRPCError)
import           Network.Protocol.MCP.Types.JSONRPCMessage                  (JSONRPCMessage)
import           Network.Protocol.MCP.Types.JSONRPCNotification             (JSONRPCNotification)
import           Network.Protocol.MCP.Types.JSONRPCRequest                  (JSONRPCRequest)
import           Network.Protocol.MCP.Types.JSONRPCResponse                 (JSONRPCResponse)
import           Network.Protocol.MCP.Types.ListPromptsRequest              (ListPromptsRequest)
import           Network.Protocol.MCP.Types.ListPromptsResult               (ListPromptsResult)
import           Network.Protocol.MCP.Types.ListResourcesRequest            (ListResourcesRequest)
import           Network.Protocol.MCP.Types.ListResourcesResult             (ListResourcesResult)
import           Network.Protocol.MCP.Types.ListResourceTemplatesRequest    (ListResourceTemplatesRequest)
import           Network.Protocol.MCP.Types.ListResourceTemplatesResult     (ListResourceTemplatesResult)
import           Network.Protocol.MCP.Types.ListRootsRequest                (ListRootsRequest)
import           Network.Protocol.MCP.Types.ListRootsResult                 (ListRootsResult)
import           Network.Protocol.MCP.Types.ListToolsRequest                (ListToolsRequest)
import           Network.Protocol.MCP.Types.ListToolsResult                 (ListToolsResult)
import           Network.Protocol.MCP.Types.LoggingLevel                    (LoggingLevel)
import           Network.Protocol.MCP.Types.LoggingMessageNotification      (LoggingMessageNotification)
import           Network.Protocol.MCP.Types.ModelHint                       (ModelHint)
import           Network.Protocol.MCP.Types.ModelPreferences                (ModelPreferences)
import           Network.Protocol.MCP.Types.Notification                    (Notification)
import           Network.Protocol.MCP.Types.PaginatedRequest                (PaginatedRequest)
import           Network.Protocol.MCP.Types.PaginatedResult                 (PaginatedResult)
import           Network.Protocol.MCP.Types.PingRequest                     (PingRequest)
import           Network.Protocol.MCP.Types.ProgressNotification            (ProgressNotification)
import           Network.Protocol.MCP.Types.ProgressToken                   (ProgressToken)
import           Network.Protocol.MCP.Types.Prompt                          (Prompt)
import           Network.Protocol.MCP.Types.PromptArgument                  (PromptArgument)
import           Network.Protocol.MCP.Types.PromptListChangedNotification   (PromptListChangedNotification)
import           Network.Protocol.MCP.Types.PromptMessage                   (PromptMessage)
import           Network.Protocol.MCP.Types.PromptReference                 (PromptReference)
import           Network.Protocol.MCP.Types.ReadResourceRequest             (ReadResourceRequest)
import           Network.Protocol.MCP.Types.ReadResourceResult              (ReadResourceResult)
import           Network.Protocol.MCP.Types.Request                         (Request)
import           Network.Protocol.MCP.Types.RequestId                       (RequestId)
import           Network.Protocol.MCP.Types.Resource                        (Resource)
import           Network.Protocol.MCP.Types.ResourceContents                (ResourceContents)
import           Network.Protocol.MCP.Types.ResourceListChangedNotification (ResourceListChangedNotification)
import           Network.Protocol.MCP.Types.ResourceReference               (ResourceReference)
import           Network.Protocol.MCP.Types.ResourceTemplate                (ResourceTemplate)
import           Network.Protocol.MCP.Types.ResourceUpdatedNotification     (ResourceUpdatedNotification)
import           Network.Protocol.MCP.Types.Result                          (Result)
import           Network.Protocol.MCP.Types.Role                            (Role)
import           Network.Protocol.MCP.Types.Root                            (Root)
import           Network.Protocol.MCP.Types.RootsListChangedNotification    (RootsListChangedNotification)
import           Network.Protocol.MCP.Types.SamplingMessage                 (SamplingMessage)
import           Network.Protocol.MCP.Types.ServerCapabilities              (ServerCapabilities)
import           Network.Protocol.MCP.Types.ServerNotification              (ServerNotification)
import           Network.Protocol.MCP.Types.ServerRequest                   (ServerRequest)
import           Network.Protocol.MCP.Types.ServerResult                    (ServerResult)
import           Network.Protocol.MCP.Types.SetLevelRequest                 (SetLevelRequest)
import           Network.Protocol.MCP.Types.SubscribeRequest                (SubscribeRequest)
import           Network.Protocol.MCP.Types.TextContent                     (TextContent)
import           Network.Protocol.MCP.Types.TextResourceContents            (TextResourceContents)
import           Network.Protocol.MCP.Types.Tool                            (Tool)
import           Network.Protocol.MCP.Types.ToolAnnotations                 (ToolAnnotations)
import           Network.Protocol.MCP.Types.ToolListChangedNotification     (ToolListChangedNotification)
import           Network.Protocol.MCP.Types.UnsubscribeRequest              (UnsubscribeRequest)


allProps :: TestTree
allProps = testGroup "JSON roundtrip properties" [testProperty "Annotations" (mkPropJsonRoundtrip @Annotations),
                                                  testProperty "AudioContent" (mkPropJsonRoundtrip @AudioContent),
                                                  testProperty "BlobResourceContents" (mkPropJsonRoundtrip @BlobResourceContents),
                                                  testProperty "CallToolRequest" (mkPropJsonRoundtrip @CallToolRequest),
                                                  testProperty "CallToolResult" (mkPropJsonRoundtrip @CallToolResult),
                                                  testProperty "CancelledNotification" (mkPropJsonRoundtrip @CancelledNotification),
                                                  testProperty "ClientCapabilities" (mkPropJsonRoundtrip @ClientCapabilities),
                                                  testProperty "ClientNotification" (mkPropJsonRoundtrip @ClientNotification),
                                                  testProperty "ClientRequest" (mkPropJsonRoundtrip @ClientRequest),
                                                  testProperty "ClientResult" (mkPropJsonRoundtrip @ClientResult),
                                                  testProperty "CompleteRequest" (mkPropJsonRoundtrip @CompleteRequest),
                                                  testProperty "CompleteResult" (mkPropJsonRoundtrip @CompleteResult),
                                                  testProperty "CreateMessageRequest" (mkPropJsonRoundtrip @CreateMessageRequest),
                                                  testProperty "CreateMessageResult" (mkPropJsonRoundtrip @CreateMessageResult),
                                                  testProperty "Cursor" (mkPropJsonRoundtrip @Cursor),
                                                  testProperty "EmbeddedResource" (mkPropJsonRoundtrip @EmbeddedResource),
                                                  testProperty "EmptyResult" (mkPropJsonRoundtrip @EmptyResult),
                                                  testProperty "GetPromptRequest" (mkPropJsonRoundtrip @GetPromptRequest),
                                                  testProperty "GetPromptResult" (mkPropJsonRoundtrip @GetPromptResult),
                                                  testProperty "ImageContent" (mkPropJsonRoundtrip @ImageContent),
                                                  testProperty "Implementation" (mkPropJsonRoundtrip @Implementation),
                                                  testProperty "InitializeRequest" (mkPropJsonRoundtrip @InitializeRequest),
                                                  testProperty "InitializeResult" (mkPropJsonRoundtrip @InitializeResult),
                                                  testProperty "InitializedNotification" (mkPropJsonRoundtrip @InitializedNotification),
                                                  testProperty "JSONRPCBatchRequest" (mkPropJsonRoundtrip @JSONRPCBatchRequest),
                                                  testProperty "JSONRPCBatchResponse" (mkPropJsonRoundtrip @JSONRPCBatchResponse),
                                                  testProperty "JSONRPCError" (mkPropJsonRoundtrip @JSONRPCError),
                                                  testProperty "JSONRPCMessage" (mkPropJsonRoundtrip @JSONRPCMessage),
                                                  testProperty "JSONRPCNotification" (mkPropJsonRoundtrip @JSONRPCNotification),
                                                  testProperty "JSONRPCRequest" (mkPropJsonRoundtrip @JSONRPCRequest),
                                                  testProperty "JSONRPCResponse" (mkPropJsonRoundtrip @JSONRPCResponse),
                                                  testProperty "ListPromptsRequest" (mkPropJsonRoundtrip @ListPromptsRequest),
                                                  testProperty "ListPromptsResult" (mkPropJsonRoundtrip @ListPromptsResult),
                                                  testProperty "ListResourceTemplatesRequest" (mkPropJsonRoundtrip @ListResourceTemplatesRequest),
                                                  testProperty "ListResourceTemplatesResult" (mkPropJsonRoundtrip @ListResourceTemplatesResult),
                                                  testProperty "ListResourcesRequest" (mkPropJsonRoundtrip @ListResourcesRequest),
                                                  testProperty "ListResourcesResult" (mkPropJsonRoundtrip @ListResourcesResult),
                                                  testProperty "ListRootsRequest" (mkPropJsonRoundtrip @ListRootsRequest),
                                                  testProperty "ListRootsResult" (mkPropJsonRoundtrip @ListRootsResult),
                                                  testProperty "ListToolsRequest" (mkPropJsonRoundtrip @ListToolsRequest),
                                                  testProperty "ListToolsResult" (mkPropJsonRoundtrip @ListToolsResult),
                                                  testProperty "LoggingLevel" (mkPropJsonRoundtrip @LoggingLevel),
                                                  testProperty "LoggingMessageNotification" (mkPropJsonRoundtrip @LoggingMessageNotification),
                                                  testProperty "ModelHint" (mkPropJsonRoundtrip @ModelHint),
                                                  testProperty "ModelPreferences" (mkPropJsonRoundtrip @ModelPreferences),
                                                  testProperty "Notification" (mkPropJsonRoundtrip @Notification),
                                                  testProperty "PaginatedRequest" (mkPropJsonRoundtrip @PaginatedRequest),
                                                  testProperty "PaginatedResult" (mkPropJsonRoundtrip @PaginatedResult),
                                                  testProperty "PingRequest" (mkPropJsonRoundtrip @PingRequest),
                                                  testProperty "ProgressNotification" (mkPropJsonRoundtrip @ProgressNotification),
                                                  testProperty "ProgressToken" (mkPropJsonRoundtrip @ProgressToken),
                                                  testProperty "Prompt" (mkPropJsonRoundtrip @Prompt),
                                                  testProperty "PromptArgument" (mkPropJsonRoundtrip @PromptArgument),
                                                  testProperty "PromptListChangedNotification" (mkPropJsonRoundtrip @PromptListChangedNotification),
                                                  testProperty "PromptMessage" (mkPropJsonRoundtrip @PromptMessage),
                                                  testProperty "PromptReference" (mkPropJsonRoundtrip @PromptReference),
                                                  testProperty "ReadResourceRequest" (mkPropJsonRoundtrip @ReadResourceRequest),
                                                  testProperty "ReadResourceResult" (mkPropJsonRoundtrip @ReadResourceResult),
                                                  testProperty "Request" (mkPropJsonRoundtrip @Request),
                                                  testProperty "RequestId" (mkPropJsonRoundtrip @RequestId),
                                                  testProperty "Resource" (mkPropJsonRoundtrip @Resource),
                                                  testProperty "ResourceContents" (mkPropJsonRoundtrip @ResourceContents),
                                                  testProperty "ResourceListChangedNotification" (mkPropJsonRoundtrip @ResourceListChangedNotification),
                                                  testProperty "ResourceReference" (mkPropJsonRoundtrip @ResourceReference),
                                                  testProperty "ResourceTemplate" (mkPropJsonRoundtrip @ResourceTemplate),
                                                  testProperty "ResourceUpdatedNotification" (mkPropJsonRoundtrip @ResourceUpdatedNotification),
                                                  testProperty "Result" (mkPropJsonRoundtrip @Result),
                                                  testProperty "Role" (mkPropJsonRoundtrip @Role),
                                                  testProperty "Root" (mkPropJsonRoundtrip @Root),
                                                  testProperty "RootsListChangedNotification" (mkPropJsonRoundtrip @RootsListChangedNotification),
                                                  testProperty "SamplingMessage" (mkPropJsonRoundtrip @SamplingMessage),
                                                  testProperty "ServerCapabilities" (mkPropJsonRoundtrip @ServerCapabilities),
                                                  testProperty "ServerNotification" (mkPropJsonRoundtrip @ServerNotification),
                                                  testProperty "ServerRequest" (mkPropJsonRoundtrip @ServerRequest),
                                                  testProperty "ServerResult" (mkPropJsonRoundtrip @ServerResult),
                                                  testProperty "SetLevelRequest" (mkPropJsonRoundtrip @SetLevelRequest),
                                                  testProperty "SubscribeRequest" (mkPropJsonRoundtrip @SubscribeRequest),
                                                  testProperty "TextContent" (mkPropJsonRoundtrip @TextContent),
                                                  testProperty "TextResourceContents" (mkPropJsonRoundtrip @TextResourceContents),
                                                  testProperty "Tool" (mkPropJsonRoundtrip @Tool),
                                                  testProperty "ToolAnnotations" (mkPropJsonRoundtrip @ToolAnnotations),
                                                  testProperty "ToolListChangedNotification" (mkPropJsonRoundtrip @ToolListChangedNotification),
                                                  testProperty "UnsubscribeRequest" (mkPropJsonRoundtrip @UnsubscribeRequest)]
-- Add your tests here
