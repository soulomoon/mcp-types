{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CreateMessageResult where

import           Data.Aeson                              (FromJSON,
                                                          Options (..), ToJSON,
                                                          Value, defaultOptions,
                                                          genericParseJSON,
                                                          genericToJSON,
                                                          parseJSON, toJSON)
import qualified Data.Aeson                              as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                              as Data.Aeson.Types.Internal
import qualified Data.Aeson                              as Data.Aeson.Types.ToJSON
import           Data.Text                               (Text)
import           GHC.Generics                            (Generic)
import           Prelude
import           Test.QuickCheck                         (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic       (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.AudioContent (AudioContent)
import           Network.Protocol.MCP.Types.ImageContent (ImageContent)
import           Network.Protocol.MCP.Types.Role         (Role)
import           Network.Protocol.MCP.Types.TextContent  (TextContent)

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
data CreateMessageResult
    = CreateMessageResult {meta_ :: (Maybe Meta_),
                           content :: (Either TextContent (Either ImageContent AudioContent)),
                           model :: Text,
                           role :: Role,
                           stopReason :: (Maybe Text)}
    deriving Arbitrary via (GenericArbitrary CreateMessageResult)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON CreateMessageResult
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON CreateMessageResult
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
