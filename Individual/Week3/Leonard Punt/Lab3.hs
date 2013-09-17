module Lab3 where

import System.Random
import Data.List
import Data.Ord

-- Exercise 3
getRandomInt :: Int -> IO Int
getRandomInt n = getStdRandom (randomR (0,n))

genIntList :: IO [Int]
genIntList = do
  x <- getRandomInt 10
  sequence (replicate x (getRandomInt x))

-- Exercise 4
isPermutation :: Eq a => [a] -> [a] -> Bool
isPermutation xs ys = elem ys (permutations xs)

-- Exercise 5
-- Testable property: the sorted lists have to be equal
isEqualWhenSorted :: Ord a => [a] -> [a] -> Bool
isEqualWhenSorted xs ys = (sort xs) == (sort ys)

-- Test function for isPermutation
testIsPermutation :: IO ()
testIsPermutation = do
  xs <- genIntList
  ys <- genIntList
  let p1 = (isEqualWhenSorted xs ys)
      p2 = (isPermutation xs ys)
      outcome = (p1 == p2) in
        print ("testable propery is: " ++ show (p1) ++ ", isPermutation: " ++ show (p2) ++ ", test passes? " ++ show (outcome) ++ ", lists: " ++ show (xs) ++ show (ys))

-- Test function for isPermutation
testIsPermutations :: Int -> IO ()
testIsPermutations 0 = print ("Done testing")
testIsPermutations n = do testIsPermutation
                          testIsPermutations (n-1)

