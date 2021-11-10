{- simulate a list, define data recursively
>>> Empty
Empty
>>> 5 `Cons` Empty
Cons 5 Empty
>>> 3 `Cons` (4 `Cons` (5 `Cons` Empty))
Cons 3 (Cons 4 (Cons 5 Empty))
-}
data MyList a = Empty | Cons a (MyList a) deriving(Eq, Ord, Show, Read)

{- use self define operator
>>> let a = 1 :-: 2 :-: 3 :-: Empty'
>>> a
1 :-: (2 :-: (3 :-: Empty'))
>>> :t (1 :-: Empty')
(1 :-: Empty') :: Num a => MyList' a
>>> let b = 10 :-: 100 :-: Empty'
>>> a .++ b
1 :-: (2 :-: (3 :-: (10 :-: (100 :-: Empty'))))
-}
infixr 5 :-:
data MyList' a = Empty' | a :-: (MyList' a) deriving(Eq, Ord, Show, Read)
infixr 5 .++
(.++) :: MyList' a -> MyList' a -> MyList' a
Empty' .++ xs = xs
(x :-: xs) .++ ys = x :-: (xs .++ ys)

{- example: binary search tree
>>> treeInsert 3 EmptyTree
Node 3 EmptyTree EmptyTree
>>> let t = listToTree [0, 3, 5, 6, 7, 1, 2, 4, 4, 4]
>>> t
Node 4 (Node 2 (Node 1 (Node 0 EmptyTree EmptyTree) EmptyTree) (Node 3 EmptyTree EmptyTree)) (Node 7 (Node 6 (Node 5 EmptyTree EmptyTree) EmptyTree) EmptyTree)
>>> treeElem 5 t
>>> treeElem 10 t
True
False
-}

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving(Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree
treeInsert :: Ord a => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right -- de-duplicate, another option is to insert to right 
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)
    | otherwise = singleton x -- can be removed

listToTree :: (Ord a) => [a] -> Tree a
listToTree = foldr treeInsert EmptyTree

treeElem :: Ord a => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right
    | otherwise = False -- can be removed