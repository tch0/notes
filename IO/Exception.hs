import System.Environment
import System.IO
import System.IO.Error
import Control.Monad.Catch.Pure (MonadCatch(catch))

{-
>>> :t catch
catch :: (MonadCatch m, Exception e) => m a -> (e -> m a) -> m a
-}

toTry :: IO ()
toTry = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    putStrLn ("This file has " ++ (show . length . lines) contents ++ " lines !")

handler :: IOError -> IO ()
handler e
    | isDoesNotExistError e = do  putStrLn ("File not exist : " ++ show e)
    | isEOFError e = putStrLn "EOF Error!"
    -- other errors
    | otherwise = ioError e -- ioError is like raise/throw in other languages

main :: IO ()
main = toTry `catch` handler

{-
>>> :t isDoesNotExistError 
>>> :t isAlreadyExistsError
>>> :t isFullError
>>> :t isEOFError
>>> :t isIllegalOperation
>>> :t isPermissionError
>>> :t isUserError
isDoesNotExistError :: IOError -> Bool
isAlreadyExistsError :: IOError -> Bool
isFullError :: IOError -> Bool
isEOFError :: IOError -> Bool
isIllegalOperation :: IOError -> Bool
isPermissionError :: IOError -> Bool
isUserError :: IOError -> Bool

>>> :t ioError
>>> :t userError
ioError :: IOError -> IO a
userError :: String -> IOError

>>> :t ioeGetFileName
ioeGetFileName :: IOError -> Maybe FilePath
-}