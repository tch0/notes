
l1 :: [Char]
l1 = "hello"
l2 :: [Char]
l2 = ['h','e','l','l','o'] -- equals to "hello"

-- concat two list
l3 :: [Char]
l3 = l1 ++ l2

-- add element to list
l4 :: [Integer]
l4 = 1 : [10] -- [1, 10]

-- list [1,2,3] is just candy of 1:2:3:[], hlint will recommand use [1, 2, 3]
l5 :: [Integer]
l5 = 1:2:3:[]

-- list of list
l6 :: [[Integer]]
l6 = [1]:[[2]] -- [[1], [2]]

main :: IO ()
main = print l1

b1 :: Bool
b1 = [1, 2] > [1, 0, 3] -- True

{- head tail last init
>>>h
1
>>>t
[2,3,4]
>>>lastElem
4
>>>initList
[1,2,3]
-}

list :: [Integer]
list = [1, 2, 3, 4]
h :: Integer
h = head list
t :: [Integer]
t = tail list
lastElem :: Integer
lastElem = last list
initList :: [Integer]
initList = init list

{- reverse length null
>>>reverse [1, 2, 3]
[3,2,1]
>>>length [1, 2, 3]
3
>>>null [1]
False
>>>null []
True

-}

{- take drop
>>>take 3 [1, 2, 3, 4]
[1,2,3]
>>> take 10 [1, 3]
[1,3]
>>> drop 3 [1, 2, 3, 4]
[4]
>>> drop 10 [1, 3]
[]

-}

{- maximum minimum
>>> maximum [1, 2, 10]
10

>>> minimum [1, 10]
1

-}


{- sum product
>>> sum [1, 2, 3]
6
>>> product [1, 2, 10]
20
-}

{- elem
>>> elem 10 [1, 2, 10]
True
>>> 10 `elem` [1, 2, 10]
True
-}
