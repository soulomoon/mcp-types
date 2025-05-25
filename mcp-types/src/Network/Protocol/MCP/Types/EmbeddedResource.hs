{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DerivingVia #-}

module Network.Protocol.MCP.Types.EmbeddedResource where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import Test.QuickCheck (Arbitrary)
import Test.QuickCheck.Arbitrary.Generic (GenericArbitrary(..))
import qualified Utils

import Network.Protocol.MCP.Types.Annotations(Annotations)
import Network.Protocol.MCP.Types.TextResourceContents(TextResourceContents)
import Network.Protocol.MCP.Types.BlobResourceContents(BlobResourceContents)

data EmbeddedResource
    = EmbeddedResource {annotations :: Annotations,
                        resource :: (Either TextResourceContents BlobResourceContents),
                        type_ :: Text}
    deriving Arbitrary via (GenericArbitrary EmbeddedResource)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON EmbeddedResource
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON EmbeddedResource
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
