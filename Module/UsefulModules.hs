import Data.List
import Data.Function
import Data.Char
import qualified Data.Map as M
import qualified Data.Set as Set

{- Data.List : operations about List
>>> :t intersperse
intersperse :: a -> [a] -> [a]
>>> intersperse 2 [1..10]
[1,2,2,2,3,2,4,2,5,2,6,2,7,2,8,2,9,2,10]
>>> :t intercalate
intercalate :: [a] -> [[a]] -> [a]
>>> intercalate " " ["hello", "world", "you"]
"hello world you"
>>> :t transpose
transpose :: [[a]] -> [[a]]
>>> transpose [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
[[1,4,7],[2,5,8],[3,6,9]]
>>> :t foldl'
foldl' :: Foldable t => (b -> a -> b) -> b -> t a -> b
>>> :t foldl1'
foldl1' :: (a -> a -> a) -> [a] -> a
>>> :t concat
concat :: Foldable t => t [a] -> [a]
>>> concat ["hello", "world", "yes"]
"helloworldyes"
>>> :t concatMap
concatMap :: Foldable t => (a -> [b]) -> t a -> [b]
>>> concatMap (replicate 4) [1..3]
[1,1,1,1,2,2,2,2,3,3,3,3]
>>> concat . (map (replicate 4)) $ [1..3]
[1,1,1,1,2,2,2,2,3,3,3,3]
>>> :t and
and :: Foldable t => t Bool -> Bool
>>> :t or
or :: Foldable t => t Bool -> Bool
>>> and [True, False, False]
False
>>> or [False, False, True]
True
>>> :t any
any :: Foldable t => (a -> Bool) -> t a -> Bool
>>> :t all
all :: Foldable t => (a -> Bool) -> t a -> Bool
>>> all (>3) [1..4]
False
>>> any (>3) [1..4]
True
>>> :t iterate
iterate :: (a -> a) -> a -> [a]
>>> take 20 $ iterate (*2) 1
[1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288]
>>> :t splitAt
splitAt :: Int -> [a] -> ([a], [a])
>>> :t takeWhile
takeWhile :: (a -> Bool) -> [a] -> [a]
>>> takeWhile (<1000) $ iterate (*2) 1
[1,2,4,8,16,32,64,128,256,512]
>>> :t dropWhile
dropWhile :: (a -> Bool) -> [a] -> [a]
>>> dropWhile (<10) [1..20]
[10,11,12,13,14,15,16,17,18,19,20]
>>> :t span
span :: (a -> Bool) -> [a] -> ([a], [a])
>>> span (<10) [1..20]
([1,2,3,4,5,6,7,8,9],[10,11,12,13,14,15,16,17,18,19,20])
>>> :t break
break :: (a -> Bool) -> [a] -> ([a], [a])
>>> break (>=10) [1..20]
([1,2,3,4,5,6,7,8,9],[10,11,12,13,14,15,16,17,18,19,20])
>>> :t sort
sort :: Ord a => [a] -> [a]
>>> sort [20,19..1]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
>>> sort ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
["brown","dog","fox","jumps","lazy","over","quick","the","the"]
>>> :t group
group :: Eq a => [a] -> [[a]]
>>> group [1, 1, 2, 3, 3, 2, 2, 1, 2]
[[1,1],[2],[3,3],[2,2],[1],[2]]
>>> :t inits
>>> :t tails
inits :: [a] -> [[a]]
tails :: [a] -> [[a]]
>>> inits "hello"
["","h","he","hel","hell","hello"]
>>> tails "hello"
["hello","ello","llo","lo","o",""]
>>> let s = "hello" in zip (inits s) (tails s)
[("","hello"),("h","ello"),("he","llo"),("hel","lo"),("hell","o"),("hello","")]
>>> :t isPrefixOf
>>> :t isSuffixOf
isPrefixOf :: Eq a => [a] -> [a] -> Bool
isSuffixOf :: Eq a => [a] -> [a] -> Bool
>>> isPrefixOf "he" "hello"
True
>>> "lo" `isSuffixOf` "hello"
True
>>> :t elem
>>> :t notElem
elem :: (Foldable t, Eq a) => a -> t a -> Bool
notElem :: (Foldable t, Eq a) => a -> t a -> Bool
>>> :t partition
partition :: (a -> Bool) -> [a] -> ([a], [a])
>>> partition (`elem` ['a'..'z']) $ ['a'..'z'] ++ ['A'..'Z']
("abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
>>> :t find
find :: Foldable t => (a -> Bool) -> t a -> Maybe a
>>> find (>4) [1..10]
Just 5
>>> :t elemIndex
elemIndex :: Eq a => a -> [a] -> Maybe Int
>>> elemIndex 10 [1..5]
Nothing
>>> elemIndex 10 [1..20]
Just 9
>>> :t elemIndices
elemIndices :: Eq a => a -> [a] -> [Int]
>>> elemIndices ' ' "the quick brown fox jumps over the lazy dog's back."
[3,9,15,19,25,30,34,39,45]
>>> :t findIndex
>>> :t findIndices
findIndex :: (a -> Bool) -> [a] -> Maybe Int
findIndices :: (a -> Bool) -> [a] -> [Int]
>>> findIndex (>4) [1..10]
Just 4
>>> findIndices (>4) [1..10]
[4,5,6,7,8,9]

>>> :t zip3
zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
>>> :t zipWith3
zipWith3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
>>> zipWith3 (\x y z -> x * y * z) [1, 2] [2, 3] [3, 4]
[6,24]
>>> :t zipWith7
zipWith7
  :: (a -> b -> c -> d -> e -> f -> g -> h)
     -> [a] -> [b] -> [c] -> [d] -> [e] -> [f] -> [g] -> [h]

>>> :t lines
lines :: String -> [String]
>>> lines "hello\r\nworld\n\ryes"
["hello\r","world","\ryes"]
>>> :t unlines
unlines :: [String] -> String
>>> unlines ["hello", "world", "yes"]
"hello\nworld\nyes\n"

>>> :t nub
nub :: Eq a => [a] -> [a]
>>> nub $ concatMap (replicate 4) $ [1..5]
[1,2,3,4,5]
>>> :t delete
delete :: Eq a => a -> [a] -> [a]
>>> delete 'l' "hello"
"helo"

>>> :t (\\)
(\\) :: Eq a => [a] -> [a] -> [a]
>>> [1..10] \\ [3..5]
[1,2,6,7,8,9,10]
>>> :t union
union :: Eq a => [a] -> [a] -> [a]
>>> :t intersect
intersect :: Eq a => [a] -> [a] -> [a]
>>> intersect [1..10] [2..4]
[2,3,4]
>>> :t insert
insert :: Ord a => a -> [a] -> [a]

-- more generic functions for length take drop splitAt !! replicate
>>> :t length
>>> :t take
>>> :t drop
>>> :t splitAt
>>> :t (!!)
>>> :t replicate
length :: Foldable t => t a -> Int
take :: Int -> [a] -> [a]
drop :: Int -> [a] -> [a]
splitAt :: Int -> [a] -> ([a], [a])
(!!) :: [a] -> Int -> a
replicate :: Int -> a -> [a]
>>> :t genericLength
>>> :t genericTake
>>> :t genericDrop
>>> :t genericSplitAt
>>> :t genericIndex
>>> :t genericReplicate
genericLength :: Num i => [a] -> i
genericTake :: Integral i => i -> [a] -> [a]
genericDrop :: Integral i => i -> [a] -> [a]
genericSplitAt :: Integral i => i -> [a] -> ([a], [a])
genericIndex :: Integral i => [a] -> i -> a
genericReplicate :: Integral i => i -> a -> [a]

-- more generic functions for sort insert minimum maximum
>>> :t sort
>>> :t insert
>>> :t minimum
>>> :t maximum
sort :: Ord a => [a] -> [a]
insert :: Ord a => a -> [a] -> [a]
minimum :: (Foldable t, Ord a) => t a -> a
maximum :: (Foldable t, Ord a) => t a -> a
>>> :t sortBy
>>> :t insertBy
>>> :t minimumBy
>>> :t maximumBy
sortBy :: (a -> a -> Ordering) -> [a] -> [a]
insertBy :: (a -> a -> Ordering) -> a -> [a] -> [a]
minimumBy :: Foldable t => (a -> a -> Ordering) -> t a -> a
maximumBy :: Foldable t => (a -> a -> Ordering) -> t a -> a

-- generic version of nub delete union intersect group

>>> :t nub
>>> :t delete
>>> :t union
>>> :t intersect
>>> :t group
nub :: Eq a => [a] -> [a]
delete :: Eq a => a -> [a] -> [a]
union :: Eq a => [a] -> [a] -> [a]
intersect :: Eq a => [a] -> [a] -> [a]
group :: Eq a => [a] -> [[a]]
>>> :t nubBy
>>> :t deleteBy
>>> :t unionBy
>>> :t intersectBy
>>> :t groupBy
nubBy :: (a -> a -> Bool) -> [a] -> [a]
deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
unionBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
intersectBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]
groupBy :: (a -> a -> Bool) -> [a] -> [[a]]

>>> :t on
on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
>>> groupBy ((==) `on` (>0)) [-1, -2, 0, 1, 22, 10, -100]
[[-1,-2,0],[1,22,10],[-100]]
>>> sortBy (compare `on` length) $ reverse [[1..x] | x <- [0..5]]
[[],[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]
-}


{- Data.Char functions
>>> :t isAsciiUpper
isAsciiUpper :: Char -> Bool
>>> isAlpha 'a'
True
>>> isControl '\t'
True
>>> map isSpace $ ['\t', '\r', '\n', ' '] ++ ['a'..'c']
[True,True,True,True,False,False,False]
>>> map isPrint $ ['\t', '\r', '\n', ' '] ++ ['a'..'c']
[False,False,False,True,True,True,True]

-- GeneralCategory, generalCategory : category of a character
>>> :t generalCategory
generalCategory :: Char -> GeneralCategory
>>> map generalCategory "\r\nab\t A?[%#@!"
[Control,Control,LowercaseLetter,LowercaseLetter,Control,Space,UppercaseLetter,OtherPunctuation,OpenPunctuation,OtherPunctuation,OtherPunctuation,OtherPunctuation,OtherPunctuation]
>>> minBound :: GeneralCategory
UppercaseLetter
>>> :t generalCategory
generalCategory :: Char -> GeneralCategory
>>> [(minBound :: GeneralCategory) .. (maxBound :: GeneralCategory)]
[UppercaseLetter,LowercaseLetter,TitlecaseLetter,ModifierLetter,OtherLetter,NonSpacingMark,SpacingCombiningMark,EnclosingMark,DecimalNumber,LetterNumber,OtherNumber,ConnectorPunctuation,DashPunctuation,OpenPunctuation,ClosePunctuation,InitialQuote,FinalQuote,OtherPunctuation,MathSymbol,CurrencySymbol,ModifierSymbol,OtherSymbol,Space,LineSeparator,ParagraphSeparator,Control,Format,Surrogate,PrivateUse,NotAssigned]

>>> map digitToInt $ ['a'..'f'] ++ ['0'..'9'] ++ ['A'..'F']
[10,11,12,13,14,15,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
>>> :t ord
>>> :t chr
ord :: Char -> Int
chr :: Int -> Char
>>> ord '我'
25105
>>> chr $ ord '我'
'\25105'
>>> "你好哇"
"\20320\22909\21703"
>>> encode 10 ['A'..'Z']
"KLMNOPQRSTUVWXYZ[\\]^_`abcd"
>>> decode 10 "KLMNOPQRSTUVWXYZ[\\]^_`abcd"
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
-}

-- an original encryption, shift code point
encode :: Int -> String -> String
encode shift = map (chr . (+shift) . ord)

decode :: Int -> String -> String
decode shift = encode (-shift)

{- Data.Map
>>> :t Data.Map.fromList
Data.Map.fromList :: Ord k => [(k, a)] -> Map k a
>>> M.fromList [(1,'a'), (1, 'z'), (2, 'B')]
fromList [(1,'z'),(2,'B')]
>>> :t Data.Map.empty
Data.Map.empty :: Map k a
>>> M.empty
fromList []
>>> :t Data.Map.insert
Data.Map.insert :: Ord k => k -> a -> Map k a -> Map k a
>>> M.insert 10 20 . M.insert 20 30 $ fromList' [(1, 2)]
fromList [(1,2),(10,20),(20,30)]
>>> fromList'' [(1, 2), (2, 3), (10, 100)]
fromList [(1,2),(2,3),(10,100)]

>>> :t Data.Map.null
Data.Map.null :: Map k a -> Bool
>>> M.null $ M.empty
True
>>> :t Data.Map.size
Data.Map.size :: Map k a -> Int
>>> M.size $ M.fromList [(1, 2), (2, 3)]
2
>>> :t Data.Map.singleton
Data.Map.singleton :: k -> a -> Map k a
>>> :t Data.Map.lookup
Data.Map.lookup :: Ord k => k -> Map k a -> Maybe a
>>> :t Data.Map.member
Data.Map.member :: Ord k => k -> Map k a -> Bool
>>> :t Data.Map.map
>>> :t Data.Map.filter
Data.Map.map :: (a -> b) -> Map k a -> Map k b
Data.Map.filter :: (a -> Bool) -> Map k a -> Map k a

>>> :t Data.Map.toList
Data.Map.toList :: Map k a -> [(k, a)]
>>> M.toList $ M.fromList [(1, 2), (1, 3)]
[(1,3)]

>>> :t Data.Map.keys
>>> :t Data.Map.elems
Data.Map.keys :: Map k a -> [k]
Data.Map.elems :: Map k a -> [a]
>>> M.keys $ M.fromList [(1, 2), (3, 4)]
>>> map fst . M.toList $ M.fromList [(1, 2), (3, 4)]
>>> M.elems $ M.fromList [(1, 2), (3, 4)]
>>> map snd . M.toList $ M.fromList [(1, 2), (3, 4)]
[1,3]
[1,3]
[2,4]
[2,4]

>>> :t Data.Map.fromListWith
Data.Map.fromListWith :: Ord k => (a -> a -> a) -> [(k, a)] -> Map k a
>>> M.fromListWith (\v1 v2 -> v1 ++ ", " ++ v2) [(1, "hello"), (1, "world")]
fromList [(1,"world, hello")]
>>> M.fromListWith (+) [(1, 2), (1, 3)]
fromList [(1,5)]
>>> :t Data.Map.insertWith
Data.Map.insertWith :: Ord k => (a -> a -> a) -> k -> a -> Map k a -> Map k a
-}

-- own fromList
fromList' :: Ord k => [(k, a)] -> M.Map k a
fromList' = foldr (\(k, v) acc -> M.insert k v acc) M.empty

fromList'' :: Ord k => [(k, a)] -> M.Map k a
fromList'' = foldl (\acc (k, v) -> M.insert k v acc) M.empty

{- Data.Set
>>> :t Data.Set.fromList
>>> :t Data.Set.difference
>>> :t Data.Set.null
>>> :t Data.Set.size
>>> :t Data.Set.member
>>> :t Data.Set.empty
>>> :t Data.Set.singleton
>>> :t Data.Set.insert
>>> :t Data.Set.delete
>>> :t Data.Set.map
>>> :t Data.Set.filter
Data.Set.fromList :: Ord a => [a] -> Set a
Data.Set.difference :: Ord a => Set a -> Set a -> Set a
Data.Set.null :: Set a -> Bool
Data.Set.size :: Set a -> Int
Data.Set.member :: Ord a => a -> Set a -> Bool
Data.Set.empty :: Set a
Data.Set.singleton :: a -> Set a
Data.Set.insert :: Ord a => a -> Set a -> Set a
Data.Set.delete :: Ord a => a -> Set a -> Set a
Data.Set.map :: Ord b => (a -> b) -> Set a -> Set b
Data.Set.filter :: (a -> Bool) -> Set a -> Set a

>>> Set.fromList [1, 2]
fromList [1,2]
>>> Set.difference (Set.fromList [1, 2, 3]) $ Set.fromList [2, 100]
fromList [1,3]
>>> Set.map (+10) $ Set.fromList [1, 2]
fromList [11,12]
>>> Set.filter (>0) $ Set.fromList [1, 2, -1]
fromList [1,2]

>>> setNub [1, 1, 2, 3, 1]
[1,2,3]
-}

-- use set to de-duplicate
setNub :: Ord a => [a] -> [a]
setNub = Set.toList . Set.fromList