{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.InitializeResult where

import           Data.Aeson                                    (FromJSON,
                                                                Options (..),
                                                                ToJSON, Value,
                                                                defaultOptions,
                                                                genericParseJSON,
                                                                genericToJSON,
                                                                parseJSON,
                                                                toJSON)
import qualified Data.Aeson                                    as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                                    as Data.Aeson.Types.Internal
import qualified Data.Aeson                                    as Data.Aeson.Types.ToJSON
import           Data.Text                                     (Text)
import           GHC.Generics                                  (Generic)
import           Prelude
import           Test.QuickCheck                               (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic             (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.Implementation     (Implementation)
import           Network.Protocol.MCP.Types.ServerCapabilities (ServerCapabilities)

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
data InitializeResult
    = InitializeResult {meta_           :: Meta_,
                        capabilities    :: ServerCapabilities,
                        instructions    :: Text,
                        protocolVersion :: Text,
                        serverInfo      :: Implementation}
    deriving Arbitrary via (GenericArbitrary InitializeResult)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON InitializeResult
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON InitializeResult
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
