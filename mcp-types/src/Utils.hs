{-# LANGUAGE TypeFamilies #-}
module Utils where
import           Control.Applicative       ((<|>))
import           Data.Aeson                (FromJSON (parseJSON),
                                            ToJSON (toJSON), decode, encode)
import           Data.Kind                 (Type)
import           Data.Text                 (Text)
import qualified Data.Text                 as T
import           Data.Void                 (Void)
import           Test.QuickCheck           (Arbitrary, Gen)
import           Test.QuickCheck.Arbitrary (Arbitrary (arbitrary))

toJSONField :: String -> String
toJSONField fieldName =
  case fieldName of
    "meta_" -> "_meta"
    "data_" -> "_data"
    "type_" -> "_type"
    _       -> fieldName


instance (Arbitrary Text) where
    arbitrary = T.pack <$> arbitrary


mkPropJsonRoundtrip :: (FromJSON a, ToJSON a, Eq a) => a -> Bool
mkPropJsonRoundtrip a = decode (encode a) == Just a


data Sum a b
    = InR a
    | InL b
    deriving (Show, Eq, Ord)

instance (ToJSON a, ToJSON b) => ToJSON (Sum a b) where
    toJSON (InR a) = toJSON a
    toJSON (InL b) = toJSON b

instance (FromJSON a, FromJSON b) => FromJSON (Sum a b) where
    parseJSON v = InR <$> parseJSON v <|> InL <$> parseJSON v

instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
    arbitrary = do
        choice <- arbitrary :: Gen Bool
        if choice
            then InR <$> arbitrary
            else InL <$> arbitrary
