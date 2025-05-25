{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CompleteRequest where

import           Data.Aeson                                   (FromJSON,
                                                               Options (..),
                                                               ToJSON, Value,
                                                               defaultOptions,
                                                               genericParseJSON,
                                                               genericToJSON,
                                                               parseJSON,
                                                               toJSON)
import qualified Data.Aeson                                   as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                                   as Data.Aeson.Types.Internal
import qualified Data.Aeson                                   as Data.Aeson.Types.ToJSON
import           Data.Text                                    (Text)
import           GHC.Generics                                 (Generic)
import           Prelude
import           Test.QuickCheck                              (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic            (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.PromptReference   (PromptReference)
import           Network.Protocol.MCP.Types.ResourceReference (ResourceReference)

data Argument
    = Argument {name :: Text, value :: Text}
    deriving Arbitrary via (GenericArbitrary Argument)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Argument
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Argument
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data Params
    = Params {argument :: Argument,
              ref      :: (Either PromptReference ResourceReference)}
    deriving Arbitrary via (GenericArbitrary Params)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Params
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Params
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data CompleteRequest
    = CompleteRequest {method :: Text, params :: Params}
    deriving Arbitrary via (GenericArbitrary CompleteRequest)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON CompleteRequest
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON CompleteRequest
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
