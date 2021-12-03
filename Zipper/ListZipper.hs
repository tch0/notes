-- zipper of list, (rightSideOfList, reversedLeftSideOfList)
type ListZipper a = ([a], [a])

-- index from low to high
goForward :: ListZipper a -> ListZipper a
goForward (x:xs, ys) = (xs, x:ys)
goForward ([], ys) = error "go forward of empty list"

-- index from high to low
goBack :: ListZipper a -> ListZipper a
goBack (xs, x:ys) = (x:xs, ys)
goBack (xs, []) = error "go back of full list"
{-
>>> goForward . goForward . goForward $ ([1, 2, 3, 4], [])
([4],[3,2,1])
>>> goBack ([4],[3,2,1])
([3,4],[2,1])
-}
