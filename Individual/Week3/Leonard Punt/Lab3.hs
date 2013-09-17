module Lab3 where

import System.Random
import Data.List

-- Exercise 3
getRandomInt :: Int -> IO Int
getRandomInt n = getStdRandom (randomR (0,n))

genIntList :: IO [Int]
genIntList = do
               x <- getRandomInt 50
               sequence (replicate x (getRandomInt x))

-- Exercise 4
isPermutation :: Eq a => [a] -> [a] -> Bool
isPermutation xs ys = elem ys (permutations xs)
