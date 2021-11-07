
{- curried functions
>>> :t max
max :: Ord a => a -> a -> a
>>> :t max 4
max 4 :: (Ord a, Num a) => a -> a
>>> :t max4
max4 :: (Ord a, Num a) => a -> a
>>> max4 5.0
5.0
>>> (max 4) 5
5
-}

max4 :: (Ord a, Num a) => a -> a
max4 = max 4
max4' :: (Ord a, Num a) => a -> a
max4' x = max 4 x

{-
>>> :t mulThree 1 2
mulThree 1 2 :: Num a => a -> a
>>> :t mulThree 1
mulThree 1 :: Num a => a -> a -> a
-}
mulThree :: Num a => a -> a -> a -> a
mulThree x y z = x * y * z

{- infix functions
>>> :t divBy10
divBy10 :: Double -> Double
>>> divBy10 100
10.0
>>> divX 100
0.1
-}

divBy10 :: Double -> Double
divBy10 = (/10)
divX :: Double -> Double
divX = (10/)

{- function as arguments
>>> zipWith (+) [1, 2, 3] [4, 5, 6, 7]
[5,7,9]
>>> zipWith' (+) [1, 2, 3] [4, 5, 6, 7]
[5,7,9]
-}
zipWith' :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

{- function as return value
>>> :t f
f :: Num a => a -> a -> a -> a
>>> :t f
f :: Num a => a -> a -> a -> a
>>> f 1 2 3
6
-}

f :: Num a => a -> a -> a -> a
f x = let tmp1 y = (let tmp2 z = x * y * z in tmp2) in tmp1

{- commonly used high order functions: map, filter, takeWhile, zipWith
>>> :t map
map :: (a -> b) -> [a] -> [b]
>>> map (+10) [1, 2]
[11,12]
>>> :t filter
filter :: (a -> Bool) -> [a] -> [a]
>>> filter (>3) [1, 2, 3, 4, 5]
[4,5]
>>> :t takeWhile
takeWhile :: (a -> Bool) -> [a] -> [a]
>>> takeWhile (/=' ') "the quick brown fox jumps over the lazy dog's back."
"the"
>>> :t zipWith
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
>>> zipWith (*) [1, 2] [10, 100, 200]
[10,200]
>>> :t flip
flip :: (a -> b -> c) -> b -> a -> c
>>> flip zip [1, 2, 3, 4, 5] "hello"
[('h',1),('e',2),('l',3),('l',4),('o',5)]
-}

{- lambda
>>> zipWith (\x y -> x + y) [1, 2] [10, 100, 1]
[11,102]
>>> map (\x -> x ** x) [1, 2, 3, 4]
[1.0,4.0,27.0,256.0]
>>> f 1 2 3
6
>>> flip' zip [1, 2] "hello"
[('h',1),('e',2)]
>>> flip'' zip [1, 2] "hello"
[('h',1),('e',2)]
-}
f'' :: Num a => a -> a -> a -> a
f'' = \x -> \y -> \z -> x * y * z

flip' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip' f = \x y -> f y x

flip'' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip'' f x y = f y x

{- foldl, foldr, foldl1, foldr1
>>> :t foldl
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
>>> :t foldr
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
>>> foldl (-) 0 [1, 2, 3] -- 0 - 1 - 2 - 3
-6
>>> 0 - 1 - 2 - 3
-6
>>> foldr (-) 0 [1, 2, 3]
2
>>> 1 - (2 - (3 - 0))
2
>>> foldl1 (+) [1, 2, 3]
6
-}

{- scanl, scanr, scanl1, scanr1
>>> :t scanl
scanl :: (b -> a -> b) -> b -> [a] -> [b]
>>> :t scanr
scanr :: (a -> b -> b) -> b -> [a] -> [b]
>>> scanl (-) 0 [1, 2, 3, 4]
[0,-1,-3,-6,-10]
>>> scanr (-) 0 [1, 2, 3, 4]
[-2,3,-1,4,0]
>>> :t scanl1
scanl1 :: (a -> a -> a) -> [a] -> [a]
>>> scanl1 (-) [1, 2, 3, 4]
[1,-1,-4,-8]
>>> scanr1 (-) [1, 2, 3, 4]
[-2,3,-1,4]
-}

{- ($) operator
>>> :t ($)
($) :: (a -> b) -> a -> b
>>> fn $ 1 + 2
9
>>> :t ($ 1)
($ 1) :: Num a => (a -> b) -> b
-}

fn :: Num a => a -> a
fn x = x * x

{- function composition
>>> map (f' . g') [1..20] 
[8,24,48,80,120,168,224,288,360,440,528,624,728,840,960,1088,1224,1368,1520,1680]
>>> map h [1..20] 
[8,24,48,80,120,168,224,288,360,440,528,624,728,840,960,1088,1224,1368,1520,1680]
>>> map (\x -> f' (g' x)) [1..20]
[8,24,48,80,120,168,224,288,360,440,528,624,728,840,960,1088,1224,1368,1520,1680]
-}

-- f(x) = (2*x + 1) ^ 2 - 1
g' :: Num a => a -> a
g' x = 2 * x + 1
f' :: Num a => a -> a
f' x = x ^ 2 - 1

h :: Num a => a -> a
h x = (2 * x + 1) ^ 2 - 1

{- point free style function
>>> map func [100..120.0]
[-1,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,-1]
>>> map func' [100..120.0]
[-1,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,0,1,2,1,0,-1,-1]
-}
func :: (RealFrac a, Integral b, Floating a) => a -> b
func x = ceiling (negate (tan (cos (max 50 x))))
func' :: Double -> Integer
func' = ceiling . negate . tan . cos . max 50

