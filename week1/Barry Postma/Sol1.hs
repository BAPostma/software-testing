module Sol1 where

import GS

{-|
	Exercise 1.3

divides :: Integer -> Integer -> Bool
divides d n = rem n d == 0
-}

{-| Least divisor
ldf :: Integer -> Integer -> Integer
ldf k n | divides k n 	= k
		| (k ^ 2) > n 	= n
		| otherwise 	= ldf (k + 1) n
-}

{-| Least divisor
ld :: Integer -> Integer
ld n = ldf 2 n
-}

{-|
	Exercise 1.4
	No difference, if  k*2 == n then divides k n would return true
-}

{-|
	Exercise 1.5
-}
{-|
prime0 :: Integer -> Bool
prime0 n | n  < 1 	 = error "given argument is not a positive number"
		 | n == 1	 = False
		 | otherwise = ld n == n
-}
	 
{-|
	Exercise 1.6
	Yes, we pass it two integers and the outcome is going to be an integer hence:
		Integer -> Integer -> Integer
-}

{-|
	Exercise 1.7
	1) divides 5  :: Integer -> Bool
	Means its input value (5) is given, but another type of type Integer is 
	required as a parameter, Bool is the last in the list and indicates a boolean 
	value is going to be returned.
	2) divides 5 7 :: Bool
	All parameters are given (5 and 7) so the result of this expression is going to
	be its return type: a boolean.
-}

{-|
mnmInt :: [Int] -> Int
mnmInt [] = error "empty list"
mnmInt [xs] = xs
mnmInt (x:xs) = min x (mnmInt xs)
-}

{-|
	Exercise 1.9
-}
mxmInt :: [Int] -> Int
mxmInt [] = error "empty list"
mxmInt [x] = x
mxmInt (x : xs) = max x (mxmInt xs)

{-|
	Exercise 1.10
-}
-- removeFst :: Integer -> [Integer] -> [Integer] -- Needed as a generic function later on
removeFst m (x:ms) | not (elem m ms) = ms
				   | m == x 		 = ms
				   | otherwise = x : (removeFst m ms) -- prepend x to the outcome

{-|
	Exercise 1.13
-}
count :: Char -> String -> Int
count c (x:s) | not (elem c (x:s)) 	= 0
			  | c == x			= 1 + (count x s)
			  | otherwise		= 0 + (count c s)

{-|
	Exercise 1.14
-}
blowup :: Int -> String -> String
blowup _ [] = []
blowup i (s:x) = (replicate i s) ++ (blowup (i + 1) x)
			
blowup' :: String -> String
blowup' [] = []
blowup' s = blowup 1 s

{-|
	Exercise 1.15
-}
srtString :: [String] -> [String]
srtString s = x : (srtString (removeFst x s)) where x = minimum s
-- minimum throws an exception "Prelude.minimum: Empty list"

{-|
	Exercise 1.17
-}
substring :: String -> String -> Bool
substring _	   [] 		 = False
substring str1 (s2:str2) | prefix str1 (s2:str2) = True
						 | substring str1 str2   = True
						 | otherwise			 = False

{-|
	Exercise 1.18
	1) [String]
		blowup' "boom!" :: String
	2) (Bool, String)
		(not True, "FooBarBaz")
	3) [(Bool, String)]
		[(False, "Foo"), (True, "Bar")]
	4) ([Bool], String)
		([True, True, False], "Baz")
	5) Bool -> Bool
		not :: Bool -> Bool
-}

{-|
	Exercise 1.19
	1) head
		type: head :: [a] -> a
		does: gets the first a from a list of a's
	2) last
		type: last :: [a] -> a
		does: gets the last a from a list of a's
	3) init
		type: init :: [a] -> [a]
		does: gets the list of a's excluding the last a
	4) fst
		type: fst :: (a, b) -> a
		does: gets a in a tuple of a and b i.e. gets the first one
	5) (++)
		type: (++) :: [a] -> [a] -> [a]
		does: takes two lists of a's and returns [a] with [a2] appended
	6) flip
		type: flip :: (a -> b -> c) -> b -> a -> c
		does: not sure how to convert the type definition into a command
	7) flip (++)
		type: flip (++) :: [a] -> [a] -> [a]
		does: dito
-}

{-|
	Exercise 1.20
-}
lengths x = map (length) x

{-|
	Exercise 1.21
-}
sumLengths x = sum (lengths x)

{-|
	Exercise 1.24
	
	the function ldpf expects two arguments, therefore making the change
	results in the following compilation error:
	
	Couldn't match expected type `Integer'
                with actual type `Integer -> Integer'
    In the return type of a call of `ldpf'
    Probable cause: `ldpf' is applied to too few arguments
-}












