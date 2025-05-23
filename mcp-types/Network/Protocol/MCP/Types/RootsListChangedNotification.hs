{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.RootsListChangedNotification where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils


data Meta_
    = Meta_ {}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Meta_
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Meta_
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
data Params
    = Params {meta_ :: Meta_}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Params
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Params
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
data RootsListChangedNotification
    = RootsListChangedNotification {method :: Text, params :: Params}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON RootsListChangedNotification
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON RootsListChangedNotification
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
