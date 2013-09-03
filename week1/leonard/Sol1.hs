module Sol1 where

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
-- removeFst :: Int -> [Int] -> [Int] -- commented, because in Exercise 1.15 we use this function for Strings too
removeFst m [] = []
removeFst m (x:xs) | m == x    = xs
                   | otherwise = x : removeFst m xs

-- - Exercise 1.13
count :: Char -> String -> Int
count c [] = 0
count c (x:xs) | c == x    = 1 + count c xs
               | otherwise = count c xs

-- - Exercise 1.14
blowup :: String -> String
blowup = blowup' 1

blowup' :: Int -> String -> String
blowup' _ [] = []
blowup' i (x:xs) = copy x i ++ blowup' (i+1) xs

copy :: Char -> Int -> String
copy c i | i > 0 = c : copy c (i-1)
	 | otherwise = []

-- - Exercise 1.15
srtString :: [String] -> [String]
srtString [] = []
srtString xs = m : srtString (removeFst m xs) where m = minimum xs

-- - Exercise 1.17
substring :: String -> String -> Bool
substring xs [] = False
substring xs ys | prefix xs ys           = True
                | substring xs (tail ys) = True
                | otherwise              = False

-- - Exercise 1.18
-- 1
-- srtString ["b", "a"] :: [String]
-- 2
-- (True, "foo") :: (Bool, [Char])
-- 3
-- [(True, "foo")] :: [(Bool, [Char])]
-- 4
-- ([True, False], "foo") :: ([Bool], [Char])
-- 5
-- not :: Bool -> Bool

-- - Exercise 1.19
-- 1
-- head :: [a] -> a, takes first element of a list
-- 2
-- last :: [a] -> a, takes last element of a list
-- 3
-- init :: [a] -> [a], copies the list and removes the last item
-- 4
-- fst :: (a,b) -> a, takes the left side of a tuple
-- 5
-- (++) :: [a] -> [a] -> [a], concatenates two lists (of the same type)
-- 6
-- flip :: (a -> b -> c) -> b -> a -> c, flips the order of the arguments
-- 7
-- flip (++) :: [a] -> [a] -> [a], prepends the first list (second argument) to the second list (third argument)

-- - Exercise 1.20
lengths :: [[a]] -> [Int]
lengths = map length

-- - Exercise 1.21
-- This is not possible with the map function. You can't reduce a list with the map function
sumLengths :: [[a]] -> Int
sumLengths = sum . lengths

-- - Exercise 1.24
-- Nothing changes, 'ldp' now returns a function that expects an Integer, this Integer is provided in the function 'prime' 
