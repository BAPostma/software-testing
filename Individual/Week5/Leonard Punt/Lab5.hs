module Lab5

where
import Data.List
import Week5

-- Exercise 1 - Time spent: 1 hour
mergeSrt :: Ord a => [a] -> [a]
mergeSrt [] = []
mergeSrt (x:xs) = merge [x] (mergeSrt xs)

-- Assertion: every element in the result list should be smaller or equal than all its succeeding items
mergeSrtA :: Ord a => [a] -> [a]
mergeSrtA = assert1 (\ _ ys -> sorted ys) mergeSrt
