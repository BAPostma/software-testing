module Week3

where

import Data.List
import Data.Char
import System.Random

-- given code
getRandomInt :: Int -> IO Int
getRandomInt n = getStdRandom (randomR (0,n))

-- written code
getIntList :: Int -> Int -> IO [Int]
getIntList maxint length = sequence (replicate length (getRandomInt maxint))

getIntList' :: IO [Int]
getIntList' = getIntList 10 10