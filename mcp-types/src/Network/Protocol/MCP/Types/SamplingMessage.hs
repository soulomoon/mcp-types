{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.SamplingMessage where

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
import           Utils                                   (Sum)

import           Network.Protocol.MCP.Types.AudioContent (AudioContent)
import           Network.Protocol.MCP.Types.ImageContent (ImageContent)
import           Network.Protocol.MCP.Types.Role         (Role)
import           Network.Protocol.MCP.Types.TextContent  (TextContent)

data SamplingMessage
    = SamplingMessage {content :: (Sum TextContent
                                       (Sum ImageContent AudioContent)),
                       role :: Role}
    deriving Arbitrary via (GenericArbitrary SamplingMessage)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON SamplingMessage
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON SamplingMessage
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
