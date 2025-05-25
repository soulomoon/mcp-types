{-# LANGUAGE OverloadedStrings #-}

module GenName where
import           Data.Aeson       (FromJSON, FromJSONKey (fromJSONKey),
                                   withText)
import           Data.Aeson.Types (FromJSON (..),
                                   FromJSONKeyFunction (FromJSONKeyText))
import           Data.Data        (Data)
import           Data.Generics    ()
import           Data.Text        (Text)
import qualified Data.Text        as T
import           GHC.Generics     (Generic)


data GenName = GenName
  { genOrigName :: Text,
    genHsName   :: Text,
    genTypeName :: Text
  }
  deriving (Show, Eq, Data, Ord, Generic)


-- Array item name
toItemName :: GenName -> GenName
toItemName name =
  name
    { genHsName = genHsName name <> "Item",
      genTypeName = genTypeName name <> "Item"
    }


fromOrigName :: Text -> GenName
fromOrigName origName =
  GenName
    { genOrigName = origName,
      genHsName = genHsName,
      genTypeName = upperCaseName
    }
  where
    genHsName = renameField origName
    upperCaseName = T.toUpper (T.take 1 genHsName) <> T.tail genHsName

renameField :: Text -> Text
renameField t = case t of
  "_meta" -> "meta_"
  "data"  -> "data_"
  "type"  -> "type_"
  _       -> t


instance FromJSON GenName where
  parseJSON = withText "GenName" $ \origName-> do
    return $ fromOrigName origName


instance FromJSONKey GenName where
  fromJSONKey = Data.Aeson.Types.FromJSONKeyText fromOrigName
