{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ResourceReference where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data ResourceReference
    = ResourceReference {type_ :: Text, uri :: Text}
