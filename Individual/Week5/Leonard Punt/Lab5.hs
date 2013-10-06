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

-- Exercise 2 - Time spent: 20 minutes
split :: [a] -> ([a],[a])
split xs = let
   n = length xs `div` 2
  in
   (take n xs, drop n xs)

mergeSrt1 :: Ord a => [a] -> [a]
mergeSrt1 [] = []
mergeSrt1 [x] = [x]
mergeSrt1 xs = let
   (ys, zs) = split xs
  in
   merge (mergeSrt1 ys) (mergeSrt1 zs)

-- Assertion: every element in the result list should be smaller or equal than all its succeeding items
mergeSrt1A :: Ord a => [a] -> [a]
mergeSrt1A = assert1 (\ _ ys -> sorted ys) mergeSrt1

-- Exercise 3 - see Exercise3.hs

-- Exercise 4 - see Exercise4.hs

-- Exercise 5 - see Exercise5.hs
