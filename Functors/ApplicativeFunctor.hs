import Control.Applicative
{-# LANGUAGE FlexibleContexts #-}

{- about Applicative
>>> :k Applicative
Applicative :: (* -> *) -> Constraint
>>> :i Applicative
type Applicative :: (* -> *) -> Constraint
class Functor f => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b
  liftA2 :: (a -> b -> c) -> f a -> f b -> f c
  (*>) :: f a -> f b -> f b
  (<*) :: f a -> f b -> f a
  {-# MINIMAL pure, ((<*>) | liftA2) #-}
  	-- Defined in ‘GHC.Base’
instance Monoid m => Applicative (Const m)
  -- Defined in ‘Data.Functor.Const’
instance Applicative ZipList -- Defined in ‘Control.Applicative’
instance Monad m => Applicative (WrappedMonad m)
  -- Defined in ‘Control.Applicative’
instance Arrow a => Applicative (WrappedArrow a b)
  -- Defined in ‘Control.Applicative’
instance Applicative (Either e) -- Defined in ‘Data.Either’
instance Applicative [] -- Defined in ‘GHC.Base’
instance Applicative Maybe -- Defined in ‘GHC.Base’
instance Applicative IO -- Defined in ‘GHC.Base’
instance Applicative ((->) r) -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b, Monoid c) =>
         Applicative ((,,,) a b c)
  -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b) => Applicative ((,,) a b)
  -- Defined in ‘GHC.Base’
instance Monoid a => Applicative ((,) a) -- Defined in ‘GHC.Base’
-}

{---------------------function in Functor-------------------------------------------
>>> :t fmap (*) (Just 3)
fmap (*) (Just 3) :: Num a => Maybe (a -> a)
>>> :t Just (* 3)
Just (* 3) :: Num a => Maybe (a -> a)

>>> :t fmap (\x y z w -> x + y + z + w) (Just 1)
fmap (\x y z w -> x + y + z + w) (Just 1) :: Num a => Maybe (a -> a -> a -> a)

-- call functions in Functor
>>> fmap (\f -> f 10) (Just (* 3)) 
Just 30
>>> :t fmap (\f -> f 10) (fmap (\x y z w -> x + y + z + w) (Just 1))
fmap (\f -> f 10) (fmap (\x y z w -> x + y + z + w) (Just 1)) :: Num t => Maybe (t -> t -> t)

--- to be understood
>>> :t fmap (*) (*3)
fmap (*) (*3) :: Num a => a -> a -> a
>>> :t (*) . (*3)
(*) . (*3) :: Num a => a -> a -> a
>>> :t (*3) . (*)
(*3) . (*) :: (Num a, Num (a -> a)) => a -> a -> a
-}

{----------------------use Applicatives <*>, pure, liftA2----------------------
>>> :t fmap
fmap :: Functor f => (a -> b) -> f a -> f b
>>> :t (<*>)
(<*>) :: Applicative f => f (a -> b) -> f a -> f b
>>> :t pure
pure :: Applicative f => a -> f a
>>> :t liftA2
liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c

>>> Just (*3) <*> Just 10
Just 30
>>> pure (*3) <*> Just 10
Just 30
>>> Just (*3) <*> Nothing
Nothing
>>> Nothing <*> Just 10
Nothing
>>> Just reverse <*> Just "hello"
Just "olleh"

-- more parameters
>>> Just (*) <*> Just 3 <*> Just 10
Just 30
>>> pure (+) <*> Just 3 <*> Nothing
Nothing
>>> Nothing <*> Just 3 <*> Just 10
Nothing
>>> Just (\x y z -> x + y + z) <*> Just 1 <*> Just 2 <*> Just 3
Just 6
>>> :t Just (\x y z -> x + y + z) <*> Just 1
Just (\x y z -> x + y + z) <*> Just 1 :: Num a => Maybe (a -> a -> a)
>>> liftA2 (\x y z -> x + y + z) (Just 1) (Just 2) <*> Just 3
Just 6
>>> pure 1
1
-}

