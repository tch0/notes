{- library of TestStack project
-}
module Lib
    ( someFunc
    ) where

import qualified System.Random
import Acme.Missiles ( launchMissiles )

someFunc :: IO ()
someFunc = launchMissiles
