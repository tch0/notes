import Control.Monad
import Control.Applicative
import Data.List

{- List instance: [a]
>>> :i []
type [] :: * -> *
data [] a = [] | a : [a]
  	-- Defined in ‘GHC.Types’
instance Show a => Show [a] -- Defined in ‘GHC.Show’
instance Alternative [] -- Defined in ‘GHC.Base’
instance Applicative [] -- Defined in ‘GHC.Base’
instance Eq a => Eq [a] -- Defined in ‘GHC.Classes’
instance Functor [] -- Defined in ‘GHC.Base’
instance Monad [] -- Defined in ‘GHC.Base’
instance MonadPlus [] -- Defined in ‘GHC.Base’
instance Monoid [a] -- Defined in ‘GHC.Base’
instance Ord a => Ord [a] -- Defined in ‘GHC.Classes’
instance Semigroup [a] -- Defined in ‘GHC.Base’
instance Foldable [] -- Defined in ‘Data.Foldable’
instance Traversable [] -- Defined in ‘Data.Traversable’
instance Read a => Read [a] -- Defined in ‘GHC.Read’
instance MonadFail [] -- Defined in ‘Control.Monad.Fail’

>>> :t fail "an error occured" :: [Int]
fail "an error occured" :: [Int] :: [Int]
>>> return 1 :: [Int]
[1]
>>> :t concat
concat :: Foldable t => t [a] -> [a]
>>> :t (>>=)
(>>=) :: Monad m => m a -> (a -> m b) -> m b
>>> :t (<*>)
(<*>) :: Applicative f => f (a -> b) -> f a -> f b

>>> [1, 2, 3] >>= (\x -> [x, -x]) >>= (\x -> [(x, x * 10)])
[(1,10),(-1,-10),(2,20),(-2,-20),(3,30),(-3,-30)]
>>> [(x, x * 10) | n <- [1, 2, 3], x <- [n, -n]]
[(1,10),(-1,-10),(2,20),(-2,-20),(3,30),(-3,-30)]
>>> [] >>= (\x -> ["hello", "world"])
[]
>>> [1, 2, 3] >>= (\x -> [])
[]
-}

listOfTuples :: [Integer ] -> [(Integer, Integer)]
listOfTuples l = do
    n <- l
    m <- [n, -n]
    return (m, m * 10)
{-
>>> listOfTuples [1, 2, 3]
[(1,10),(-1,-10),(2,20),(-2,-20),(3,30),(-3,-30)]
-}

listOfTuples' :: [(Int,Char)]
listOfTuples' = do
    n <- [1,2]
    ch <- ['a','b']
    return (n,ch)
{-
>>> listOfTuples'
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
>>> [(n, ch) | n <- [1, 2], ch <- ['a', 'b']]
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
-}

listOfTuples'' :: [(Int, Char)]
listOfTuples'' = [1, 2] >>= (\n ->
                ['a', 'b'] >>= (\ch ->
                [(n, ch)]))
{-
>>> listOfTuples''
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
-}

{- guard function & MonadPlus typeclass in Control.Monad
>>> :t guard
guard :: Alternative f => Bool -> f ()
>>> :i MonadPlus
type MonadPlus :: (* -> *) -> Constraint
class (Alternative m, Monad m) => MonadPlus m where
  mzero :: m a
  mplus :: m a -> m a -> m a
  	-- Defined in ‘GHC.Base’
instance MonadPlus [] -- Defined in ‘GHC.Base’
instance MonadPlus Maybe -- Defined in ‘GHC.Base’
instance MonadPlus IO -- Defined in ‘GHC.Base’

>>> guard (5 > 2) :: [()]
[()]
>>> guard (2 > 3) :: [()]
[]
>>> [()] >> return "cool" :: [String]
["cool"]
>>> [] >> return "cool" :: [String]
[]
>>> [(), ()] >> return "cool" :: [String]
["cool","cool"]
>>> [1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)
[7,17,27,37,47]
>>> [x | x <- [1..50], '7' `elem` show x]
[7,17,27,37,47]
>>> [1..50] >>= (\x -> if ('7' `elem` show x) then [x] else [])
[7,17,27,37,47]
>>> sevensOnly
[7,17,27,37,47]
>>> do x <- [1..50]; guard ('7' `elem` show x); return x
[7,17,27,37,47]
-}

sevensOnly :: [Integer]
sevensOnly = do
    x <- [1..50]
    guard ('7' `elem` show x)
    return x

{-
>>> :t ()
() :: ()
>>> :i ()
type () :: *
data () = ()
  	-- Defined in ‘GHC.Tuple’
instance Enum () -- Defined in ‘GHC.Enum’
instance Show () -- Defined in ‘GHC.Show’
instance Eq () -- Defined in ‘GHC.Classes’
instance Monoid () -- Defined in ‘GHC.Base’
instance Ord () -- Defined in ‘GHC.Classes’
instance Semigroup () -- Defined in ‘GHC.Base’
instance Read () -- Defined in ‘GHC.Read’
instance Bounded () -- Defined in ‘GHC.Enum’
-}

{- >> of []
>>> [1..5] >> return 1
[1,1,1,1,1]
>>> [1..5] >> return [()]
[[()],[()],[()],[()],[()]]
>>> [1..5] >> [0, 1, 2]
[0,1,2,0,1,2,0,1,2,0,1,2,0,1,2]
-}