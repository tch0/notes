import Data.Monoid
import Control.Monad.Writer
import Control.Monad.Identity

-- simulate Writer
-- implement a Writer-like >>= function
applyLog :: Monoid m => (a, m) -> (a -> (b, m)) -> (b, m)
applyLog (x, log) f = let (y, newLog) = f x in (y, log `mappend` newLog)

type Food = String
type Price = Sum Int
addDrink :: Food -> (Food,Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)
{-
>>> ("jerky", Sum 25) `applyLog` addDrink
("whiskey",Sum {getSum = 124})
>>> ("beef", Sum 5) `applyLog` addDrink
("beer",Sum {getSum = 35})
-}

{- actual Writer
>>> :i Writer
type Writer :: * -> * -> *
type Writer w = WriterT w Identity :: * -> *
  	-- Defined in ‘Control.Monad.Trans.Writer.Lazy’

>>> :i WriterT
type role WriterT nominal representational nominal
type WriterT :: * -> (* -> *) -> * -> *
newtype WriterT w m a = WriterT {runWriterT :: m (a, w)}
  	-- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Monoid w, Applicative m) =>
                Applicative (WriterT w m)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Eq w, Eq1 m, Eq a) => Eq (WriterT w m a)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] Functor m => Functor (WriterT w m)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Monoid w, Monad m) => Monad (WriterT w m)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Monoid w, MonadFail m) => MonadFail (WriterT w m)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Monoid w, MonadPlus m) => MonadPlus (WriterT w m)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Ord w, Ord1 m, Ord a) => Ord (WriterT w m a)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Read w, Read1 m, Read a) => Read (WriterT w m a)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Show w, Show1 m, Show a) => Show (WriterT w m a)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] Foldable f => Foldable (WriterT w f)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Monoid w, MonadFix m) => MonadFix (WriterT w m)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Monoid w, MonadIO m) => MonadIO (WriterT w m)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] Monoid w => MonadTrans (WriterT w)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] Traversable f => Traversable (WriterT w f)
  -- Defined in ‘Control.Monad.Trans.Writer.Lazy’
instance [safe] (Monoid w, Monad m) => MonadWriter w (WriterT w m)
  -- Defined in ‘Control.Monad.Writer.Class’
-}

{-
>>> :t writer
>>> :t runWriter
>>> :t execWriter
>>> :t mapWriter
writer :: MonadWriter w m => (a, w) -> m a
runWriter :: Writer w a -> (a, w)
execWriter :: Writer w a -> w
mapWriter :: ((a, w) -> (b, w')) -> Writer w a -> Writer w' b

>>> writer (1, Sum 0) :: Writer (Sum Int) Int
WriterT (Identity (1,Sum {getSum = 0}))
>>> runWriter (return 0 :: Writer String Int)
(0,"")
>>> execWriter (writer (10, "hello") :: Writer String Int)
"hello"
>>> runWriter . mapWriter (\(a, Sum b) -> (show a, show b)) $ (writer (1, Sum 0))
("1","0")
-}

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got a number: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    tell ["hello"]
    c <- logNumber 2
    return (a * b * c)
{-
>>> runWriter multWithLog
(30,["Got a number: 3","Got a number: 5","hello","Got a number: 2"])
>>> :t tell
tell :: MonadWriter w m => w -> m ()
-}

gcd' :: Int -> Int -> Writer [String] Int
gcd' a b
    | b == 0 = do
        tell ["Finished with : " ++ show a]
        return a
    | otherwise = do
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
        gcd' b (a `mod` b)
{-- test
ghci> mapM_ putStrLn $ snd $ runWriter $ gcd' 98 51
98 mod 51 = 47
51 mod 47 = 4
47 mod 4 = 3
4 mod 3 = 1
3 mod 1 = 0
Finished with : 1
-}

--difference List, avoid inefficient list appending like ((((a ++ b) ++ c) ++ d) ++ e), always do (a ++ (b ++ (c ++ (d ++ e))))

newtype DiffList a = DiffList {getDiffList :: [a] -> [a]}

toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList (xs++)

fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []

-- declare DiffList as a Monoid
instance Semigroup (DiffList a) where
    DiffList f <> DiffList g = DiffList (f . g)

instance Monoid (DiffList a) where
    mempty = DiffList ([]++)
    DiffList f `mappend` DiffList g = DiffList (f . g)

-- test performance of DiffList
finalCountDown :: Int -> Writer (DiffList String) ()
finalCountDown 0 = do
    tell (toDiffList ["0"])
finalCountDown x = do
    finalCountDown (x-1)
    tell (toDiffList [show x])

finalCountDown2 :: Int -> Writer [String] ()
finalCountDown2 0 = do
    tell ["0"]
finalCountDown2 x = do
    finalCountDown2 (x-1)
    tell [show x]

test1 :: IO ()
test1 = mapM_ putStrLn . fromDiffList . snd . runWriter $ finalCountDown 50000
test2 :: IO ()
test2 = mapM_ putStrLn . snd . runWriter $ finalCountDown2 50000

main :: IO ()
-- main = test1
main = test2