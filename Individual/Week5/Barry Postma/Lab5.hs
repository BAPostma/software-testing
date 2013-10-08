module Lab5

where

import Data.List
import Week5
import Workshop5
import RandomSudoku

{-|
	Exercise 1
	Time spent: 1:15 hrs
-}
-- Given
mergeSrt :: Ord a => [a] -> [a]
mergeSrt [] = []
mergeSrt (x:xs) = merge [x] (mergeSrt xs)

-- Assertion wrapper
mergeSrt' :: Ord a => ([a] -> [a] -> Bool) -> [a] -> [a]
mergeSrt' p xs = if p xs (mergeSrt xs) then mergeSrt xs
			     else error "pre-/postcondition not met"

-- Usage of the assertion
-- Precondition: None
-- Postcondition: Values are sorted in ascending order
mergeSrtAssertionResult = mergeSrt' (\ _ (x:y:xs) -> x < y) [10,5,100,60,40,77]

{-|
	Exercise 2
	Time spent: ___
-}
-- Given
split :: [a] -> ([a],[a])
split xs = let n = div (length xs) 2
		   in (take n xs, drop n xs) 

-- Assertion wrapper
split' :: ([a] -> ([a],[a]) -> Bool) -> [a] -> ([a],[a])
split' p xs = if p xs (split xs) then split xs
			  else error "pre-/postcondition not met"

-- Usage of the assertion
-- Precondition: List contains more than one element
-- Postcondition: Values are sorted in ascending order
splitAssertionResult = split' (\ xs _ -> length xs >= 2) [20,60,40]

{-|
	Exercise 3
	Time spent: ___
-}
exampleNrc :: Grid
exampleNrc = [[0,0,0,3,0,0,0,0,0],
              [0,0,0,7,0,0,3,0,0],
              [2,0,0,0,0,0,0,0,8],
              [0,0,6,0,0,5,0,0,0],
              [0,9,1,6,0,0,0,0,0],
              [3,0,0,0,7,1,2,0,0],
              [0,0,0,0,0,0,0,3,1],
              [0,8,0,0,4,0,0,0,0],
			  [0,0,2,0,0,0,0,0,0]]







