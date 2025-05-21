{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Role where

import Prelude

import Data.Aeson (Value)


data Role
    = Assistant
    | User
