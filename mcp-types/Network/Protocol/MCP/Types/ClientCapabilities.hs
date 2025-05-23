{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ClientCapabilities where

import Prelude
import Data.Aeson (Value)
import Data.Text (Text)


data Experimental = Experimental {}
data Roots = Roots {listChanged :: Bool}
data Sampling = Sampling {}
data ClientCapabilities
    = ClientCapabilities {experimental :: Experimental,
                          roots :: Roots,
                          sampling :: Sampling}
