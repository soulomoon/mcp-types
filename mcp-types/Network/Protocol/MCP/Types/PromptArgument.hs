{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PromptArgument where

import Prelude
import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.Aeson as Data.Aeson.Types.Internal
import qualified Data.Aeson as Data.Aeson.Types.FromJSON
import qualified Data.Aeson as Data.Aeson.Types.ToJSON
import qualified Utils


data PromptArgument
    = PromptArgument {description :: Text,
                      name :: Text,
                      required :: Bool}
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON PromptArgument
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON PromptArgument
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.fromJSONField}}
