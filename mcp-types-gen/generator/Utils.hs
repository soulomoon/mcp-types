{-# LANGUAGE OverloadedStrings #-}

module Utils where

import Types
import Data.Generics (everything, mkQ)
import qualified Data.Text as T
import Language.Haskell.TH (Name, mkName, nameBase)
import Data.Text (Text)
import Data.Maybe (fromMaybe)
import qualified Data.Char as Char
import System.FilePath ((<.>))
import GenName (fromOrigName, GenName (..))

-- | Function to extract all references from a given SEntity
--   using a generic traversal.
getAllRefs :: SEntity -> [Ref]
getAllRefs = everything (++) ([] `mkQ` fromEntity)
  where
    fromEntity (SRef r) = [r]
    fromEntity _ = []


refToImport :: String -> Ref -> String
refToImport nameSpace (Ref refValue _) =
  case T.stripPrefix "#/definitions/" refValue of
    Just refName -> "import " ++ nameSpace <.> T.unpack refName
    Nothing -> "import " ++ nameSpace <.> T.unpack refValue

removeInternal :: Name -> Name
removeInternal name = mkName (nameBase name)

stripDefinitions :: Text -> Text
stripDefinitions t = fromMaybe t $ T.stripPrefix "#/definitions/" t

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = Char.toUpper x : xs


mkItemNameI :: Show a => a -> GenName
mkItemNameI i = fromOrigName $ "Item" <> T.pack (show i)


renameField :: Text -> Text
renameField "_meta" = "meta_"
renameField "data" = "data_"
renameField "type" = "type_"
renameField fieldName = fieldName


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
