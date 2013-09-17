module Lab3 where

import Week2
import Week3
import Exercise3Improved
import Techniques
import System.Random
import Data.Char
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

-- Exercise 7
-- Note: because 'A' and 'E' are 'reserved' for Forall and Exists, this functions generates a random char between 'f' and 'z'
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
