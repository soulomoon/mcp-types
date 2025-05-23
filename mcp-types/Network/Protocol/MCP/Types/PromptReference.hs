{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PromptReference where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data PromptReference
    = PromptReference {name :: Text, type_ :: Text}
