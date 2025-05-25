{-# LANGUAGE MultilineStrings    #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE TemplateHaskell     #-}

module Main where

import qualified Data.Text           as T
import           Gen                 (genMetaModel, getStructuresFromSchema)
import           GenName             (GenName (..))
import           GenTH               (genAllProps, genDataTypesTH)
import           Language.Haskell.TH (pprint, runQ)
import           System.Directory    (createDirectoryIfMissing)
import           System.FilePath     ((<.>), (</>))
import           Types               (NameEntity)
import           Utils               (getAllRefs, nameToImport, refToImport)

modulePath :: FilePath
modulePath = "meta/schema.json"

generatedDir, generatedTestDir :: FilePath
generatedDir = "mcp-types/src"
generatedTestDir = "mcp-types/test"

mcpNameSpace :: String
mcpNameSpace = "Network.Protocol.MCP.Types"

-- | Converts a Haskell module namespace (e.g. "Data.Text") to a file path (e.g. "Data/Text").
nameSpaceToPath :: String -> FilePath
nameSpaceToPath = map (\c -> if c == '.' then '/' else c)

-- | Get the base directory of a file path (i.e., drop the file name).
baseDir :: FilePath -> FilePath
baseDir = reverse . dropWhile (/= '/') . reverse

genOne :: NameEntity -> IO ()
genOne (name, s) = do
  let nameSpaceName = mcpNameSpace <.> T.unpack name.genTypeName
  let filePath = generatedDir </> (nameSpaceToPath nameSpaceName ++ ".hs")
  putStrLn $ "Generating file: " ++ filePath
  putStrLn $ "Generating file: " ++ show s
  decs <- runQ (genDataTypesTH [(name, s)])
  putStrLn $ "Generated declarations: " ++ show decs
  let allRefs = getAllRefs s
      refImports = map (refToImport mcpNameSpace) allRefs
      code =
        unlines
          [ "{-# LANGUAGE DeriveGeneric #-}",
            "{-# LANGUAGE DuplicateRecordFields #-}",
            "{-# LANGUAGE DuplicateRecordFields #-}",
            "{-# LANGUAGE DerivingVia #-}",
            "",
            "module " ++ nameSpaceName ++ " where",
            "",
            """
            import Prelude
            import Data.Aeson (Value, FromJSON, ToJSON, defaultOptions, Options (..), genericToJSON, genericParseJSON, toJSON, parseJSON)
            import Data.Text (Text)
            import GHC.Generics (Generic)
            import qualified Data.Aeson as Data.Aeson.Types.Internal
            import qualified Data.Aeson as Data.Aeson.Types.FromJSON
            import qualified Data.Aeson as Data.Aeson.Types.ToJSON
            import Test.QuickCheck (Arbitrary)
            import Test.QuickCheck.Arbitrary.Generic (GenericArbitrary(..))
            import qualified Utils
            """,
            "",
            unlines refImports,
            pprint decs
          ]
  createDirectoryIfMissing True (baseDir filePath)
  writeFile filePath code
  putStrLn $ "Generated types written to: " ++ filePath

-- genCabalFile :: [Char]
genCabalFile :: String -> String
genCabalFile modules =
  """
  cabal-version:      3.12
  name:               mcp-types
  version:            0.1.0.0
  synopsis:           "MCP types"
  license:            BSD-3-Clause
  license-file:       LICENSE
  author:             Patrick
  maintainer:         patrickwalesss@gmail.com
  build-type:         Simple
  extra-doc-files:    CHANGELOG.md

  common warnings
      ghc-options: -Wall

  library mcp-generated-types
      hs-source-dirs:   ./
      exposed-modules:\n
  """
    ++ hang 8 modules
    ++ hang 4 """
       \n
       build-depends:
                         base >=4.7 && <5
                         ,ghc-prim
                         ,aeson
                         ,text

       default-language: GHC2024
       other-modules:  Utils
       other-extensions: DuplicateRecordFields
       """

hang :: Int -> String -> String
hang n str = unlines $ map (replicate n ' ' ++) (lines str)

genTestModules :: [NameEntity] -> IO ()
genTestModules structures = do
  let testModuleName = "Props"
      testFilePath = generatedTestDir </> (nameSpaceToPath testModuleName ++ ".hs")
  putStrLn $ "Generating test module: " ++ testFilePath
  allProps <- genAllProps $ (T.unpack . genTypeName . fst <$> structures)
  let imports = map (\(name, _) -> nameToImport mcpNameSpace $ T.unpack name.genTypeName) structures
      code =
        unlines
          [ "{-# LANGUAGE OverloadedStrings #-}",
            "{-# LANGUAGE DuplicateRecordFields #-}",
            "module " ++ testModuleName ++ " where",
            "",
            """
            import Test.Tasty (TestTree, testGroup)
            import Test.Tasty.QuickCheck (testProperty)
            import Utils
            """,
            "",
            unlines imports,
            "",
            pprint allProps,
            "-- Add your tests here"
          ]
  createDirectoryIfMissing True (baseDir testFilePath)
  writeFile testFilePath code
  putStrLn $ "Test module written to: " ++ testFilePath

main :: IO ()
main = do
  putStrLn "\n-- parsing schema --\n"
  _metaModel <- genMetaModel modulePath
  putStrLn "\n-- Generating Haskell data types to generated/Types.hs --\n"
  structures <- getStructuresFromSchema modulePath
  print $ "Structures: " ++ show structures
  mapM_ genOne structures
  genTestModules structures
  putStrLn "\n-- Finished generating Haskell data types --\n"
  -- let modules = map ((mcpNameSpace <.>) . T.unpack . genTypeName . fst) structures
  -- let cabalFileContent = genCabalFile $ intercalate "\n," modules
  -- putStrLn $ "Generated modules: \n" ++ cabalFileContent
  -- let cabalFilePath = generatedDir </> "mcp-types.cabal"
  -- writeFile cabalFilePath cabalFileContent
  putStrLn "All generated files are in the generated directory."
