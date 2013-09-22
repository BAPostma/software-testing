module Sol1

where

import Data.List
import Data.Char
import System.Random

import Week2
import Week3

{-|
	Exercise 3
	Performed with a little help from team members as there were lots of difficulties
	in dealing with the IO Int array and converting/typecasting it...
	
	Time taken (investigation on IO ints predominantly) 4 hrs.
-}

-- given code
getRandomInt :: Int -> IO Int
getRandomInt n = getStdRandom (randomR (0,n))

-- written code
getIntList :: Int -> Int -> IO [Int]
getIntList maxint length = sequence (replicate length (getRandomInt maxint))

getIntList' :: IO [Int]
getIntList' = getIntList 10 10

{-|
	Exercise 4
	Time taken 2 hrs
-}
isPermutation :: Eq a => [a] -> [a] -> Bool
isPermutation [] [] = True
isPermutation xs ys | (length xs /= length ys) = error $ "Lists are not of equal length: " ++ (show (length xs) ++ " and " ++ show (length ys))
					| otherwise = isPermutation' xs ys

isPermutation' :: Eq a => [a] -> [a] -> Bool
isPermutation' (x:xs) ys | null xs = True
						 | otherwise = any (x==) ys && isPermutation' xs ys

{-|
	Exercise 7
-}
-- Not sure how to approach this


