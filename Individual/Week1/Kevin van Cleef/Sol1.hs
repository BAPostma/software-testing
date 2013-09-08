module Sol1 where
import GS

-- Exercise 1.1
-- From highest precedence to lowest precedence:
-- ^
-- * /
-- + -

-- Exercise 1.3
-- divides d n = rem n d == 0	


-- Exercise 1.4
-- No, because when k^2 is equal to n then the first condition in met and de second will no be reached.


-- Exercise 1.6
-- rem :: Integer -> Integer -> Integer

-- Exercise 1.9
maxInt :: [Int] -> Int
maxInt [] = error "empty list" 
maxInt [x] = x
maxInt (x:xs) = max x (maxInt xs)

-- Exercise 1.10
--removeFst :: Int -> [Int] -> [Int]   			-- Exercise 1.10
--removeFst :: String -> [String] -> [String]   -- Exercise 1.15
removeFst m [] = []
removeFst m (x:xs) | m == x    = xs
                   | otherwise = x : (removeFst m xs) 

-- Exercise 1.11
srtInts :: [Int] -> [Int]                  
srtInts [] = []
srtInts xs = m : (srtInts (removeFst m xs)) where m = mnmInt xs

-- Exercise 1.13
count :: Char -> String -> Int
count c [] = 0
count c (x:xs) 	| c == x 	= 1 + count c xs
				| otherwise = count c xs

-- Exercise 1.14
blowup :: String -> String
blowup [] = ""
blowup xs = blowup' 1 xs

blowup' :: Int -> String -> String
blowup' _ [] = []
blowup' i (x:xs) = take (i)(repeat(x)) ++ (blowup' (i+1) xs)

-- Exercise 1.15
srtString :: [String] -> [String]
srtString [] = []
srtString xs = m : (srtString  (removeFst m xs)) where m = minimum xs

-- Exercise 1.16
prefix :: String -> String -> Bool
prefix [] ys = True
prefix xs [] = False
prefix (x:xs) (y:ys) = (x == y) && prefix xs ys

-- Exercise 1.17
substring :: String -> String -> Bool
substring [] ys = False
substring xs [] = False
substring xs ys | prefix xs ys				= True
				| substring xs (tail ys)	= True
				| otherwise					= False

-- Exercise 1.18
-- 1:
-- ["ABC","DEF","GHI"] :: [String]
-- 2:
-- (True, "ABC") :: (Bool, String)
-- 3:
-- [(True, "ABC"),(True, "ABC"),(True, "ABC")] :: [(Bool, String)]
-- 4:
-- ([True], "ABC") :: ([Bool], String)
-- 5:
-- not

-- Exercise 1.19
-- 1: head			[a] -> a
-- Takes the first element of the list.
-- 2: last			[a] -> a
-- Takes the last element of the list.
-- 3: init			[a] -> [a]
-- Removes the last element of the list and return the remaining list.
-- 4: fst 			(a, b) -> a
-- Returns the first item in a tuple.
-- 5: (++)			[a] -> [a] -> [a]
-- Combines to list of the same type.
-- 6: flip			(a -> b -> c) -> b -> a -> c
-- Flip takes the arguments in reverse order.
-- 7: flip (++)	[a] -> [a] -> [a]
-- Combines to list of the same type in reverse order.


-- Exercise 1.20
lengths :: [[a]] -> [Int]
lengths xs = map length xs

-- Exercise 1.21
sumLengths :: [[a]] -> Int
sumLengths xs = sum (map length xs)

-- Exercise 1.24
-- Nothing changes. But I can't explain why.































