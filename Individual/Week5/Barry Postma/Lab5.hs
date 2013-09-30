module Lab5

where

import Data.List
import Week5

{-|
	Exercise 1
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
-- Postcondition: values are sorted in ascending order
mergeSrtAssertionResult = mergeSrt' (\ _ (x:y:xs) -> x < y) [10,5,100,60,40,77]

