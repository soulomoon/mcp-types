{-# LANGUAGE OverloadedStrings #-}

module Utils where

import qualified Data.Char           as Char
import           Data.Generics       (everything, mkQ)
import           Data.Maybe          (fromMaybe)
import           Data.Text           (Text)
import qualified Data.Text           as T
import           GenName             (GenName (..), fromOrigName)
import           Language.Haskell.TH (Name, mkName, nameBase)
import           System.FilePath     ((<.>))
import           Types

-- | Function to extract all references from a given SEntity
--   using a generic traversal.
getAllRefs :: SEntity -> [Ref]
getAllRefs = everything (++) ([] `mkQ` fromEntity)
  where
    fromEntity (SRef r) = [r]
    fromEntity _        = []


refToImport :: String -> Ref -> String
refToImport nameSpace (Ref refValue _) =
  case T.stripPrefix "#/definitions/" refValue of
    Just refName -> nameToImport nameSpace $ T.unpack refName
    Nothing      -> nameToImport nameSpace $ T.unpack refValue

nameToImport :: String -> String -> String
nameToImport nameSpace name =
  "import " ++ nameSpace <.> name ++ "(" ++ name ++ ")"

removeInternal :: Name -> Name
removeInternal name = mkName (nameBase name)

stripDefinitions :: Text -> Text
stripDefinitions t = fromMaybe t $ T.stripPrefix "#/definitions/" t

capitalize :: String -> String
capitalize []     = []
capitalize (x:xs) = Char.toUpper x : xs


mkItemNameI :: Show a => a -> GenName
mkItemNameI i = fromOrigName $ "Item" <> T.pack (show i)


renameField :: Text -> Text
renameField "_meta"   = "meta_"
renameField "data"    = "data_"
renameField "type"    = "type_"
renameField fieldName = fieldName


toJSONField :: String -> String
toJSONField fieldName =
  case fieldName of
    "meta_" -> "_meta"
    "data_" -> "_data"
    "type_" -> "_type"
    _       -> fieldName
