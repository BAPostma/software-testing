# Exercise 1: Triangle

Write a program (in Haskell) that takes a triple of integer values as arguments and gives as output one of the following statements:

 ```Not a triangle```  ('Geen driehoek')   if the three numbers cannot occur as the lengths of the sides of triangle,

 ```Equilateral```     ('Gelijkzijdig')    if the three numbers are the lengths of the sides of an equilateral triangle,

 ```Rectangular```     ('Rechthoekig')     if the three numbers are the lengths of the sides of a rectangular triangle,

 ```Isosceles```       ('Gelijkbenig')     if the three numbers are the lengths of the sides of an isosceles (but not equilateral) triangle,

 ```Other```           ('Anders')          if the three numbers are the lengths of the sides of a triangle that is not equilateral, not rectangular, and not isosceles.

Here are some useful type denitions:
  `data Shape = NoTriangle | Equilateral | Isosceles | Rectangular | Other deriving (Eq,Show)`
  `triangle :: Integer -> Integer -> Integer -> Shape`

You may wish to consult http://en.wikipedia.org/wiki/Triangle.

Indicate how you tested or checked the correctness of the program.
Deliverables: Haskell program, test report of 1/2 A4, indication of time spent.

## Answers

**Time Spent:**
I spent 45 minutes to write the function `triangle` and spent another 4 hours to come to the test function `checkTriangles` finally written.

**Code Explanation**

The triangle function takes three integers as input and return a Shape which is equal to one of the Triangle formats.

```
module TriangleExercise where
	
data Shape = NoTriangle | Equilateral | Isosceles | Rectangular | Other deriving (Eq,Show)

triangle :: Integer -> Integer -> Integer -> Shape
triangle p q r | not (p > 0 && q > 0 && r > 0) = NoTriangle
			   | (p == q && q == r)  = Equilateral
			   | (q^2 + r^2 == p^2 || p^2 + r^2 == q^2 || p^2 + q^2 == r^2) = Rectangular
			   | (p == q || p == r || q == r) = Isosceles
			   | otherwise = Other
```

For testing I have written a function ```checkTriangles``` thats expect one integer which is the upper limit to test triple integer combinations and a Triangle Shape to test the data against.
All integer triple that satify will be return as list of integer triples.

```
checkTriangles :: Shape -> Integer -> [(Integer, Integer, Integer)]
checkTriangles s n = [ printTriangles x y z | x <- [0..n], 
										  	                      y <- [x..n], 
										  	                      z <- [y..n], 
										  	                      triangle x y z == s]

printTriangles :: Integer -> Integer -> Integer -> (Integer, Integer, Integer)
printTriangles x y z = (x,y,z)
```