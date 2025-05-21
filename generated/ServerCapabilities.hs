{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ServerCapabilities where

import Prelude

import Data.Aeson (Value)


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
