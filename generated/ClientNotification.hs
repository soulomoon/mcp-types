{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ClientNotification where

import Prelude

import Data.Aeson (Value)

import CancelledNotification
import InitializedNotification
import ProgressNotification
import RootsListChangedNotification

type ClientNotification = Either CancelledNotification
                                 (Either InitializedNotification
                                         (Either ProgressNotification RootsListChangedNotification))
