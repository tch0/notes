-- Tree data structure
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

freeTree :: Tree Char  
freeTree =   
    Node 'P'  
        (Node 'O'  
             (Node 'L'  
              (Node 'N' Empty Empty)  
              (Node 'T' Empty Empty)  
             )  
             (Node 'Y'  
              (Node 'S' Empty Empty)  
              (Node 'A' Empty Empty)  
             )  
        )  
        (Node 'L'  
             (Node 'W'  
                  (Node 'C' Empty Empty)  
                  (Node 'R' Empty Empty)  
             )  
             (Node 'A'  
                  (Node 'A' Empty Empty)  
                  (Node 'C' Empty Empty)  
             )
        )

data Direction = L | R deriving (Eq, Show)
type Directions = [Direction]

changeToP :: Directions -> Tree Char -> Tree Char
changeToP (L:ds) (Node x l r) = Node x (changeToP ds l) r
changeToP (R:ds) (Node x l r) = Node x l (changeToP ds r)
changeToP [] (Node _ l r) = Node 'P' l r
changeToP _ Empty = Empty

{-
>>> changeToP [R, L] freeTree
Node 'P' (Node 'O' (Node 'L' (Node 'N' Empty Empty) (Node 'T' Empty Empty)) (Node 'Y' (Node 'S' Empty Empty) (Node 'A' Empty Empty))) (Node 'L' (Node 'P' (Node 'C' Empty Empty) (Node 'R' Empty Empty)) (Node 'A' (Node 'A' Empty Empty) (Node 'C' Empty Empty)))
-}


-- save a path of walking through a tree, LeftPath/RightPath rootValue subTreeOfTheOtherSide
data TreePath a = LeftPath a (Tree a) | RightPath a (Tree a) deriving(Show)
type TreePaths a = [TreePath a]

goLeft :: (Tree a, TreePaths a) -> (Tree a, TreePaths a)
goLeft (Node x l r, tps) = (l, LeftPath x r:tps)
goLeft (Empty, tps) = error "go to left of empty tree"

goRight :: (Tree a, TreePaths a) -> (Tree a, TreePaths a)
goRight (Node x l r, tps) = (r, RightPath x l:tps)
goRight (Empty, tps) = error "go to right of empty tree"

goUp :: (Tree a, TreePaths a) -> (Tree a, TreePaths a)
goUp (t, LeftPath x r:tps) = (Node x t r, tps)
goUp (t, RightPath x l:tps) = (Node x l t, tps)
goUp (t, []) = error "go to up of root node"

infixl 5 -:
(-:) :: t1 -> (t1 -> t2) -> t2
x -: f = f x

{- 
>>> fst $ goLeft (goRight (freeTree, []))
Node 'W' (Node 'C' Empty Empty) (Node 'R' Empty Empty)
>>> fst $ (freeTree, []) -: goLeft -: goRight -: goLeft
Node 'S' Empty Empty
-}


-- type synonym
type TreeZipper a = (Tree a, TreePaths a)

-- modify value of a node
modify :: (a -> a) -> TreeZipper a -> TreeZipper a
modify f (Node x l r, tps) = (Node (f x) l r, tps)
modify f (Empty, tps) = (Empty, tps)

-- replace a subtree
attach :: Tree a -> TreeZipper a -> TreeZipper a
attach t (_, tps) = (t, tps)

-- go to root of a tree
goRoot :: TreeZipper a -> TreeZipper a
goRoot (t, []) = (t, [])
goRoot (t, tps) = goRoot $ goUp (t, tps)

{-
>>> let (newTree, zipper) = (freeTree, []) -: goRight -: goLeft -: modify (\_ -> 'P')
>>> newTree
Node 'P' (Node 'C' Empty Empty) (Node 'R' Empty Empty)
>>> fst $ (newTree, zipper) -: goUp -: attach (Node '&' Empty Empty) -: goRoot
Node 'P' (Node 'O' (Node 'L' (Node 'N' Empty Empty) (Node 'T' Empty Empty)) (Node 'Y' (Node 'S' Empty Empty) (Node 'A' Empty Empty))) (Node '&' Empty Empty)
-}