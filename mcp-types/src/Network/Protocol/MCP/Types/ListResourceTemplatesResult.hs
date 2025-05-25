{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ListResourceTemplatesResult where

import           Data.Aeson                                  (FromJSON,
                                                              Options (..),
                                                              ToJSON, Value,
                                                              defaultOptions,
                                                              genericParseJSON,
                                                              genericToJSON,
                                                              parseJSON, toJSON)
import qualified Data.Aeson                                  as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                                  as Data.Aeson.Types.Internal
import qualified Data.Aeson                                  as Data.Aeson.Types.ToJSON
import           Data.Text                                   (Text)
import           GHC.Generics                                (Generic)
import           Prelude
import           Test.QuickCheck                             (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic           (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.ResourceTemplate (ResourceTemplate)

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
data ListResourceTemplatesResult
    = ListResourceTemplatesResult {meta_             :: Meta_,
                                   nextCursor        :: Text,
                                   resourceTemplates :: [ResourceTemplate]}
    deriving Arbitrary via (GenericArbitrary ListResourceTemplatesResult)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON ListResourceTemplatesResult
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON ListResourceTemplatesResult
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
