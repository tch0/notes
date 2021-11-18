{-
>>> calculatePostfix "1.1 2.4 + 3.1 *" :: Double
10.85
>>> calculatePostfix "1 2 + 3 *" :: Int
9
>>> :t reads
reads :: Read a => ReadS a
-}
calculatePostfix :: (Num a, Read a) => String -> a
calculatePostfix = head . foldl foldingFunction [] . words
    where   foldingFunction (x:y:ys) "*" = (x * y):ys
            foldingFunction (x:y:ys) "+" = (x + y):ys
            foldingFunction (x:y:ys) "-" = (x - y):ys
            -- other functions
            foldingFunction xs numberString = read numberString:xs

main :: IO ()
main = print (calculatePostfix "1.1 2 + 3 *" :: Double)