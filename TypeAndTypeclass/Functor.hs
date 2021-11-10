{- Functor of list, fmap is map
>>> :t map
map :: (a -> b) -> [a] -> [b]
>>> :t fmap
fmap :: Functor f => (a -> b) -> f a -> f b
>>> fmap (+3) [1, 2, 3]
>>> map (+3) [1, 2, 3]
[4,5,6]
[4,5,6]
-}

{- Functor of Maybe
>>> fmap (++ "world") $ Just "hello"
Just "helloworld"
>>> fmap (++ "world") Nothing
Nothing
>>> :t (<*>)
(<*>) :: Applicative f => f (a -> b) -> f a -> f b
-}

import Data.Map
{- Functor of Map k : fmap :: (a -> b) -> Map k a -> Map k b
>>> 1+1
2
>>> fmap (+3) (fromList [(1, 2)]) 
fromList [(1,5)]
-}

