{- return in do : turn a value into IO value
>>> :t return
return :: Monad m => a -> m a
>>> :t do (return "hello")
do (return "hello") :: Monad m => m [Char]
-}

main :: IO ()
main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words