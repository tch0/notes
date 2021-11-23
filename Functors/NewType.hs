import Control.Applicative
import Data.Monoid
{- newtype keyword
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

>>> showPair (Pair (1, 2))
"Pair {getTuple = (1,2)}"

>>> getPair' $ fmap reverse (Pair' ("hello", 3))
("olleh",3)
-}

newtype MyZipList a = MyZipList {getMyZipList :: [a]}

newtype Pair a b = Pair {getTuple :: (a, b)} deriving(Show, Read, Eq)

showPair :: (Show a, Show b) => Pair a b -> String
showPair (Pair (a, b)) = show (Pair (a, b))

newtype Pair' b a = Pair' {getPair' :: (a, b)} deriving(Eq, Read, Show)
instance Functor (Pair' b) where
    fmap f (Pair' (x, y)) = Pair' (f x, y)

{- laziness of newtype
>>> :t undefined
undefined :: a
>>> [0, 1, 2, 3, undefined, 5, undefined] !! 5
5
>>> sum [0, 1, 2, 3, undefined, 5, undefined]
Prelude.undefined
>>> undefined
Prelude.undefined
-}

data NewBool = NewBool {getNewBool :: Bool}
helloBool :: NewBool -> [Char]
helloBool (NewBool _) = "hello"
{-
>>> helloBool undefined
Prelude.undefined
-}

newtype NewBool' = NewBool' {getNewBool' :: Bool}
helloBool' :: NewBool' -> [Char]
helloBool' (NewBool' _) = "hello"
{-
>>> helloBool' undefined
"hello"
-}


{- type & data & newtype
>>> :t PhoneBook
PhoneBook :: PersonName -> PhoneNumber -> PhoneBook
-}
type PersonName = String
type PhoneNumber = String
data PhoneBook = PhoneBook PersonName PhoneNumber deriving(Show, Read, Eq)

{- Maybe a
>>> Nothing `mappend` Just "hello"
Just "hello"
>>> Just "hello" `mappend` Nothing
Just "hello"
>>> Just "hello" `mappend` Just "world"
Just "helloworld"
-}

{- First a & Last a
>>> mempty :: First a
First {getFirst = Nothing}
>>> First Nothing `mappend` First (Just 1)
First {getFirst = Just 1}
>>> First (Just 1) `mappend` First Nothing
First {getFirst = Just 1}
>>> First (Just 1) `mappend` First (Just 2)
First {getFirst = Just 1}

>>> mempty :: Last a
Last {getLast = Nothing}
>>> Last Nothing `mappend` Last (Just 1)
Last {getLast = Just 1}
>>> Last (Just 1) `mappend` Last Nothing
Last {getLast = Just 1}
-}

{-Foldable
>>> :i foldr
type Foldable :: (* -> *) -> Constraint
class Foldable t where
  ...
  foldr :: (a -> b -> b) -> b -> t a -> b
  ...
  	-- Defined in ‘Data.Foldable’

>>> foldl (+) 1 [1, 2, 3]
7
>>> foldl (+) 2 (Just 3)
5
>>> foldr (||) False (Just True)
True

>>> :i Foldable
type Foldable :: (* -> *) -> Constraint
class Foldable t where
  fold :: Monoid m => t m -> m
  foldMap :: Monoid m => (a -> m) -> t a -> m
  foldMap' :: Monoid m => (a -> m) -> t a -> m
  foldr :: (a -> b -> b) -> b -> t a -> b
  foldr' :: (a -> b -> b) -> b -> t a -> b
  foldl :: (b -> a -> b) -> b -> t a -> b
  foldl' :: (b -> a -> b) -> b -> t a -> b
  foldr1 :: (a -> a -> a) -> t a -> a
  foldl1 :: (a -> a -> a) -> t a -> a
  toList :: t a -> [a]
  null :: t a -> Bool
  length :: t a -> Int
  elem :: Eq a => a -> t a -> Bool
  maximum :: Ord a => t a -> a
  minimum :: Ord a => t a -> a
  sum :: Num a => t a -> a
  product :: Num a => t a -> a
  {-# MINIMAL foldMap | foldr #-}
  	-- Defined in ‘Data.Foldable’
instance Foldable (Const m) -- Defined in ‘Data.Functor.Const’
instance Foldable [] -- Defined in ‘Data.Foldable’
instance Foldable Sum -- Defined in ‘Data.Foldable’
instance Foldable Product -- Defined in ‘Data.Foldable’
instance Foldable Maybe -- Defined in ‘Data.Foldable’
instance Foldable Last -- Defined in ‘Data.Foldable’
instance Foldable First -- Defined in ‘Data.Foldable’
instance Foldable (Either a) -- Defined in ‘Data.Foldable’
instance Foldable Dual -- Defined in ‘Data.Foldable’
instance Foldable f => Foldable (Ap f)
  -- Defined in ‘Data.Foldable’
instance Foldable f => Foldable (Alt f)
  -- Defined in ‘Data.Foldable’
instance Foldable ((,) a) -- Defined in ‘Data.Foldable’
instance Foldable ZipList -- Defined in ‘Control.Applicative’
-}

-- fold a tree
data Tree a = EmptyTree | TreeNode a (Tree a) (Tree a) deriving(Show, Read, Eq)
instance Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (TreeNode x l r) = foldMap f l `mappend` f x `mappend` foldMap f r

testTree :: Tree Integer
testTree = TreeNode 5 
    (TreeNode 3 
        (TreeNode 1 EmptyTree EmptyTree) 
        (TreeNode 6 EmptyTree EmptyTree)
    )
    (TreeNode 9 
        (TreeNode 8 EmptyTree EmptyTree) 
        (TreeNode 10 EmptyTree EmptyTree)
    )
{-
>>> foldl (+) 0 testTree
42
>>> foldr (*) 1 testTree
64800
>>> foldMap (\x -> [x]) testTree
[1,3,6,5,8,9,10]
>>> getAny $ foldMap (\x -> Any $ x > 10) testTree
False
>>> getAll $ foldMap (\x -> All $ x > 5) testTree
False
-}
