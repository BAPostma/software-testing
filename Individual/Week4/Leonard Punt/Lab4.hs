module Lab4 where

import SetOrd
import Lab3

-- Exercise 2
genIntSet :: IO (Set Int)
genIntSet = do
  xs <- genIntList
  return (list2set xs)
