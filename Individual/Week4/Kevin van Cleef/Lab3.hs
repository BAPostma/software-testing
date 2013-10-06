-- Lab Week 3
module Lab3

where 

import Week2
import CNF_Lab2_Improved
import Week3
import Techniques

import System.Random
import Data.Char
import Data.List
import Data.Ord

-- 1. (If you need it:) Refresh your knowledge of First Order Logic, by consulting http://www.logicinaction.org/docs/ch4.pdf.

-- 2. Study the techniques in the Techniques slides of today until you have
-- mastered them.

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

-- Duration: 45 minutes

isPermutation :: Eq a => [a] -> [a] -> Bool
isPermutation xs ys = elem ys (permutations xs)

-- 5. Define some testable properties for this function, and use your random
-- generator for integer lists from Exercise 3 to test isPermutation.

-- Duration 60 minutes

-- Some testable properties are:
-- # The length of both list must be equal
-- # When both lists are sorted the lists are equal.
-- # The frequency of each element in the lists must be equal.
-- # All permutations of one list is a permutation of the other list.
-- # When lists of integers than the sum of the list must be equal.
-- # When een list of strings the length of all string must be equal.

-- This function can be used to test the isPermutation function with a integer as parameter to define the total of tests to run.
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

-- 6.Use the random formula generator from the Techniques slides to test
-- your CNF program of last week. (Deliverable: file with tests for CNF
-- program, report on the results.)

-- Duration: 45 minutes
-- The report on the results can be found in ReportExercise6.txt

-- This function can be user to test the CNF program of week 2. An integer is given 
-- as parameter to define the total of different formulate that will be tested.
testCNFs :: Int -> IO ()
testCNFs n = do
  fs <- getRandomCNFs n
  testCNF n fs

-- This function generates random CNF functions.
getRandomCNFs :: Int -> IO [Form]
getRandomCNFs n = do
  fs <- getRandomFs n
  return (map cnf fs)

-- CHeck if a CNF passes the checks.
testCNF :: Int -> [Form] -> IO ()
testCNF n [] = print (show n ++ " tests passed")
testCNF n (f:fs) =
  if isCNF f
  then do print ("pass on: " ++ show f)
          testCNF n fs
  else error ("failed test on: " ++ show f)

-- 7. Write a random formula generator for formulas of First Order Logic
-- (as defined in the Week 3 course slides).

-- Duration: 90 minutes

getRandomChar :: IO Char
getRandomChar = getStdRandom (randomR ('f', 'z'))

getRandomTermName :: IO String
getRandomTermName = do
  c <- getRandomChar
  return [c]

getRandomFormulaName :: IO String
getRandomFormulaName = do
  c <- getRandomChar
  return [toUpper c]

getRandomT :: IO Term
getRandomT = do
  d <- getRandomInt 4
  getRandomTerm d

getRandomTerm :: Int -> IO Term
getRandomTerm 0 = do
  m <- getRandomTermName
  return (V m)
getRandomTerm d = do
  n <- getRandomInt 1
  case n of
    0 -> do m <- getRandomTermName
            return (V m)
    1 -> do m <- getRandomTermName
            i <- getRandomInt 5
            ts <- getRandomTerms (d-1) i
            return (F m ts)

getRandomTs :: Int -> IO [Term]
getRandomTs n = do
  d <- getRandomInt 3
  getRandomTerms d n

getRandomTerms :: Int -> Int -> IO [Term]
getRandomTerms _ 0 = return []
getRandomTerms d n = do
  t <- getRandomTerm d
  ts <- getRandomTerms d (n-1)
  return (t:ts)

getRandomFormula :: IO Formula
getRandomFormula = do
  d <- getRandomInt 4
  getRandomFormula' d

getRandomFormula' :: Int -> IO Formula
getRandomFormula' 0 = do
  m <- getRandomFormulaName
  i <- getRandomInt 3
  ts <- getRandomTs i
  return (Atom m ts)
getRandomFormula' d = do
  n <- getRandomInt 8
  case n of
    0 -> do m <- getRandomFormulaName
            i <- getRandomInt 3
            fs <- getRandomTs i
            return (Atom m fs)
    1 -> do t1 <- getRandomT
            t2 <- getRandomT
            return (Eq t1 t2)
    2 -> do f <- getRandomFormula' (d-1)
            return (Week3.Neg f)
    3 -> do f1 <- getRandomFormula' (d-1)
            f2 <- getRandomFormula' (d-1)
            return (Week3.Impl f1 f2)
    4 -> do f1 <- getRandomFormula' (d-1)
            f2 <- getRandomFormula' (d-1)
            return (Equi f1 f2)
    5 -> do i <- getRandomInt 5
            fs <- getRandomFormulas' (d-1) i
            return (Conj fs)
    6 -> do i <- getRandomInt 5
            fs <- getRandomFormulas' (d-1) i
            return (Disj fs)
    7 -> do m <- getRandomFormulaName
            f <- getRandomFormula' (d-1)
            return (Forall m f)
    8 -> do m <- getRandomFormulaName
            f <- getRandomFormula' (d-1)
            return (Exists m f)


-- This function can be user to generate random First Order Logic formulas. Give an integer
-- as parameter to define the total of formulas to return in the list with Formula's.
getRandomFormulas :: Int -> IO [Formula]
getRandomFormulas n = do
  d <- getRandomInt 3
  getRandomFormulas' d n

getRandomFormulas' :: Int -> Int -> IO [Formula]
getRandomFormulas' _ 0 = return []
getRandomFormulas' d n = do
  f <- getRandomFormula' d
  fs <- getRandomFormulas' d (n-1)
  return (f:fs)

-- 8. Bonus Exercise: Write a parser for formulas of First Order Logic
-- (as defined in the Week 3 course slides). Use your random formula
-- generator to test the parser.