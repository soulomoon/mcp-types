{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ServerResult where

import Prelude

import Data.Aeson (Value)

import Result
import InitializeResult
import ListResourcesResult
import ReadResourceResult
import ListPromptsResult
import GetPromptResult
import ListToolsResult
import CallToolResult
import CompleteResult

type ServerResult = Either Result
                           (Either InitializeResult
                                   (Either ListResourcesResult
                                           (Either ReadResourceResult
                                                   (Either ListPromptsResult
                                                           (Either GetPromptResult
                                                                   (Either ListToolsResult
                                                                           (Either CallToolResult
                                                                                   CompleteResult)))))))
