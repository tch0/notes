import qualified Control.Monad

-- Monad composition

(<=<) :: Monad m => (a -> m b) -> (t -> m a) -> t -> m b
f <=< g = \x -> g x >>= f

f :: a -> [a]
f x = [x]

{-
>>> :t (<=<)
(<=<) :: Monad m => (a -> m b) -> (t -> m a) -> t -> m b
>>> :t (Control.Monad.>=>)
(Control.Monad.>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
-}

-- Monad Law
-- f <=< return = f
-- return <= f = f
-- m >>= f >>= g = m >>= (f <=< g)