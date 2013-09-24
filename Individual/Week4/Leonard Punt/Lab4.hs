module Lab4 where

import SetOrd
import Lab3
import Data.List

-- Exercise 2 - Time spent: 45 minutes
genIntSet :: IO (Set Int)
genIntSet = do
  xs <- genIntList
  return (list2set xs)

-- Exercise 3 - Time spent: 4 hours (1 hour implementation, 3 hours writing tests)
-- see Exercise3.txt for test report
-- properties and test functions are defined below
intersectSet :: Ord a => Set a -> Set a -> Set a
intersectSet (Set xs) (Set ys) = list2set (intersect xs ys)

unionSet1 :: Ord a => Set a -> Set a -> Set a
unionSet1 (Set xs) (Set ys) = list2set (union xs ys)

differenceSet :: Ord a => Set a -> Set a -> Set a
differenceSet (Set xs) (Set ys) = list2set (xs \\ ys)

-- properties
-- - any test set
anySet :: (Num a, Ord a) => Set a
anySet = list2set [1,2,3]

-- - intersect with empty set should return empty input set
intersectProp1 :: Ord a => Set a -> Bool
intersectProp1 s = intersectSet s emptySet == emptySet
-- - idempotence
intersectProp2 :: Ord a => Set a -> Bool
intersectProp2 s = intersectSet s s == s
-- - commutativity
intersectProp3 :: (Num a, Ord a) => Set a -> Bool
intersectProp3 s = intersectSet s anySet == intersectSet anySet s

-- - union with empty set should return set
unionProp1 :: Ord a => Set a -> Bool
unionProp1 s = unionSet1 s emptySet == s
-- - idempotence
unionProp2 :: Ord a => Set a -> Bool
unionProp2 s = unionSet1 s s == s
-- - commutativity
unionProp3 :: (Num a, Ord a) => Set a -> Bool
unionProp3 s = unionSet s anySet == unionSet anySet s

-- - difference with empty set should return input set
diffProp1 :: Ord a => Set a -> Bool
diffProp1 s = differenceSet s emptySet == s
-- - difference between 2 same sets should be empty set
diffProp2 :: Ord a => Set a -> Bool
diffProp2 s = differenceSet s s == emptySet

-- test functions
genIntSets :: Int -> IO [(Set Int)]
genIntSets n = sequence (replicate n (genIntSet))

tests :: Int -> ((Set Int) -> Bool) -> IO ()
tests n prop = do
  xs <- genIntSets n
  test prop xs

test :: ((Set Int) -> Bool) -> [(Set Int)] -> IO ()
test prop [] = print ("tests passed")
test prop (x:xs) =
  if prop x
  then do print ("pass on: " ++ show x)
          test prop xs
  else error ("failed test on: " ++ show x)
