{- a route planing problem LEARN YOU A HASKELL FOR GREAT GOOD
example:
    50      5       40      10
A-------------------------------
C       |30     |20     |25     |0  destination
B-------------------------------
    10      90      2       8

best route: BCACBB(C)
best length: 75

input: many groups of length of ABC
this example: 50  10  30  5  90  20  40  2  25  10  8  0
-}

-- a section of road, Section a b c
data Section = Section {getA :: Int, getB :: Int, getC :: Int} deriving(Show)
type RoadSystem = [Section]
-- example : [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

-- type of path
data Label = A | B | C deriving(Show)
type Path = [(Label, Int)]

-- One step of road, input the optimal path to current node of A & B and this section of road,
-- get next optimal path to next node of A & B.
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
    let priceA = sum $ map snd pathA
        priceB = sum $ map snd pathB
        forwardPriceToA = priceA + a
        crossPriceToA = priceB + b + c
        forwardPriceToB = priceB + b
        crossPriceToB = priceA + a + c
        newPathToA = if forwardPriceToA <= crossPriceToA
                        then (A,a):pathA -- path is a reverse list of actual path, from right to left
                        else (C,c):(B,b):pathB
        newPathToB = if forwardPriceToB <= crossPriceToB
                        then (B,b):pathB
                        else (C,c):(A,a):pathA
    in (newPathToA, newPathToB)

-- expected return of example: [(B,10),(C,30),(A,5),(C,20),(B,2),(B,8)]
optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
    let (bestPathA, bestPathB) = foldl roadStep ([], []) roadSystem -- if stackoverflow, try strict version foldl'
    in if sum (map snd bestPathA) > sum (map snd bestPathB)
            then reverse bestPathA
            else reverse bestPathB

{- test of example
>>> optimalPath [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]
[(B,10),(C,30),(A,5),(C,20),(B,2),(B,8)]
-}

-- -- group input data into sections
groupsOf :: Int -> [a] -> [[a]]
groupsOf _ [] = []
groupsOf n _
        | n <= 0 = undefined
groupsOf n xs = take n xs : groupsOf n (drop n xs)

-- read input from stdin
main :: IO ()
main = do
    contents <- getContents
    let threes = groupsOf 3 (map read $ lines contents)
        roadSystem = map (\[a, b, c] -> Section a b c) threes
        path = optimalPath roadSystem
        pathString = concatMap (show . fst) path -- concat $ map (show . fst) path
        pathLength = sum $ map snd path
    putStrLn $ "Best path is : " ++ show pathString
    putStrLn $ "Best length is : " ++ show pathLength

-- run:
-- cat road.txt | stack exec runhaskell RoutePlaning.hs
-- type road.txt | stack exec runhaskell RoutePlaning.hs (on windows)