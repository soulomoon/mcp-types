{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ModelPreferences where

import           Data.Aeson                           (FromJSON, Options (..),
                                                       ToJSON, Value,
                                                       defaultOptions,
                                                       genericParseJSON,
                                                       genericToJSON, parseJSON,
                                                       toJSON)
import qualified Data.Aeson                           as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                           as Data.Aeson.Types.Internal
import qualified Data.Aeson                           as Data.Aeson.Types.ToJSON
import           Data.Text                            (Text)
import           GHC.Generics                         (Generic)
import           Prelude
import           Test.QuickCheck                      (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic    (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.ModelHint (ModelHint)

data ModelPreferences
    = ModelPreferences {costPriority         :: Double,
                        hints                :: [ModelHint],
                        intelligencePriority :: Double,
                        speedPriority        :: Double}
    deriving Arbitrary via (GenericArbitrary ModelPreferences)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON ModelPreferences
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON ModelPreferences
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
