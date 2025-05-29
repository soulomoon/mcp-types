{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.CreateMessageRequest where

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
import           Utils                                       (Sum)

import           Network.Protocol.MCP.Types.ModelPreferences (ModelPreferences)
import           Network.Protocol.MCP.Types.SamplingMessage  (SamplingMessage)

data Metadata
    = Metadata {}
    deriving Arbitrary via (GenericArbitrary Metadata)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Metadata
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Metadata
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data Params
    = Params {includeContext   :: (Maybe Text),
              maxTokens        :: Int,
              messages         :: [SamplingMessage],
              metadata         :: (Maybe Metadata),
              modelPreferences :: (Maybe ModelPreferences),
              stopSequences    :: (Maybe [Text]),
              systemPrompt     :: (Maybe Text),
              temperature      :: (Maybe Double)}
    deriving Arbitrary via (GenericArbitrary Params)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Params
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Params
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data CreateMessageRequest
    = CreateMessageRequest {method :: Text, params :: Params}
    deriving Arbitrary via (GenericArbitrary CreateMessageRequest)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON CreateMessageRequest
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON CreateMessageRequest
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
