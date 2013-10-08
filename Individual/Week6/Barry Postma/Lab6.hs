module Lab6

where
import Data.List
import System.Random
import Week6

--- Given code
carmichael :: [Integer]
carmichael = [ (6*k+1)*(12*k+1)*(18*k+1) | 
      k <- [2..], 
      isPrime (6*k+1), 
      isPrime (12*k+1), 
      isPrime (18*k+1) ]

{-|
    Exercise 1
    Probably doesn't work
-}
exM2 :: Integer -> Integer -> Integer -> Integer
exM2 x y n | y == 0 = 1
           | even y = rem (m ^ 2) n
           | otherwise = (rem (x ^ (y - 1)) n) * (rem x n)
           where m = exM2 x (y `div` 2) n
              
{-|
    Exercise 2
-}
--testExM2 = [ exM2 x y 5 | x <- [1..100], y <- [1..100] ]

{-|
    Exercise 3
-}
composites :: [Integer]
composites = composites' [2..]

composites' :: [Integer] -> [Integer]
composites' xs = [ x | x <- xs, head (factors x) /= x ]
