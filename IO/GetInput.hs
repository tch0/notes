{-
>>> :t getLine
getLine :: IO String
>>> :t putStrLn
putStrLn :: String -> IO ()
-}

-- <- sytactic sygar, get value from IO
main :: IO ()
main = do
    putStrLn "hello, input your name:"
    name <- getLine 
    putStrLn ("Hey ! " ++ name ++ " Yo ! what's up !")
