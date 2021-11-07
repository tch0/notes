{- fibonacci sequence
>>> fib 10
55
>>> fib 10
55
-}
fib :: (Integral a) => a -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

{- tail recursion of fibonacci
>>> fib' 10
55
>>> fib' 100
354224848179261915075
>>> fib' 300
222232244629420445529739893461909967206666939096499764990979600
>>> fib' (50 :: Integer)
12586269025
>>> fib' (100 :: Int)
354224848179261915075
-}

fibonacci :: Integral a => a -> Integer -> Integer -> Integer
fibonacci 0 a b = b
fibonacci n a b = fibonacci (n - 1) (a + b) a
fib' :: Integral a => a -> Integer
fib' n = fibonacci n 1 0

{- maximum
>>> maximum []
Prelude.maximum: empty list
>>> maximum' []
maximum a empty list
>>> maximum' [1]
1
>>> maximum' [1, 2, 3, 100]
100
-}

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum a empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

{- replicate
>>> replicate 5 10
[10,10,10,10,10]
>>> replicate' 5 10
[10,10,10,10,10]
-}
replicate' :: (Ord t, Num t) => t -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x:replicate' (n-1) x

{- take
>>> take' 0 [1, 2, 3]
[]
>>> take' (-1) [1, 2, 3]
[]
>>> take' 5 [1..10]
[1,2,3,4,5]
-}

take' :: (Ord a1, Num a1) => a1 -> [a2] -> [a2]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

{- elem
>>> 1 `elem'` [2, 1, 100]
True
-}

elem' :: Eq t => t -> [t] -> Bool
elem' a [] = False 
elem' a (x:xs)
    | x == a = True 
    | otherwise = a `elem'` xs


{- quick sort
>>> quicksort [3, 1, 2, 4, 5, 7, 9, 100, -10]
[-10,1,2,3,4,5,7,9,100]
>>> quicksort "the quick brown fox jumps over the lazy dog's back"
"         'aabbccdeeefghhijkklmnoooopqrrssttuuvwxyz"
-}

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ (x : biggerSorted)
