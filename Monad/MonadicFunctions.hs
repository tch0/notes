import Control.Monad
import Control.Applicative
import Control.Monad.Writer
{-liftM: equals to fmap
>>> :t liftM
liftM :: Monad m => (a1 -> r) -> m a1 -> m r
>>> :t fmap
fmap :: Functor f => (a -> b) -> f a -> f b

>>> liftM (*2) (Just 10)
Just 20
>>> liftM (*2) [1, 2, 3]
[2,4,6]
>>> :t liftM not
liftM not :: Monad m => m Bool -> m Bool
>>> runWriter $ liftM not $ writer (True, "whatever")
(False,"whatever")

>>> :t (<*>)
(<*>) :: Applicative f => f (a -> b) -> f a -> f b

>>> Just (*3) `apply` Just 5
Just 15

>>> :t liftA2
liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
-}

apply :: Monad m => m (a -> b) -> m a -> m b
apply mf m = do
    f <- mf
    x <- m
    return (f x)

{- join
>>> :t join
join :: Monad m => m (m a) -> m a

>>> join (Just (Just 1))
Just 1
>>> join . join $ (Just (Just (Just 1)))
Just 1
>>> join $ Just Nothing
Nothing
>>> join [[1, 2, 3], [4, 5, 6]]
[1,2,3,4,5,6]
>>> runWriter $ join (writer (writer (1, "aaa"), "bbb"))
(1,"bbbaaa")
>>> join (Right (Right 1))
Right 1
>>> join (Right (Left "error"))
Left "error"
-}

{- filterM
>>> :t filter
filter :: (a -> Bool) -> [a] -> [a]
>>> :t filterM
filterM :: Applicative m => (a -> m Bool) -> [a] -> m [a]
>>> filterM (\a -> Just (a > 0)) $ [-10..0] ++ [0..10]
Just [1,2,3,4,5,6,7,8,9,10]
>>> filterM (\a -> [True, False]) [1, 2, 3]
[[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
-}

{- foldM
>>> :t foldl
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
>>> :t foldM
foldM :: (Foldable t, Monad m) => (b -> a -> m b) -> b -> t a -> m b
>>> foldM (\a b -> Just (max a b)) 10 [1, 2, 3]
Just 10
-}


