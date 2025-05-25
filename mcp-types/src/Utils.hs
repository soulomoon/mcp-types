module Utils where
import           Data.Aeson                (FromJSON, ToJSON, decode, encode)
import           Data.Text                 (Text)
import qualified Data.Text                 as T
import           Test.QuickCheck           (Arbitrary)
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
