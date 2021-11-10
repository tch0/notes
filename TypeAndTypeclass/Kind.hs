import Data.Map
{- Kind
>>> :k Int
Int :: *
>>> :k []
[] :: * -> *
>>> :k Maybe
Maybe :: * -> *
>>> :kind Maybe
Maybe :: * -> *
>>> :k Maybe Int
Maybe Int :: *
>>> :k Map
Map :: * -> * -> *
>>> :k Map Int
Map Int :: * -> *
>>> :k Map Int String
Map Int String :: *
>>> :k Num
Num :: * -> Constraint
>>> :k Either
Either :: * -> * -> *
-}

{-
>>> :k Frank
Frank :: * -> (* -> *) -> *
-}
data Frank a b = Frank {frankField :: b a} deriving (Show)
