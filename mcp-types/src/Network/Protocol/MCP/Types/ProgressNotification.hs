{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.ProgressNotification where

import           Data.Aeson                               (FromJSON,
                                                           Options (..), ToJSON,
                                                           Value,
                                                           defaultOptions,
                                                           genericParseJSON,
                                                           genericToJSON,
                                                           parseJSON, toJSON)
import qualified Data.Aeson                               as Data.Aeson.Types.FromJSON
import qualified Data.Aeson                               as Data.Aeson.Types.Internal
import qualified Data.Aeson                               as Data.Aeson.Types.ToJSON
import           Data.Text                                (Text)
import           GHC.Generics                             (Generic)
import           Prelude
import           Test.QuickCheck                          (Arbitrary)
import           Test.QuickCheck.Arbitrary.Generic        (GenericArbitrary (..))
import qualified Utils

import           Network.Protocol.MCP.Types.ProgressToken (ProgressToken)

data Params
    = Params {message       :: (Maybe Text),
              progress      :: Double,
              progressToken :: ProgressToken,
              total         :: (Maybe Double)}
    deriving Arbitrary via (GenericArbitrary Params)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Params
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Params
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data ProgressNotification
    = ProgressNotification {method :: Text, params :: Params}
    deriving Arbitrary via (GenericArbitrary ProgressNotification)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON ProgressNotification
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON ProgressNotification
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
