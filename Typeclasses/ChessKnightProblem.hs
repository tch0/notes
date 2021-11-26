import Data.List
import Control.Monad

-- example: find all possible position for knight to move in chess
-- valid chess posotin : row from 1 to 8, from column 1 to 8
type KnightPos = (Int, Int)
moveKnight :: KnightPos -> [KnightPos]
moveKnight (r, c) = do
    (a, b) <- [(a, b) | a <- [-1, 1], b <- [-2, 2]] -- offset
    (or, oc) <- [(a, b), (b, a)] -- all possible offset
    (rr, rc) <- [(r + or, c + oc)] -- result
    guard (rr `elem` [1..8] && rc `elem` [1..8]) -- filter
    return (rr, rc)

moveKnight3 :: KnightPos -> [KnightPos]
moveKnight3 start = nub $ moveKnight start >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` moveKnight3 start
{-
>>> moveKnight (6, 2)
[(4,1),(5,4),(8,1),(4,3),(7,4),(8,3)]
>>> moveKnight (8, 1)
[(7,3),(6,2)]
>>> moveKnight3 (6, 2)
[(2,1),(1,2),(2,5),(5,2),(4,1),(1,4),(4,5),(5,4),(3,4),(4,3),(3,2),(7,2),(6,1),(6,5),(7,4),(8,1),(8,3),(2,3),(6,3),(3,8),(2,7),(5,8),(6,7),(8,5),(1,6),(4,7),(5,6),(7,8),(8,7),(3,6),(7,6)]
>>> (6,2) `canReachIn3` (6,1)
True
>>> (6,2) `canReachIn3` (7,3)
False
-}