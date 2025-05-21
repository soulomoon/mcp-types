{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ServerNotification where

import Prelude

import Data.Aeson (Value)

import CancelledNotification
import ProgressNotification
import ResourceListChangedNotification
import ResourceUpdatedNotification
import PromptListChangedNotification
import ToolListChangedNotification
import LoggingMessageNotification

type ServerNotification = Either CancelledNotification
                                 (Either ProgressNotification
                                         (Either ResourceListChangedNotification
                                                 (Either ResourceUpdatedNotification
                                                         (Either PromptListChangedNotification
                                                                 (Either ToolListChangedNotification
                                                                         LoggingMessageNotification)))))
