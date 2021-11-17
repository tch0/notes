module Main where

import Lib ( someFunc )
import Data.Function ( on )

main :: IO ()
main = someFunc


f :: [a] -> [a] -> Bool
f = (==) `on` length
