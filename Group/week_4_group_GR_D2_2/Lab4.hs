module Lab4 where

import SetOrd
import Lab3
import Data.List
import Week3
import Week4

{-|
	Exercise 2
-}
randomSet :: IO (Set Int)
randomSet = do
			intl <- genIntList
			return (list2set intl)
			
{-|
	Exercise 3
-}
-- 3.1
intersectSet :: Ord a => Set a -> Set a -> Set a
intersectSet (Set xs) (Set ys) = list2set (intersect xs ys)

-- 3.2
unionSet1 :: Ord a => Set a -> Set a -> Set a
unionSet1 (Set xs) (Set ys) = list2set (union xs ys)

-- 3.3
differenceSet :: Ord a => Set a -> Set a -> Set a
differenceSet (Set xs) (Set ys) = list2set (xs \\ ys)

--- Properties
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
genIntSets :: Int -> IO [Set Int]
genIntSets n = sequence (replicate n randomSet)

tests :: Int -> (Set Int -> Bool) -> IO ()
tests n prop = do
  xs <- genIntSets n
  test prop xs

test :: (Set Int -> Bool) -> [Set Int] -> IO ()
test prop [] = print "tests passed"
test prop (x:xs) =
  if prop x
  then do print ("pass on: " ++ show x)
          test prop xs
  else error ("failed test on: " ++ show x)


{-|
	Exercise 4
-}
-- Given code
testRelation = [(1,2),(2,3),(3,4)]

type Rel a = [(a,a)]

infixr 5 @@
(@@) :: Eq a => Rel a -> Rel a -> Rel a
r @@ s = nub [ (x,z) | (x,y) <- r,
					   (w,z) <- s,
					   y == w ]

-- Written code (as lambda)
trClos :: Ord a => Rel a -> Rel a
trClos x = lfp (\ x -> nub (x ++ (x @@ x))) x

-- Alternative implementation of trClos
trClosAlternative :: Ord a => Rel a -> Rel a
trClosAlternative [] = []
trClosAlternative r | uhm == r = r
                    | otherwise = trClosAlternative uhm
                    where uhm = nub (r ++ (r @@ r))
					
{-|
	Exercise 5
-}
-- Properties
-- A relation R is transitive if R^2 is subset of R
transitiveProp1 :: Ord a => Rel a -> Bool
transitiveProp1 r = containsSubSet r (r @@ r)

containsSubSet :: Eq a => Rel a -> Rel a -> Bool
containsSubSet r = all (\ x -> elem x r)

-- Test functions
genRel :: IO (Rel Int)
genRel = do
  xs <- genIntList
  ys <- genIntList
  return (zip xs ys)

genRels :: Int -> IO [Rel Int]
genRels n = sequence (replicate n genRel)

testTrClosses :: Int -> (Rel Int -> Bool) -> IO ()
testTrClosses n prop = do
  rs <- genRels n
  testTrClos prop rs

testTrClos :: (Rel Int -> Bool) -> [Rel Int] -> IO ()
testTrClos prop [] = print "tests passed"
testTrClos prop (x:xs) =
  if prop x'
  then do print ("pass on: " ++ show x')
          testTrClos prop xs
  else error ("failed test on: " ++ show x')
  where x' = trClos x
