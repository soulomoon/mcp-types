{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.TextResourceContents where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data TextResourceContents
    = TextResourceContents {mimeType :: Text,
                            text :: Text,
                            uri :: Text}
