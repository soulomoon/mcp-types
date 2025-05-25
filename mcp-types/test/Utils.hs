module Utils where

import Data.Aeson (decode, encode, ToJSON, FromJSON)


mkPropJsonRoundtrip :: (FromJSON a, ToJSON a, Eq a) => a -> Bool
mkPropJsonRoundtrip a = decode (encode a) == Just a
