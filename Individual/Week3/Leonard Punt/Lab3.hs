module Lab3 where

import Week2
import Exercise3Improved
import Techniques
import System.Random
import Data.List
import Data.Ord

-- Exercise 3
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

-- Exercise 6
-- See also Exercise6.txt

-- Function to get random CNFs
getRandomCNFs :: Int -> IO [Form]
getRandomCNFs n = do
  fs <- getRandomFs n
  return (map cnf fs)

-- Test function for CNF
testCNFs :: Int -> IO ()
testCNFs n = do
  fs <- getRandomCNFs n
  testCNF n fs

-- Test function for CNF
testCNF :: Int -> [Form] -> IO ()
testCNF n [] = print (show n ++ " tests passed")
testCNF n (f:fs) =
  if isCNF f
  then do print ("pass on: " ++ show f)
          testCNF n fs
  else error ("failed test on: " ++ show f)
