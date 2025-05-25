module Main (main) where

import           Props      (allProps)
import           Test.Tasty (defaultMain, testGroup)

main :: IO ()
main = defaultMain $ testGroup "All Tests"
  [
    allProps -- Run all properties from Props
  ]
