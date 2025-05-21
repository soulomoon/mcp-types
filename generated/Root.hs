{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Root where

import Prelude

import Data.Aeson (Value)


data Root = Root {name :: String, uri :: String}
