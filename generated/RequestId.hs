{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module RequestId where

import Prelude

import Data.Aeson (Value)


data RequestId
    = RequestIdString String
    | RequestIdInteger Integer
