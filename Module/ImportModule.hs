import qualified Prelude as P
{-
>>> length [1, 2]
Variable not in scope: length :: [a0] -> t
>>> Prelude.max 1 2
2
>>> Prelude.length [1]
1
>>> length [1]
Variable not in scope: length :: [a0] -> t
-}

x :: P.Integer
x = P.max 1 2


main :: P.IO ()
main = P.print x