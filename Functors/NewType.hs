import Control.Applicative
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