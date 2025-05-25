module Utils where
import Test.QuickCheck (Arbitrary)
import Data.Text (Text)
import Test.QuickCheck.Arbitrary (Arbitrary(arbitrary))
import qualified Data.Text as T
import Data.Aeson (decode, encode, ToJSON, FromJSON)

toJSONField :: String -> String
toJSONField fieldName =
  case fieldName of
    "meta_" -> "_meta"
    "data_" -> "_data"
    "type_" -> "_type"
    _ -> fieldName


instance (Arbitrary Text) where
    arbitrary = T.pack <$> arbitrary


mkPropJsonRoundtrip :: (FromJSON a, ToJSON a, Eq a) => a -> Bool
mkPropJsonRoundtrip a = decode (encode a) == Just a
