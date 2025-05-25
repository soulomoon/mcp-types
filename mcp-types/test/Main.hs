module Main (main) where

import Test.Tasty (defaultMain, testGroup)
import Props (allProps)

main :: IO ()
main = defaultMain $ testGroup "All Tests"
  [
    allProps -- Run all properties from Props
  ]
