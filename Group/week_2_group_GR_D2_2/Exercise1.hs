module TriangleExercise where

data Shape = NoTriangle | Equilateral | Isosceles | Rectangular | Other deriving (Eq,Show)

triangle :: Integer -> Integer -> Integer -> Shape
triangle p q r | not (p > 0 && q > 0 && r > 0) = NoTriangle 
			   | (p == q && p == r && q == r)  = Equilateral
			   | (q^2 + r^2 == p^2 || p^2 + r^2 == q^2 || p^2 + q^2 == r^2) = Rectangular
			   | (p == q || p == r || q == r) = Isosceles
			   | otherwise = Other