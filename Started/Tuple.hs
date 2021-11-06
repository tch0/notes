{- use Tuple
>>> (1, 2)
(1,2)
>>> (1, "hello")
(1,"hello")
>>> (1, "hello") == (1, 2)
No instance for (Num [Char]) arising from the literal ‘2’
>>> (1, 2, 3)
(1,2,3)
-}

{- fst snd, only used on pair
>>> fst (1, "hello")
1
>>> snd (1, "hello")
"hello"
>>> (1)
1
-}

{- zip
>>> zip [1..5] ['a'..'z']
[(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]
-}

{-
>>> [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
[(3,4,5),(6,8,10)]
-}
