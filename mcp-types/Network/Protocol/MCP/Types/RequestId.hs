{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.RequestId where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data RequestId
    = RequestIdString String
    | RequestIdInteger Integer
