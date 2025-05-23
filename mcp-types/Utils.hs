module Utils where

toJSONField :: String -> String
toJSONField fieldName =
  case fieldName of
    "meta_" -> "_meta"
    "data_" -> "_data"
    "type_" -> "_type"
    _ -> fieldName

fromJSONField :: String -> String
fromJSONField fieldName =
  case fieldName of
    "_meta" -> "meta_"
    "_data" -> "data_"
    "_type" -> "type_"
    _ -> fieldName
