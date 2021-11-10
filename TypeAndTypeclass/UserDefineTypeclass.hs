{- define our own typeclasses
>>> Red == Red
True
>>> Red /= Green
True
-}

data TrafficLight = Red | Yellow | Green
instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

{-
>>> show Red
"Red light"
-}
instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"

{- YesNo typeclass
>>> yesnoIf [] "Yes" "No"
"No"
>>> yesnoIf [2, 3, 4] "Not Empty" "Empty"
"Not Empty"
>>> yesnoIf True True False
True
>>> yesno Nothing
False
>>> :t Nothing
Nothing :: Maybe a
>>> yesno (Just 1)
True
-}

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True
instance YesNo Bool where
    yesno a = a
instance YesNo [a] where
    yesno [] = False
    yesno _ = True
instance YesNo (Maybe m) where
    yesno Nothing = False
    yesno _ = True

yesnoIf :: YesNo a => a -> p -> p -> p
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

{- Empty or not type class
>>> empty (Just [])
True
>>> empty (Just [1, 2, 3])
False
>>> empty (Just (Just (Just [1, 2, 3])))
False
>>> empty []
True
-}

class YesNo a => EmptyOrNot a where
    empty :: a -> Bool
    empty = not . yesno

instance EmptyOrNot [a] -- use implementation of YesNo, equals to (not . yesno)
instance (EmptyOrNot m) => EmptyOrNot (Maybe m) where
    empty Nothing = False
    empty (Just m) = empty m