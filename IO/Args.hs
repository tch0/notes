{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import System.Environment
import System.Directory
import System.IO
import Data.List

{- command arguments
>>> :t getArgs
>>> :t getProgName
getArgs :: IO [String]
getProgName :: IO String
-}

-- a to do list processing example
dispatch :: [([Char], [String] -> IO ())]
dispatch = [("add", add)
           , ("view", view)
           , ("remove", remove)
           ]

-- look up command and execute
main :: IO ()
main = do
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action args

-- prog add file item, add item to end of to-do list
add :: [String] -> IO ()
add [fileName, todoItem] = do
    appendFile fileName (todoItem ++ "\n")
    view [fileName]

-- prog view file, view to-do list file
view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStr $ unlines numberedTasks

-- prog remove file number, to remove line of to do list
remove :: [String] -> IO ()
remove [fileName, numberOfString] = do
    handle <- openFile fileName ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberOfString
        todoTasks = lines contents
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile fileName
    renameFile tempName fileName
    view [fileName]