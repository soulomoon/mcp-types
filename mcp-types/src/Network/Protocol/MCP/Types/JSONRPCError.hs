{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingVia           #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Network.Protocol.MCP.Types.JSONRPCError where

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

import           Network.Protocol.MCP.Types.RequestId (RequestId)

data Error
    = Error {code :: Int, data_ :: Value, message :: Text}
    deriving Arbitrary via (GenericArbitrary Error)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON Error
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON Error
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
data JSONRPCError
    = JSONRPCError {error :: Error, id :: RequestId, jsonrpc :: Text}
    deriving Arbitrary via (GenericArbitrary JSONRPCError)
    deriving Show
    deriving Eq
    deriving Ord
    deriving Generic
instance ToJSON JSONRPCError
    where {toJSON = Data.Aeson.Types.ToJSON.genericToJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
instance FromJSON JSONRPCError
    where {parseJSON = Data.Aeson.Types.FromJSON.genericParseJSON Data.Aeson.Types.Internal.defaultOptions{Data.Aeson.Types.Internal.fieldLabelModifier = Utils.toJSONField}}
