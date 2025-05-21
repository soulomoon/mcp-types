{-# LANGUAGE OverloadedStrings #-}

module Utils where

import Types
import Data.Generics (everything, mkQ)
import qualified Data.Text as T
import Language.Haskell.TH (Name, mkName, nameBase)
import Data.Text (Text)
import Data.Maybe (fromMaybe)
import qualified Data.Char as Char

-- | Function to extract all references from a given SEntity
--   using a generic traversal.
getAllRefs :: SEntity -> [Ref]
getAllRefs = everything (++) ([] `mkQ` fromEntity)
  where
    fromEntity (SRef r) = [r]
    fromEntity _ = []


refToImport :: Ref -> String
refToImport (Ref refValue _) =
  case T.stripPrefix "#/definitions/" refValue of
    Just refName -> "import " ++ T.unpack refName
    Nothing -> "import " ++ T.unpack refValue

removeInternal :: Name -> Name
removeInternal name = mkName (nameBase name)

stripDefinitions :: Text -> Text
stripDefinitions t = fromMaybe t $ T.stripPrefix "#/definitions/" t

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = Char.toUpper x : xs


mkItemName name = name <> "Item"
mkItemNameI i = "Item" <> T.pack (show i)
