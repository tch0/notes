import System.Random

{-
>>>:t System.Random.random
System.Random.random :: (Random a, RandomGen g) => g -> (a, g)

>>> :t mkStdGen
mkStdGen :: Int -> StdGen

>>> :t randoms
randoms :: (Random a, RandomGen g) => g -> [a]

>>> :t randomR
randomR :: (Random a, RandomGen g) => (a, a) -> g -> (a, g)

>>> :t randomRs
randomRs :: (Random a, RandomGen g) => (a, a) -> g -> [a]

>>> :t getStdGen
getStdGen :: Control.Monad.IO.Class.MonadIO m => m StdGen
-}

-- implement randoms
randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = random gen in value:randoms' newGen

-- get finite randoms and a random generator
finiteRandoms :: (RandomGen g, Random a) => Int -> g -> ([a], g)
finiteRandoms n gen
    | n <= 0 = ([], gen)
finiteRandoms n gen =
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen
    in (value:restOfList, finalGen)

main :: IO ()
main = do
    gen <- getStdGen
    print (take 30 $ randomRs (1.0, 100.0) gen :: [Double])
    print (let (value, _) = random (mkStdGen 100) in value :: Int)