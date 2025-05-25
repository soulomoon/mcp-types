{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.PromptReference where

import           Data.Aeson                        (FromJSON, Options (..),
                                                    ToJSON, Value,
                                                    defaultOptions,
                                                    genericParseJSON,
                                                    genericToJSON, parseJSON,
                                                    toJSON)
import qualified Data.Aeson                        as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                        as Data.Aeson.Types.Internal
import qualified Data.Aeson                        as Data.Aeson.Types.ToJSON
import           Data.Text                         (Text)
import           GHC.Generics                      (Generic)
import           Prelude
import           Test.QuickCheck                   (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic (GenericArbitrary (..))
import qualified Utils


data PromptReference
    = PromptReference {name :: Text, type_ :: Text}
    deriving Arbitrary via (GenericArbitrary PromptReference)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON PromptReference
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON PromptReference
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