{-------------------pure <$> <*> ------------------------------------------------
>>> :t fmap
fmap :: Functor f => (a -> b) -> f a -> f b
>>> fmap (+) (Just 1) <*> (Just 2)
Just 3
>>> (*) <$> (Just 1) <*> (Just 2)
Just 2
>>> (++) <$> Just "hello" <*> Just "world"
Just "helloworld"
>>> (++) "hello" "world"
"helloworld"

>>> :t pure
pure :: Applicative f => a -> f a
>>> :t pure :: a -> [a]
pure :: a -> [a] :: a -> [a]

>>> pure "hello" :: [String]
["hello"]
>>> pure "hello" :: Maybe String
Just "hello"
>>> pure "hello"
"hello"
-}

{-----------------List-------------------------------------------------------------
>>> [(+), (-), (*)] <*> [1..3] <*> [1..3]
[2,3,4,3,4,5,4,5,6,0,-1,-2,1,0,-1,2,1,0,1,2,3,2,4,6,3,6,9]
>>> [(\x y z -> x + y + z)] <*> [1..3] <*> [1..3] <*> [1..3]
[3,4,5,4,5,6,5,6,7,4,5,6,5,6,7,6,7,8,5,6,7,6,7,8,7,8,9]

-- just like list comprehension
>>> [x * y | x <- [1..5], y <- [6..10]]
[6,7,8,9,10,12,14,16,18,20,18,21,24,27,30,24,28,32,36,40,30,35,40,45,50]
>>> (*) <$> [1..5] <*> [6..10]
[6,7,8,9,10,12,14,16,18,20,18,21,24,27,30,24,28,32,36,40,30,35,40,45,50]
>>> filter (>25) $ (*) <$> [1..5] <*> [6..10]
[27,30,28,32,36,40,30,35,40,45,50]
-}

{-----------------IO--------------------------------------------------------------
>>> :i IO
type IO :: * -> *
newtype IO a = IO (State# RealWorld -> (# State# RealWorld, a #))
  	-- Defined in ‘GHC.Types’
instance Alternative IO -- Defined in ‘GHC.Base’
instance Applicative IO -- Defined in ‘GHC.Base’
instance Functor IO -- Defined in ‘GHC.Base’
instance Monad IO -- Defined in ‘GHC.Base’
instance Monoid a => Monoid (IO a) -- Defined in ‘GHC.Base’
instance Semigroup a => Semigroup (IO a) -- Defined in ‘GHC.Base’
instance MonadFail IO -- Defined in ‘Control.Monad.Fail’

>>> :t return
return :: Monad m => a -> m a
>>> :t sequence
sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)
-}
concatLine :: IO String
concatLine = do
    a <- getLine
    b <- getLine 
    return $ a ++ b

concatLine' :: IO String 
concatLine' = (++) <$> getLine <*> getLine


main :: IO ()
main = do
    s <- concatLine
    putStrLn s
    s2 <- concatLine'
    putStrLn s2

{---------------------(->) r----------------------------------------------------
>>> :t (<*>)
(<*>) :: Applicative f => f (a -> b) -> f a -> f b

>>> :t pure 3
pure 3 :: (Applicative f, Num a) => f a
>>> :t (pure 3) "hello"
(pure 3) "hello" :: Num t => t
>>> (pure 3) "hello"
3
>>> pure 3 "hello"
3
>>> pure 3
3
>>> pure 3 "hello"
3
-}

-------------- <*>
{-
>>> f "10" 5
15.0
>>> g "10"
100
>>> f <*> g $ "10"
110.0
>>> (\x -> f x (g x)) "10"
110.0
>>> f "10" (g "10")
110.0
-}
-- <*> :: (r -> a -> b) -> (r -> a) -> (r -> b)
-- example : r String, a Int, b Double
f :: String -> Int -> Double
f s x = read s + fromIntegral x

g :: String -> Int
g s = read s * 10


