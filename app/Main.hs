{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Main where

import Gen (getStructuresFromSchema, genMetaModel)
import GenTH (genDataTypesTH)
import Language.Haskell.TH (runQ, pprint)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import Types (SEntity)
import Data.Text (Text)
import qualified Data.Text as T
import Utils (getAllRefs, refToImport)

modulePath :: FilePath
modulePath = "meta/schema.json"

generatedDir :: FilePath
generatedDir = "generated"

genOne :: (Text, SEntity) -> IO ()
genOne (name, s) = do
  let fileName = generatedDir </> (T.unpack name ++ ".hs")
  putStrLn $ "Generating file: " ++ fileName
  putStrLn $ "Generating file: " ++ show s
  decs <- runQ (genDataTypesTH [(name, s)])
  putStrLn $ "Generated declarations: " ++ show decs
  let allRefs = getAllRefs s
      refImports = map refToImport allRefs
      code = unlines
        [ "{-# LANGUAGE DeriveGeneric #-}"
        , "{-# LANGUAGE DuplicateRecordFields #-}"
        , ""
        , "module " ++ T.unpack name ++ " where"
        , ""
        , "import Prelude"
        , ""
        , "import Data.Aeson (Value)"
        , ""
        , unlines refImports
        , pprint decs
        ]
  createDirectoryIfMissing True generatedDir
  writeFile fileName code
  putStrLn $ "Generated types written to: " ++ fileName


main :: IO ()
main = do
  putStrLn "\n-- parsing schema --\n"
  _metaModel <- genMetaModel modulePath
  putStrLn "\n-- Generating Haskell data types to generated/Types.hs --\n"
  structures <- getStructuresFromSchema modulePath
  print $ "Structures: " ++ show structures
  mapM_ genOne structures
  putStrLn "\n-- Finished generating Haskell data types --\n"
  mapM_ (putStrLn . (","++) . T.unpack . fst) structures
  putStrLn "All generated files are in the generated directory."

