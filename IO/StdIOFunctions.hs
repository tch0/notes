import Control.Monad
import Data.Char

{- output functions
>>> :t putStr 
putStr :: String -> IO ()
>>> :t putStrLn
putStrLn :: String -> IO ()
>>> :t putChar
putChar :: Char -> IO ()
>>> :t print
print :: Show a => a -> IO ()
-}

{- input functions
>>> :t getChar
getChar :: IO Char
>>> :t getLine
getLine :: IO String
>>> :t getContents
getContents :: IO String
-}

{-
>>> :t when
when :: Applicative f => Bool -> f () -> f ()
-}

------ when
testWhen :: IO ()
testWhen = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        testWhen

testSequence :: IO ()
testSequence = do
    rs <- sequence [getLine, getLine, getLine]
    print rs

{-
>>> :t sequence
sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)
>>> :t mapM
>>> :t mapM_
mapM :: (Traversable t, Monad m) => (a -> m b) -> t a -> m (t b)
mapM_ :: (Foldable t, Monad m) => (a -> m b) -> t a -> m ()
>>> :t forM
>>> :t forM_
forM :: (Traversable t, Monad m) => t a -> (a -> m b) -> m (t b)
forM_ :: (Foldable t, Monad m) => t a -> (a -> m b) -> m ()
-}

-- mapM, mapM_
testMapM :: IO [()]
testMapM = do
    mapM print [1, 2, 3]

testMapM_ :: IO ()
testMapM_ = do
    mapM_ print [1, 2, 3]

testForM :: IO [()]
testForM = do
    colors <- forM [1,2,3,4] (\a -> do
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
        getLine)
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors

{-
>>> :t Control.Monad.forever
Control.Monad.forever :: Applicative f => f a -> f b
-}

testForever :: IO ()
testForever = forever $ do
    l <- getLine
    putStrLn $ map toUpper l

-- lazy I/O of getContents
testContents :: IO ()
testContents = do
    contents <- getContents
    putStr $ map toUpper contents

{- interact
>>> :t interact
interact :: (String -> String) -> IO ()
-}

main :: IO ()
main = interact $ map toUpper . unlines . filter ((<10) . length) . lines