{---------- use <*> and <$>
>>> :t (+) <*> (*100)
(+) <*> (*100) :: Num a => a -> a
>>> (+) <*> (*100) $ 10
1010

>>> :t (+) <$> (+3) <*> (*100)
(+) <$> (+3) <*> (*100) :: Num b => b -> b
>>> (+) <$> (+3) <*> (*100) $ 5 
508
>>> (\x -> (x+3) + (x*100)) 5
508
>>> ((+) . (+3)) <*> (*100) $ 5
508

>>> (\x y -> [x, y]) <$> (+1) <*> (*10) $ (10 :: Int)
[11,100]
>>> (\x y z -> [x,y,z]) <$> (+3) <*> (*2) <*> (/2) $ 5
[8.0,10.0,2.5]
-}


{-----------------------ZipList-------------------------------------------
>>> [(+3), (*2)] <*> [1, 2]
[4,5,2,4]

>>> :i ZipList
type ZipList :: * -> *
newtype ZipList a = ZipList {getZipList :: [a]}
  	-- Defined in ‘Control.Applicative’
instance Alternative ZipList -- Defined in ‘Control.Applicative’
instance Applicative ZipList -- Defined in ‘Control.Applicative’
instance Eq a => Eq (ZipList a) -- Defined in ‘Control.Applicative’
instance Foldable ZipList -- Defined in ‘Control.Applicative’
instance Functor ZipList -- Defined in ‘Control.Applicative’
instance Ord a => Ord (ZipList a)
  -- Defined in ‘Control.Applicative’
instance Read a => Read (ZipList a)
  -- Defined in ‘Control.Applicative’
instance Show a => Show (ZipList a)
  -- Defined in ‘Control.Applicative’
instance Traversable ZipList -- Defined in ‘Data.Traversable’


>>> ZipList [(+3), (*2)] <*> ZipList [1, 2]
ZipList {getZipList = [4,4]}
>>> getZipList (ZipList [(+3), (*2)] <*> ZipList [1, 2])
[4,4]
>>> getZipList $ (+) <$> ZipList [1, 2] <*> ZipList [2, 3]
[3,5]
>>> getZipList $ (,,) <$> ZipList "dog" <*> ZipList "cat" <*> ZipList "rat"
[('d','c','r'),('o','a','a'),('g','t','t')]
-}

{---------------leftA2--------------------------------------------------
>>> :t liftA2
liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c

-- problem : use (:) add Just 2 to Just [3, 4], result is Just [2, 3, 4].
>>> (:) <$> Just 2 <*> Just [3, 4]
Just [2,3,4]
>>> sequenceA [Just 1, Just 2, Just 3]
Just [1,2,3]
>>> :t sequenceA
sequenceA :: (Traversable t, Applicative f) => t (f a) -> f (t a)

>>> sequenceA' [Just 1, Just 2, Just 3]
Just [1,2,3]
>>> sequenceA'' [Just 1, Just 2, Just 3]
Just [1,2,3]
>>> sequenceA [[1, 2], [3, 4]]
[[1,3],[1,4],[2,3],[2,4]]
>>> sequenceA [[1, 2], [3, 4], []]
[]

-- apply to functions
>>> :t sequenceA [(>2), (>3)]
sequenceA [(>2), (>3)] :: (Ord a, Num a) => a -> [Bool]
>>> sequenceA [(>2), (>3)] 3
[True,False]
>>> map (\f -> f 3) [(>2), (>3)]
[True,False]
-}

-- turn list of applicatives to applicative of list
sequenceA' :: Applicative f => [f a] -> f [a]
sequenceA' [] = pure []
sequenceA' (x:xs) = (:) <$> x <*> sequenceA' xs

sequenceA'' :: Applicative f => [f a] -> f [a]
sequenceA'' = foldr (\x xs -> (:) <$> x <*> xs) (pure [])

sequenceA''' :: Applicative f => [f a] -> f [a]
sequenceA''' = foldr (liftA2 (:)) (pure [])

{- sequenceA & sequence
>>> :t sequenceA [getLine, getLine, getLine]
sequenceA [getLine, getLine, getLine] :: IO [String]
>>> :t sequence [getLine, getLine]
sequence [getLine, getLine] :: IO [String]
>>> :t sequence
sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)
>>> :t sequenceA
sequenceA :: (Traversable t, Applicative f) => t (f a) -> f (t a)
-}