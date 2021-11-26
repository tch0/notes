{- about Monad
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
>>> :t return
return :: Monad m => a -> m a
>>> :t fail
fail :: MonadFail m => String -> m a
-}

{- Maybe
>>> return 1 :: Maybe Int
Just 1
>>> Nothing >>= (\x -> Just x)
Nothing
>>> Just 10 >>= (\x -> Just $ x * x)
Just 100
-}

-- example from Learn you haskell for great good
-- pole and birds
type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs (left + n - right) < 4 = Just (left + n, right)
    | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (right + n - left) < 4 = Just (left, right + n)
    | otherwise = Nothing

{- test : a chain of call
>>> :t landLeft 2
landLeft 2 :: Pole -> Maybe Pole
>>> Nothing >>= landLeft 1
Nothing

>>> landLeft 1 (0, 0) >>= landLeft 3 >>= landRight 2 >>= landRight 1
Nothing
>>> landLeft 1 (0, 0) >>= landRight 3 >>= landLeft 2 >>= landRight 1
Just (3,4)
>>> return (0, 0) >>= landLeft 1 >>= landRight 3 >>= landLeft 2 >>= landRight 1
Just (3,4)
-}

{- operator >>
>>> :t (>>)
(>>) :: Monad m => m a -> m b -> m b
>>> Nothing >> Just 1
Nothing
>>> Just 1 >> Just 2 >> Just 3
Just 3
>>> Just 1 >> Just 2 >> Nothing
Nothing
-}

{- the nature of do notation
>>> Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
Just "3!"
>>> Just 3 >>= (\x -> Nothing >>= (\y -> Just (show x ++ y)))
Nothing
>>> foo
Just "3!"
>>> foo'
Just "3!"
-}

foo :: Maybe [Char]
foo = Just 3 >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))

foo' :: Maybe [Char]
foo' = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)

bar :: Maybe Pole
bar = do
    start <- return (0, 0) -- let start = (0, 0)
    second <- landLeft 1 start
    third <- landRight 3 second
    fourth <- landLeft 2 third
    landRight 1 fourth
{-
>>> bar
Just (3,4)
-}