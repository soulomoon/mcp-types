module Main (main) where

import Test.Tasty (defaultMain, testGroup)
import System.Process (readProcess)
import Test.Tasty.HUnit (testCase, (@?=))
import Data.List (isInfixOf)

main :: IO ()
main = defaultMain $ testGroup "All Tests"
  [ testCase "mcp-gen runs and outputs expected text" $ do
      output <- readProcess "mcp-gen" [] ""
      let expected = "Finished generating Haskell data types"
      -- Check that the output contains the expected substring
      (expected `isInfixOf` output) @?= True
  ]
