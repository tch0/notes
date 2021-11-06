{- use range
>>> [1..20]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
>>> ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"

with step
>>> [1,3..20]
[1,3,5,7,9,11,13,15,17,19]

>>> [1,0..10]
[]

>>> [1, 2, 3..10]
parse error on input ‘..’

do not evaluate infinite list, will bring Haskell language server into a infinite loop.

>>> take 10 [1,2..]
[1,2,3,4,5,6,7,8,9,10]

>>> take 10 [1,1..10]
[1,1,1,1,1,1,1,1,1,1]
-}

{- cycle repeat : generate infinite list
>>> take 10 (cycle [1, 2, 3])
[1,2,3,1,2,3,1,2,3,1]
>>> take 10 (repeat 10)
[10,10,10,10,10,10,10,10,10,10]
-}

{- list comprehension
>>> take 20 [x * x | x <- [1..]]
[1,4,9,16,25,36,49,64,81,100,121,144,169,196,225,256,289,324,361,400]
>>> take 20 [if x < 10 then x * x else x + x | x <- [1..]]
[1,4,9,16,25,36,49,64,81,20,22,24,26,28,30,32,34,36,38,40]
>>> take 15 [(x, y) | x <- [1..], y <- [10..], x + y < 30]
[(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24)]
-}

{-
>>> length' [1, 2, 3]
3
-}
length' :: Num a => [t] -> a
length' xs = sum [1 | _ <- xs]

{-
>>>removeNonUppercase "ILove you"
"IL"
-}
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
