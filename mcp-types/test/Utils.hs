module Utils where

import           Data.Aeson (FromJSON, ToJSON, decode, encode)


mkPropJsonRoundtrip :: (FromJSON a, ToJSON a, Eq a) => a -> Bool
mkPropJsonRoundtrip a = decode (encode a) == Just a
