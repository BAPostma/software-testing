module Sol1Leonard where

import GS

-- - Exercise 1.1
-- ^
-- *, /
-- +, -

-- - Exercise 1.3
-- divides d n = rem n d == 0

-- - Exercise 1.4
-- No, because if k^2 = n then k divides n, namely n / k = k. So in this case it will never reach the second body.

-- - Exercise 1.5
-- ld n = ldf 2 n

-- ldf k n | divides k n = k
--         | k^2 > n     = n
--         | otherwise   = ldf (k+1) n

-- prime0 n | n < 1     = error "not a positive integer"
--          | n == 1    = False
--          | otherwise = ld n == n

-- - Exercise 1.6
-- rem :: Integer -> Integer -> Integer

-- - Exercise 1.7
-- It just displays what type is expected by the expression and/or what type is returned

-- - Exercise 1.9
maxInt :: [Int] -> Int
maxInt [] = error "empty list"
maxInt [x] = x
maxInt (x:xs) = max x (maxInt xs)

-- - Exercise 1.10
removeFst :: Int -> [Int] -> [Int]
removeFst m [] = []
removeFst m (x:xs) | m == x    = xs
                   | otherwise = x : (removeFst m xs)

-- - Exercise 1.11

