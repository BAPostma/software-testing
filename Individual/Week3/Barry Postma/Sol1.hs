module Sol1

where

import Data.List
import Data.Char
import System.Random

import Week3

{-|
	Assignment 3
-}
getRandomInt :: Int -> IO Int
getRandomInt n = getStdRandom (randomR (0,n))

--getRandomInt' :: Int
--getRandomInt' = 

--getIntList :: IO [Int]
--getIntList = do
--			 lst <- (getRandomInt 10)
--			 return [0..lst]

{-|
getIntList :: IO [Int]
getIntList = do
			 lst <- (getRandomInt 10)
			 return [0..lst]
-}

{-|
	Assignment 4
-}
isPermutation :: Eq a => [a] -> [a] -> Bool
isPermutation [] [] = True
isPermutation xs ys | (length xs /= length ys) = error $ "Lists are not of equal length: " ++ (show (length xs) ++ " and " ++ show (length ys))
					| otherwise = isPermutation' xs ys

isPermutation' :: Eq a => [a] -> [a] -> Bool
isPermutation' (x:xs) ys | null xs = True
						 | otherwise = any (x==) ys && isPermutation' xs ys

