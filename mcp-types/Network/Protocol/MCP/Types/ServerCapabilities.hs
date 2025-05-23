{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ServerCapabilities where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Completions = Completions {}
data Experimental = Experimental {}
data Logging = Logging {}
data Prompts = Prompts {listChanged :: Bool}
data Resources = Resources {listChanged :: Bool, subscribe :: Bool}
data Tools = Tools {listChanged :: Bool}
data ServerCapabilities
    = ServerCapabilities {completions :: Completions,
                          experimental :: Experimental,
                          logging :: Logging,
                          prompts :: Prompts,
                          resources :: Resources,
                          tools :: Tools}
