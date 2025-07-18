{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListResourcesResult where

import           Data.Aeson                          (FromJSON, Options (..),
                                                      ToJSON, Value,
                                                      defaultOptions,
                                                      genericParseJSON,
                                                      genericToJSON, parseJSON,
                                                      toJSON)
import qualified Data.Aeson                          as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                          as Data.Aeson.Types.Internal
import qualified Data.Aeson                          as Data.Aeson.Types.ToJSON
import           Data.Text                           (Text)
import           GHC.Generics                        (Generic)
import           Prelude
import           Test.QuickCheck                     (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic   (GenericArbitrary (..))
import qualified Utils
import           Utils                               (Sum)

import           Network.Protocol.MCP.Types.Resource (Resource)

data Meta_
    = Meta_ {}
    deriving Arbitrary via (GenericArbitrary Meta_)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Meta_
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Meta_
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data ListResourcesResult
    = ListResourcesResult {meta_      :: (Maybe Meta_),
                           nextCursor :: (Maybe Text),
                           resources  :: [Resource]}
    deriving Arbitrary via (GenericArbitrary ListResourcesResult)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON ListResourcesResult
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON ListResourcesResult
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
