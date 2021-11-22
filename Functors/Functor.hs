import Data.Char
import Data.List

{- 
>>> :t fmap
fmap :: Functor f => (a -> b) -> f a -> f b
>>> :i Functor
type Functor :: (* -> *) -> Constraint
class Functor f where
  fmap :: (a -> b) -> f a -> f b
  (<$) :: a -> f b -> f a
  {-# MINIMAL fmap #-}
  	-- Defined in ‘GHC.Base’
instance Functor (Either a) -- Defined in ‘Data.Either’
instance Functor [] -- Defined in ‘GHC.Base’
instance Functor Maybe -- Defined in ‘GHC.Base’
instance Functor IO -- Defined in ‘GHC.Base’
instance Functor ((->) r) -- Defined in ‘GHC.Base’
instance Functor ((,,,) a b c) -- Defined in ‘GHC.Base’
instance Functor ((,,) a b) -- Defined in ‘GHC.Base’
instance Functor ((,) a) -- Defined in ‘GHC.Base’
-}

main :: IO ()
main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line

{- Functor : (->) r
>>> :k (->)
(->) :: * -> * -> *
>>> :i (->)
type (->) :: * -> * -> *
data (->) a b
  	-- Defined in ‘GHC.Prim’
infixr -1 ->
instance Applicative ((->) r) -- Defined in ‘GHC.Base’
instance Functor ((->) r) -- Defined in ‘GHC.Base’
instance Monad ((->) r) -- Defined in ‘GHC.Base’
instance Monoid b => Monoid (a -> b) -- Defined in ‘GHC.Base’
instance Semigroup b => Semigroup (a -> b) -- Defined in ‘GHC.Base’

>>> :t fmap (*3) (+100)
fmap (*3) (+100) :: Num b => b -> b
>>> :t (*3) . (+100)
(*3) . (+100) :: Num c => c -> c
>>> fmap (*3) (+100) $ 1
303
>>> (*3) . (+100) $ 1
303
>>> (*3) `fmap` (+100) $ 1
303

>>> :t fmap (*3)
fmap (*3) :: (Functor f, Num b) => f b -> f b
>>> :t fmap (replicate 3)
fmap (replicate 3) :: Functor f => f a -> f [a]

>>> :t id
id :: a -> a
>>> :t fmap id
fmap id :: Functor f => f b -> f b
>>> fmap id []
[]
>>> :t fmap id (*3)
fmap id (*3) :: Num b => b -> b
>>> fmap id $ Just 1
Just 1
-}

-- example, an instance of typeclass Functor, but not a functor
data CMaybe a = CNothing | CJust Int a deriving(Show)
instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter + 1) (f x)

{-
>>> fmap id (CJust 1 2)
CJust 2 2
>>> fmap ((+1) . (*3)) (CJust 1 2)
CJust 2 7
>>> fmap (+1) . fmap (*3) $ CJust 1 2
CJust 3 7
-}


{- (,) a, (,,) a b

-- as type constructor
>>> :k (,)
(,) :: * -> * -> *

-- as data/value constructor
>>> :t (,)
(,) :: a -> b -> (a, b)
>>> :k (,) Int String
(,) Int String :: *
>>> (,) 1 2
(1,2)
>>> :k (,) Int
(,) Int :: * -> *
>>> :t (,) 1
(,) 1 :: Num a => b -> (a, b)
-}
