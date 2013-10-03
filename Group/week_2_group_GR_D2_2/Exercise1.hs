module Exercise1

where

import Week2

data Shape = NoTriangle | Equilateral | Isosceles | Rectangular | Other deriving (Eq,Show)

triangle :: Integer -> Integer -> Integer -> Shape
triangle p q r | not (p > 0 && q > 0 && r > 0) = NoTriangle
			   | (p == q && q == r)  = Equilateral
			   | (q^2 + r^2 == p^2 || p^2 + r^2 == q^2 || p^2 + q^2 == r^2) = Rectangular
			   | (p == q || p == r || q == r) = Isosceles
			   | otherwise = Other
-- VVZ: NoTriangle incorrect, counterexample: 'triangle 1 1 1000'

-- Note: when we give the function above the precondition that its parameters are ordered, three patters can be written shorter:
-- triangle :: Integer -> Integer -> Integer -> Shape
-- triangle a b c | a + b <= c       = NoTriangle
--                | a == b && b == c = Equilateral
--                | a == b || b == c = Isosceles
--                | a^2 + b^2 == c^2 = Rectangular
--                | otherwise        = Other


-- Check list of integer triples for a given triangle shape till a given length.
checkTriangles :: Shape -> Integer -> [(Integer, Integer, Integer)]
checkTriangles s n = [ printTriangles x y z | x <- [0..n], 
										  	  y <- [x..n], 
										  	  z <- [y..n], 
										  	  triangle x y z == s]

printTriangles :: Integer -> Integer -> Integer -> (Integer, Integer, Integer)
printTriangles x y z = (x,y,z)
-- VVZ: also, I ran 'checkTriangles Isosceles 4' and got (1,1,3) and (1,1,4) and other strange results
