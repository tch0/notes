import System.IO
import Data.Char
import System.Directory (getCurrentDirectory)

{-
>>> :t openFile
openFile :: FilePath -> IOMode -> IO Handle
>>> :t hGetContents
hGetContents :: Handle -> IO String
>>> :t hClose
hClose :: Handle -> IO ()
>>> :i IOMode
type IOMode :: *
data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
  	-- Defined in ‘GHC.IO.IOMode’
instance Enum IOMode -- Defined in ‘GHC.IO.IOMode’
instance Show IOMode -- Defined in ‘GHC.IO.IOMode’
instance Eq IOMode -- Defined in ‘GHC.IO.IOMode’
instance Ord IOMode -- Defined in ‘GHC.IO.IOMode’
instance Read IOMode -- Defined in ‘GHC.IO.IOMode’
>>> :i Handle
type Handle :: *
data Handle
  = FileHandle FilePath {-# UNPACK #-}(MVar Handle__)
  | DuplexHandle FilePath
                 {-# UNPACK #-}(MVar Handle__)
                 {-# UNPACK #-}(MVar Handle__)
  	-- Defined in ‘GHC.IO.Handle.Types’
instance Show Handle -- Defined in ‘GHC.IO.Handle.Types’
instance Eq Handle -- Defined in ‘GHC.IO.Handle.Types’

>>> :t withFile
withFile :: FilePath -> IOMode -> (Handle -> IO r) -> IO r

-- file IO functions
>>> :t hGetLine
>>> :t hGetChar
>>> :t hPutChar
>>> :t hPutStr
>>> :t hPutStrLn
>>> :t hPrint
hGetLine :: Handle -> IO String
hGetChar :: Handle -> IO Char
hPutChar :: Handle -> Char -> IO ()
hPutStr :: Handle -> String -> IO ()
hPutStrLn :: Handle -> String -> IO ()
hPrint :: Show a => Handle -> a -> IO ()

>>> :t readFile
>>> :t writeFile
>>> :t appendFile
readFile :: FilePath -> IO String
writeFile :: FilePath -> String -> IO ()
appendFile :: FilePath -> String -> IO ()
-}

testReadFile :: IO ()
testReadFile = do
    handle <- openFile "test.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle

testWithFile :: IO ()
testWithFile = do
    withFile "test.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)

withFile' :: FilePath -> IOMode -> (Handle -> IO b) -> IO b
withFile' path mode f = do
    handle <- openFile path mode
    result <- f handle
    hClose handle
    return result

testReadFile' :: IO ()
testReadFile' = do
    contents <- readFile "test.txt"
    putStr contents

testWriteFile :: IO ()
testWriteFile = writeFile "SukaSuka.txt" "Nehpren Ruq Insania\n"

testAppendFile :: IO ()
testAppendFile = appendFile "SukaSuka.txt" "Catholly Nota Senirious"

main :: IO ()
main = do
    testWriteFile
    testAppendFile
    contents <- readFile "SukaSuka.txt"
    putStr contents

{- buffer
>>> :t hSetBuffering
hSetBuffering :: Handle -> BufferMode -> IO ()
>>> :t hGetBuffering
hGetBuffering :: Handle -> IO BufferMode
>>> :t hFlush
hFlush :: Handle -> IO ()

>>> :i BufferMode
type BufferMode :: *
data BufferMode
  = NoBuffering | LineBuffering | BlockBuffering (Maybe Int)
  	-- Defined in ‘GHC.IO.Handle.Types’
instance Show BufferMode -- Defined in ‘GHC.IO.Handle.Types’
instance Eq BufferMode -- Defined in ‘GHC.IO.Handle.Types’
instance Ord BufferMode -- Defined in ‘GHC.IO.Handle.Types’
instance Read BufferMode -- Defined in ‘GHC.IO.Handle.Types’

>>> hGetBuffering stdin
BlockBuffering Nothing
>>> hGetBuffering stdout
BlockBuffering Nothing
-}

{- file operations
>>> :t System.Directory.renameFile
>>> :t System.Directory.removeFile
>>> :t System.Directory.getCurrentDirectory
>>> :t System.IO.openTempFile
System.Directory.renameFile :: FilePath -> FilePath -> IO ()
System.Directory.removeFile :: FilePath -> IO ()
System.Directory.getCurrentDirectory :: IO FilePath
System.IO.openTempFile :: FilePath -> String -> IO (FilePath, Handle)
-}
