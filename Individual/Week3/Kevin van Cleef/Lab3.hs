-- Lab Week 3
module Lab3

where 

import Week3
import Techniques
import Data.List


-- 3. Consult the course slides of this week to write a generator for random
-- integer lists. The type should be
-- genIntList :: IO [Int]

-- Duration: 40 minutes

int_list_length = 10
int_list_max_int = 10
genIntList :: IO [Int]
genIntList = sequence (replicate int_list_length (getRandomInt int_list_max_int))

-- 4. A permutation of a finite list is another finite list with the same elements, but 
-- possibly in a different order. For example, [0,2,0] is a
-- permutation of [0,0,2], but [2,2,0] is not. Write a function
-- isPermutation :: Eq a => [a] -> [a] -> Bool
-- that returns True if its arguments are permutations of each other.

-- Duration: 30 minutes

isPermutation :: Eq a => [a] -> [a] -> Bool
isPermutation xs ys = elem ys (permutations xs)

-- 5. Define some testable properties for this function, and use your random
-- generator for integer lists from Exercise 3 to test isPermutation.

-- Duration 45 minutes

-- Some testable properties are:
-- The length of both list must be equal
-- When both lists are sorted the lists are equal.
-- The frequency of each element in the lists must be equal.
-- All permutations of one list is a permutation of the other list.
-- When lists of integers than the sum of the list must be equal.
-- When een list of strings the length of all string must be equal.

-- User this function with a integer as parameter to define the total of tests to run.
testIsPermutations :: Int -> IO ()
testIsPermutations 0 = print ("Done testing")
testIsPermutations n = do testIsPermutation
                          testIsPermutations (n-1)

testIsPermutation :: IO ()
testIsPermutation = do
    xs <- genIntList
    ys <- genIntList
    let check1 = (isEqualWhenSorted xs ys)
        check2 = (isEqualLength xs ys)
        check3 = (isPermutation xs ys)
        result = (check1 && check2 && check3) 
        in print ("Equal when sorted? " ++ show (check1) ++ ", Equal length? " ++ show (check2) ++ ", Permutation? " ++ show (check3) ++ " Test passed? " ++ show (result) ++ ", Lists: " ++ show (xs) ++ " & " ++ show (ys))

isEqualLength :: Ord a => [a] -> [a] -> Bool
isEqualLength xs ys = length xs == length ys

isEqualWhenSorted :: Ord a => [a] -> [a] -> Bool
isEqualWhenSorted xs ys = (sort xs) == (sort ys)


