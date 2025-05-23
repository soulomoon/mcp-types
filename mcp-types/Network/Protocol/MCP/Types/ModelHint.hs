{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ModelHint where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data ModelHint = ModelHint {name :: Text}
