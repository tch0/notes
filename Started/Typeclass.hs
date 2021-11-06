import GHC.Enum (Bounded)
{- show read
>>> :t show
show :: Show a => a -> String
>>> show True
"True"
>>> show [1, 2]
"[1,2]"
>>> show "hello"
"\"hello\""

>>> :t read
read :: Read a => String -> a
>>> read "1.2" + 3.2
4.4
>>> read "[1, 2, 3]" :: [Int]
[1,2,3]
>>> read "1"
Prelude.read: no parse
>>> read "1.0" :: Double
1.0
>>> read "(1.0, \"hello\", 10)" :: (Double, [Char], Int)
(1.0,"hello",10)

-}

{- Enum
>>> succ LT
EQ
>>> [LT .. GT ]
[LT,EQ,GT]
>>> [1 .. 10]
[1,2,3,4,5,6,7,8,9,10]
>>> [True ..]
[True]
>>> [False ..]
[False,True]
>>> succ 1.3
2.3
-}

{- Bounded
>>> :t minBound
minBound :: Bounded a => a
>>> minBound :: Int
-9223372036854775808
>>> maxBound :: Int
9223372036854775807
>>> minBound :: Ordering
LT
>>> minBound :: Char
'\NUL'
>>> maxBound :: Char
'\1114111'
-}

{- Num Integral Floating
>>> :t (*)
(*) :: Num a => a -> a -> a
>>> :t (+)
(+) :: Num a => a -> a -> a
>>> (5 :: Int) * 6.0
No instance for (Fractional Int) arising from the literal ‘6.0’
>>> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
>>> length [1, 2, 3] * 5.0
No instance for (Fractional Int) arising from the literal ‘5.0’
>>> fromIntegral (length [1, 2, 3]) * 5.0
15.0
-}
