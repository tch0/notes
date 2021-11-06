main = print "hello,world"

{- triple a list

>>> triple ""
""

>>> triple "a"
"aa"
-}
triple :: [a] -> [a]
triple l = l ++ l


doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + y + y

doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleSmallNumber' :: (Num a, Ord a) => a -> a
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

hello :: [Char]
hello = "hello,world!"
