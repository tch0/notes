{- Eq Show Read
>>> kim = Person {name = "Kim", age = 18}
>>> mygirl = Person "Kim" 18
>>> kim == mygirl
True
>>> show kim
"Person {name = \"Kim\", age = 18}"
>>> mygirl
Person {name = "Kim", age = 18}
>>> read "Person {name = \"Kim\", age = 18}" :: Person
Person {name = "Kim", age = 18}
>>> kim > read "Person {name = \"catholly\", age = 15}"
False
-}
data Person = Person {
    name :: String,
    age :: Int
} deriving(Eq, Ord, Read, Show)

{- Ord typeclass
>>> Nothing < Just (-100)
True
>>> Just 2 < Just 3
True
>>> Just 100 `compare` Just 50
GT
-}

{- Enum
>>> Monday < Sunday
True
>>> [minBound .. maxBound] :: [Day]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
>>> map succ [Monday .. Saturday]
[Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
>>> map pred [Tuesday .. Sunday]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday]
>>> succ Sunday
succ{Day}: tried to take `succ' of last tag in enumeration
>>> pred Monday
pred{Day}: tried to take `pred' of first tag in enumeration
>>> [Tuesday .. Sunday] == map succ [Monday .. Saturday]
True
-}
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving(Eq, Ord, Show, Read, Enum, Bounded)

{- type synonyms
-}
type AssocList k v = [(k, v)]

{- Either
>>> :t Left 20
Left 20 :: Num a => Either a b
>>> :t Right "hello"
Right "hello" :: Either a [Char]
>>> Left 20 < Right "hello"
True
-}
