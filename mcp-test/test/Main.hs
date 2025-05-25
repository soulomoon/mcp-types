module Main (main) where

import           Data.List        (isInfixOf)
import           System.Process   (readProcess)
import           Test.Tasty       (defaultMain, testGroup)
import           Test.Tasty.HUnit (testCase, (@?=))
-- import Network.Protocol.MCP.Types.Test (allProps) -- Add this import

main :: IO ()
main = defaultMain $ testGroup "All Tests"
  [
    -- testCase "mcp-gen runs and outputs expected text" $ do
    -- allProps -- Run all properties from Network.Protocol.MCP.Types.Test
    --   output <- readProcess "mcp-gen" [] ""
    --   let expected = "Finished generating Haskell data types"
    --   -- Check that the output contains the expected substring
    --   (expected `isInfixOf` output) @?= True
  ]
