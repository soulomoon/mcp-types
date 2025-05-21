{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module ClientCapabilities where

import Prelude

import Data.Aeson (Value)


data Experimental = Experimental {}
data Roots = Roots {listChanged :: Bool}
data Sampling = Sampling {}
data ClientCapabilities
    = ClientCapabilities {experimental :: Experimental,
                          roots :: Roots,
                          sampling :: Sampling}
