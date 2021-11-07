{- judge a list is increasing or not
>>> increasing []
True
>>> increasing [1, 0]
False
>>> increasing [1,2,3,4,5]
True
-}
increasing :: (Ord a) => [a] -> Bool
increasing xs = 
    if xs == []
    then True
    else if tail xs == []
         then True
         else if head xs <= head (tail xs)
              then increasing (tail xs)
              else False

{- simplify with guard, sugar of if - then - else expression
>>> increasing'' []
True
>>> increasing'' [1, 0]
False
>>> increasing'' [1,2,3,4,5]
True
-}
increasing' :: (Ord a) => [a] -> Bool
increasing' xs
    | null xs = True
    | null (tail xs) = True
    | head xs <= head (tail xs) = increasing' (tail xs)
    | otherwise = False
{- use pattern matching
>>> increasing'' []
True
>>> increasing'' [1, 0]
False
>>> increasing'' [1,2,3,4,5]
True
-}
increasing'' :: (Ord a) => [a] -> Bool
increasing'' [] = True
increasing'' [x] = True
increasing'' (x:y:ys) = x <= y && increasing''(y:ys)

{- simplify
>>> increasing''' []
True
>>> increasing''' [1, 0]
False
>>> increasing''' [1,2,3,4,5]
True
-}
increasing''' :: Ord a => [a] -> Bool 
increasing''' (x:y:ys) = x <= y && increasing''' (y:ys)
increasing''' _ = True

{- pattern matching of tuple
>>> first (1, 'a', "hello")
1
>>> second (1, 'a', "hello")
'a'
>>> third (1, 'a', "hello")
"hello"
-}

first :: (a, b, c) -> a
first (x, _, _) = x
second :: (a, b, c) -> b
second (_, y, _) = y
third :: (a, b, c) -> c
third (_, _, z) = z

{- where
>>> bmiTell 55 160
"You're underweight, you emo, you!"
>>> bmiTell 100 100
"You're underweight, you emo, you!"
-}

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          (skinny, normal, fat) = (18.5, 25.0, 30.0)


{- let in
>>> [let square x = x * x in (square 1, square 2)]
[(1,4)]
>>> let a = 100; b = 20 in a + b
120
>>> let (a, b) = (100, 20) in a + b
120
-}
calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]


{- case expression, pattern matching is just sugar of case expression
>>> increasing'''' [1, 2, 3]
True
>>> increasing'''' []
True
>>> increasing'''' [1, 0]
False
-}

increasing'''' :: Ord a => [a] -> Bool 
increasing'''' xs = case xs of (x:y:ys) -> x <= y && increasing'''' (y:ys)
                               _ -> True
