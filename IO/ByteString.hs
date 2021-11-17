import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S
import qualified GHC.Word

{-
>>> :i S.ByteString
type ByteString :: *
data ByteString
  = PS {-# UNPACK #-}(ForeignPtr Word8)
       {-# UNPACK #-}Int
       {-# UNPACK #-}Int
  	-- Defined in ‘Data.ByteString.Internal’
instance Show ByteString -- Defined in ‘Data.ByteString.Internal’
instance Eq ByteString -- Defined in ‘Data.ByteString.Internal’
instance Monoid ByteString -- Defined in ‘Data.ByteString.Internal’
instance Ord ByteString -- Defined in ‘Data.ByteString.Internal’
instance Semigroup ByteString
  -- Defined in ‘Data.ByteString.Internal’
instance Read ByteString -- Defined in ‘Data.ByteString.Internal’

>>> :i B.ByteString 
type ByteString :: *
data ByteString = Empty | Chunk {-# UNPACK #-}ByteString ByteString
  	-- Defined in ‘Data.ByteString.Lazy.Internal’
instance Show ByteString
  -- Defined in ‘Data.ByteString.Lazy.Internal’
instance Eq ByteString
  -- Defined in ‘Data.ByteString.Lazy.Internal’
instance Monoid ByteString
  -- Defined in ‘Data.ByteString.Lazy.Internal’
instance Ord ByteString
  -- Defined in ‘Data.ByteString.Lazy.Internal’
instance Semigroup ByteString
  -- Defined in ‘Data.ByteString.Lazy.Internal’
instance Read ByteString
  -- Defined in ‘Data.ByteString.Lazy.Internal’

>>> :t S.pack
S.pack :: [Word8] -> ByteString
>>> :t B.pack
B.pack :: [Word8] -> ByteString
>>> :t S.unpack
S.unpack :: ByteString -> [Word8]
>>> :t B.unpack
B.unpack :: ByteString -> [Word8]
>>> :t B.fromChunks
B.fromChunks :: [ByteString] -> ByteString
>>> :t B.toChunks
B.toChunks :: ByteString -> [ByteString]

>>> B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]
"()*+,-./0"
>>> B.toChunks (B.pack [40..48])
["()*+,-./0"]
-}

xs :: [GHC.Word.Word8]
xs = [1, 2, 3, 0xffff]
main :: IO ()
main = print (S.pack xs)

{- concat
>>> B.cons 80 $ B.pack [81..90]
"PQRSTUVWXYZ"
>>> B.cons' 80 $ B.pack [81..90]
"PQRSTUVWXYZ"
>>> foldr B.cons B.empty [50..60]
>>> foldr B.cons' B.empty [50..60]
"23456789:;<"
"23456789:;<"

>>> :t B.cons
>>> :t B.cons'
B.cons :: Word8 -> ByteString -> ByteString
B.cons' :: Word8 -> ByteString -> ByteString

>>> :t B.readFile
B.readFile :: FilePath -> IO ByteString
-}

a :: GHC.Word.Word8 -> B.ByteString -> B.ByteString
a = B.cons
