module DefineType
( Shape(Circle)
) where

import qualified Data.Map

{-
>>> :i Bool
type Bool :: *
data Bool = False | True
  	-- Defined in ‘GHC.Types’
instance Enum Bool -- Defined in ‘GHC.Enum’
instance Show Bool -- Defined in ‘GHC.Show’
instance Eq Bool -- Defined in ‘GHC.Classes’
instance Ord Bool -- Defined in ‘GHC.Classes’
instance Read Bool -- Defined in ‘GHC.Read’
instance Bounded Bool -- Defined in ‘GHC.Enum’
>>> shape
Circle 1.0 2.0 3.0
>>> :t shape
shape :: Shape
>>> shape == Circle 1.0 2.0 3.1
False
>>> Rectangle 1 2 3 4
Rectangle 1.0 2.0 3.0 4.0
-}

data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show, Eq)

shape :: Shape
shape = Circle 1 2 3


{-
>>> kim = Person "kim" "Possible" 20 160 "Call me later!"
>>> firstName kim
>>> lastName kim
>>> age kim
>>> height kim
"kim"
"Possible"
20
160.0
-}
data Person = Person String String Int Float String deriving (Show)
firstName :: Person -> String
firstName (Person firstname _ _ _ _) = firstname
lastName :: Person -> String
lastName (Person _ lastname _ _ _ ) = lastname
age :: Person -> Int
age (Person _ _ age _ _ ) = age
height :: Person -> Float
height (Person _ _ _ height _) = height
phoneNumber :: Person -> String
phoneNumber (Person _ _ _ _ number) = number

{- Record Syntax
>>> kim = Person' "kim" "Possible" 20 160 "Call me later!"
>>> firstName' kim
>>> lastName' kim
>>> age' kim
>>> height' kim
"kim"
"Possible"
20
160.0
>>> :t firstName'
firstName' :: Person' -> String
>>> kim
Person' {firstName' = "kim", lastName' = "Possible", age' = 20, height' = 160.0, phoneNumber' = "Call me later!"}
-}

data Person' = Person' {
    firstName' :: String,
    lastName' :: String,
    age' :: Int,
    height' :: Float,
    phoneNumber' :: String
} deriving(Show)

{- type parameters, type constrcutors
>>> :t Nothing
Nothing :: Maybe a
>>> :t Data.Map.fromList
Data.Map.fromList :: Ord k => [(k, a)] -> Map k a
>>> :i Data.Map.Map
type role Map nominal representational
type Map :: * -> * -> *
data Map k a
  = Bin {-# UNPACK #-}Size !k a !(Map k a) !(Map k a) | Tip
  	-- Defined in ‘Data.Map.Internal’
instance (Show k, Show a) => Show (Map k a)
  -- Defined in ‘Data.Map.Internal’
instance (Eq k, Eq a) => Eq (Map k a)
  -- Defined in ‘Data.Map.Internal’
instance Functor (Map k) -- Defined in ‘Data.Map.Internal’
instance Ord k => Monoid (Map k v)
  -- Defined in ‘Data.Map.Internal’
instance (Ord k, Ord v) => Ord (Map k v)
  -- Defined in ‘Data.Map.Internal’
instance Ord k => Semigroup (Map k v)
  -- Defined in ‘Data.Map.Internal’
instance Foldable (Map k) -- Defined in ‘Data.Map.Internal’
instance Traversable (Map k) -- Defined in ‘Data.Map.Internal’
instance (Ord k, Read k, Read e) => Read (Map k e)
  -- Defined in ‘Data.Map.Internal’

>>> :i Data.Map.toList
toList :: Map k a -> [(k, a)] 	-- Defined in ‘Data.Map.Internal’
-}

