import Data.Monoid
import Data.Function
import Data.Char
{- Monoid
>>> :i Monoid
type Monoid :: * -> Constraint
class Semigroup a => Monoid a where
  mempty :: a
  mappend :: a -> a -> a
  mconcat :: [a] -> a
  {-# MINIMAL mempty #-}
  	-- Defined in ‘GHC.Base’
instance Monoid [a] -- Defined in ‘GHC.Base’
instance Monoid Ordering -- Defined in ‘GHC.Base’
instance Semigroup a => Monoid (Maybe a) -- Defined in ‘GHC.Base’
instance Monoid a => Monoid (IO a) -- Defined in ‘GHC.Base’
instance Monoid b => Monoid (a -> b) -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b, Monoid c, Monoid d, Monoid e) =>
         Monoid (a, b, c, d, e)
  -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b, Monoid c, Monoid d) =>
         Monoid (a, b, c, d)
  -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b, Monoid c) => Monoid (a, b, c)
  -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b) => Monoid (a, b)
  -- Defined in ‘GHC.Base’
instance Monoid () -- Defined in ‘GHC.Base’

>>> :t mempty
mempty :: Monoid a => a
>>> :t mappend
mappend :: Monoid a => a -> a -> a
>>> :t mconcat
mconcat :: Monoid a => [a] -> a
-}

{- built in Monoids
-- List : [a]
>>> mempty :: [a]
[]
>>> [1, 2] `mappend` [3, 4]
[1,2,3,4]
>>> mconcat [[1, 2], [3, 4], [5, 6, 7]]
[1,2,3,4,5,6,7]
-}

newtype Test = Test [Int]

addTest :: Test -> Test -> Test
addTest (Test xs) (Test ys) = Test (xs ++ ys)

instance Monoid Test where
    mempty = Test []
    mappend = addTest

instance Semigroup Test where
    (<>) = mappend

{------ Product & Sum
>>> :i Product
type Product :: * -> *
newtype Product a = Product {getProduct :: a}
  	-- Defined in ‘Data.Semigroup.Internal’
instance Num a => Num (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Show a => Show (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Applicative Product
  -- Defined in ‘Data.Semigroup.Internal’
instance Eq a => Eq (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Foldable Product -- Defined in ‘Data.Foldable’
instance Functor Product -- Defined in ‘Data.Semigroup.Internal’
instance Monad Product -- Defined in ‘Data.Semigroup.Internal’
instance Ord a => Ord (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Read a => Read (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Num a => Monoid (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Num a => Semigroup (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Bounded a => Bounded (Product a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Traversable Product -- Defined in ‘Data.Traversable’

>>> :i Sum
type Sum :: * -> *
newtype Sum a = Sum {getSum :: a}
  	-- Defined in ‘Data.Semigroup.Internal’
instance Num a => Num (Sum a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Show a => Show (Sum a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Applicative Sum -- Defined in ‘Data.Semigroup.Internal’
instance Eq a => Eq (Sum a) -- Defined in ‘Data.Semigroup.Internal’
instance Foldable Sum -- Defined in ‘Data.Foldable’
instance Functor Sum -- Defined in ‘Data.Semigroup.Internal’
instance Monad Sum -- Defined in ‘Data.Semigroup.Internal’
instance Ord a => Ord (Sum a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Read a => Read (Sum a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Num a => Monoid (Sum a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Num a => Semigroup (Sum a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Bounded a => Bounded (Sum a)
  -- Defined in ‘Data.Semigroup.Internal’
instance Traversable Sum -- Defined in ‘Data.Traversable’

>>> getSum . mconcat . map Sum $ [1, 2, 3]
6
>>> getProduct . mconcat . map Product $ [1, 10, 100]
1000
-}

{- Any & All for Bool
>>> :i Any
type Any :: *
newtype Any = Any {getAny :: Bool}
  	-- Defined in ‘Data.Semigroup.Internal’
instance Show Any -- Defined in ‘Data.Semigroup.Internal’
instance Eq Any -- Defined in ‘Data.Semigroup.Internal’
instance Ord Any -- Defined in ‘Data.Semigroup.Internal’
instance Read Any -- Defined in ‘Data.Semigroup.Internal’
instance Monoid Any -- Defined in ‘Data.Semigroup.Internal’
instance Semigroup Any -- Defined in ‘Data.Semigroup.Internal’
instance Bounded Any -- Defined in ‘Data.Semigroup.Internal’

>>> :i All
type All :: *
newtype All = All {getAll :: Bool}
  	-- Defined in ‘Data.Semigroup.Internal’
instance Show All -- Defined in ‘Data.Semigroup.Internal’
instance Eq All -- Defined in ‘Data.Semigroup.Internal’
instance Ord All -- Defined in ‘Data.Semigroup.Internal’
instance Read All -- Defined in ‘Data.Semigroup.Internal’
instance Monoid All -- Defined in ‘Data.Semigroup.Internal’
instance Semigroup All -- Defined in ‘Data.Semigroup.Internal’
instance Bounded All -- Defined in ‘Data.Semigroup.Internal’

>>> getAll . mconcat . map All $ [True, True, False]
False
>>> getAny . mconcat . map Any $ [False, False, True]
True
-}

{---------Ordering
>>> :i Ordering
type Ordering :: *
data Ordering = LT | EQ | GT
  	-- Defined in ‘GHC.Types’
instance Enum Ordering -- Defined in ‘GHC.Enum’
instance Show Ordering -- Defined in ‘GHC.Show’
instance Eq Ordering -- Defined in ‘GHC.Classes’
instance Ord Ordering -- Defined in ‘GHC.Classes’
instance Read Ordering -- Defined in ‘GHC.Read’
instance Monoid Ordering -- Defined in ‘GHC.Base’
instance Semigroup Ordering -- Defined in ‘GHC.Base’
instance Bounded Ordering -- Defined in ‘GHC.Enum’

>>> lengthCompare "hello" "world"
LT
>>> lengthCompare "hello1" "world"
GT
>>> lengthCompare' "hello" "world"
LT
>>> mconcat (zipWith compare "abcd" "abce")
LT
-}

-- usage
lengthCompare :: String -> String -> Ordering
lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)
-- just write as an example, not necessary
lengthCompare' :: String -> String -> Ordering
lengthCompare' x y = mconcat $ [compare `on` length, compare, compare `on` map toUpper] <*> [x] <*> [y]

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
