{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ProgressNotification where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)

import Network.Protocol.MCP.Types.ProgressToken

data Params
    = Params {message :: Text,
              progress :: Double,
              progressToken :: ProgressToken,
              total :: Double}
data ProgressNotification
    = ProgressNotification {method :: Text, params :: Params}
