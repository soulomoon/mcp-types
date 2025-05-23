{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Root where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Root = Root {name :: Text, uri :: Text}
