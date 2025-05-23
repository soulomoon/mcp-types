{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}


module Gen (genMetaModel, getStructuresFromSchema) where

import Control.Monad (unless)
import Data.Aeson (FromJSON (parseJSON), Value (..), eitherDecode)
import Data.Aeson.Key qualified as K
import Data.Aeson.KeyMap qualified as KM
import Data.Aeson.Types (Parser, parseEither)
import Data.ByteString.Lazy qualified as B
import Data.Either (lefts, rights)
import Data.Text (Text)
import Types

genMetaModel :: FilePath -> IO MetaModel
genMetaModel schemaPath = do
  sts <- getStructuresFromSchema schemaPath
  let md = MetaModel { structures = sts }

  putStrLn $ "number of all defs " ++ show (length sts)
  let jsonTypes = filter (isJsonType . snd) sts
  putStrLn $ "number of json types " ++ show (length jsonTypes)
  mapM_ (putStrLn . ("JSON Type: " ++) . show) jsonTypes
  let inspectKey = "RequestId"
  let inspectValue = filter ((== inspectKey) . fst) sts
  putStrLn $ "inspectValue: " ++ show inspectValue
  return md

-- | Extracts structures [(Text, SEntity)] from a schema file
getStructuresFromSchema :: FilePath -> IO [(Text, SEntity)]
getStructuresFromSchema schemaPath = do
  fileContent <- B.readFile schemaPath
  case eitherDecode fileContent of
    Left err -> fail $ "Error decoding schema: " ++ err
    Right (Object rootObj) ->
      case KM.lookup "definitions" rootObj of
        Nothing -> fail "No 'definitions' field found in the schema."
        Just (Object defs) -> do
          let ds = kmKeyObjects defs
          --  print ds
          let names = map (K.toText . fst) ds
          let entityEither = zip names $ map (parseEither buildEntity) ds
          let sts = rights (snd <$> entityEither)
          let errors = lefts (snd <$> entityEither)
          unless (null errors) $ putStrLn "Errors: "
          mapM_ print errors
          return sts
        _ -> fail "'definitions' is not an object."
    Right _ -> fail "Top-level JSON is not an object."

buildEntity :: (K.Key, KM.KeyMap Value) -> Parser (Text, SEntity)
buildEntity (k, defObj) = do
  s <- parseJSON (Object defObj)
  return (K.toText k, s)
