module Exercise1 where

import Data.List

data Shape = NoTriangle 
           | Equilateral 
           | Isosceles 
           | Rectangular 
           | Other
             deriving (Eq,Show)

triangle :: Integer -> Integer -> Integer -> Shape
triangle a b c | a + b <= c || a + c <= b || b + c <= a                   = NoTriangle
               | a == b && b == c                                         = Equilateral
               | a == b || b == c || a == c                               = Isosceles
               | a^2 + b^2 == c^2 || b^2 + c^2 == a^2 || a^2 + c^2 == b^2 = Rectangular
               | otherwise                                                = Other

{-
  A way to improve this function might be to have a precondition that a, b and c are sorted. So a <= b and b <= c, because:
  - This will shorten the implementation of Isosceles, we will only have to check if a == b || b == c. The check for a == c will be redundant because if that is true, it has to be an Equilateral, which we already covered in the case above.
  - The check for NoTriangle will also become easier, we will only have to check if a + b <= c. Because if the two smallest sides are greater than the biggest side, than 1 small side + 1 big side will always be bigger than the other smaller side.
-}

-- test functions
triples = [[x, y, z] | x <- [0..5], y <- [x..5], z <- [y..5]]
test shape = [[x, y, z] | [x, y, z] <- triples, triangle x y z == shape]
