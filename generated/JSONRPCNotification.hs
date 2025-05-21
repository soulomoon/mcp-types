{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module JSONRPCNotification where

import Prelude

import Data.Aeson (Value)


data Meta_ = Meta_ {}
data Params = Params {meta_ :: Meta_}
data JSONRPCNotification
    = JSONRPCNotification {jsonrpc :: String,
                           method :: String,
                           params :: Params}
