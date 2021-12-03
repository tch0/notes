-- when we talk about Readr Monad, the actual thing we talk about is function
-- fucntion is also a Monad

{-
>>> :i Monad
type Monad :: (* -> *) -> Constraint
class Applicative m => Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a
  {-# MINIMAL (>>=) #-}
  	-- Defined in ‘GHC.Base’
instance Monad (Either e) -- Defined in ‘Data.Either’
instance Monad [] -- Defined in ‘GHC.Base’
instance Monad Maybe -- Defined in ‘GHC.Base’
instance Monad IO -- Defined in ‘GHC.Base’
instance Monad ((->) r) -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b, Monoid c) => Monad ((,,,) a b c)
  -- Defined in ‘GHC.Base’
instance (Monoid a, Monoid b) => Monad ((,,) a b)
  -- Defined in ‘GHC.Base’
instance Monoid a => Monad ((,) a) -- Defined in ‘GHC.Base’

>>> :t (>>=)
(>>=) :: Monad m => m a -> (a -> m b) -> m b

-- final >>= of ((->) r): (>>=) :: (r -> a) -> (a -> r -> b) -> r -> b
-}

addStuff :: Int -> Int
addStuff = do
    a <- (*2)
    b <- (+10)
    return (a + b)

addStuff' :: Int -> Int
addStuff' x = let
    a = (*2) x
    b = (+10) x
    in a + b
{-
>>> addStuff 3
19
>>> addStuff' 3
19
-}