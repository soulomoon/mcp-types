{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.Tool where

import           Data.Aeson                                 (FromJSON,
                                                             Options (..),
                                                             ToJSON, Value,
                                                             defaultOptions,
                                                             genericParseJSON,
                                                             genericToJSON,
                                                             parseJSON, toJSON)
import qualified Data.Aeson                                 as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                                 as Data.Aeson.Types.Internal
import qualified Data.Aeson                                 as Data.Aeson.Types.ToJSON
import           Data.Text                                  (Text)
import           GHC.Generics                               (Generic)
import           Prelude
import           Test.QuickCheck                            (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic          (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.ToolAnnotations (ToolAnnotations)

data Properties
    = Properties {}
    deriving Arbitrary via (GenericArbitrary Properties)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Properties
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Properties
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data InputSchema
    = InputSchema {properties :: (Maybe Properties),
                   required   :: (Maybe [Text]),
                   type_      :: Text}
    deriving Arbitrary via (GenericArbitrary InputSchema)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON InputSchema
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON InputSchema
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data Tool
    = Tool {annotations :: (Maybe ToolAnnotations),
            description :: (Maybe Text),
            inputSchema :: InputSchema,
            name        :: Text}
    deriving Arbitrary via (GenericArbitrary Tool)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Tool
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Tool
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
