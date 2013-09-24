module Lab4

where

import Data.List
import SetOrd
import Week3
import Week4

{-|
	Exercise 2
	Time taken: 1hr because of trouble with IO again... :)
-}
randomSet :: IO (Set Int)
randomSet = do
			intl <- getIntList'
			return (list2set intl)
			
{-|
	Exercise 3
	Time taken: approx. 45 mins
-}
-- 3.1
intersection :: Eq a => (Set a) -> (Set a) -> (Set a)
intersection (Set s1) (Set s2) = Set (intersect s1 s2)

-- 3.2
union' :: Eq a => (Set a) -> (Set a) -> (Set a)
union' (Set s1) (Set s2) = Set (Data.List.union s1 s2)

-- 3.3
diff :: Eq a => (Set a) -> (Set a) -> (Set a)
diff (Set s1) (Set s2) = union' (Set (s1 \\ s2)) (Set (s2 \\ s1))

{-|
	Exercise 3 - TESTS
	Time taken: 2 hrs
-}
-- 3.4.1 Testing of intersection and union' at once.
-- Every run of this function should return a set containing element 100
testIntersection :: IO (Set Int)
testIntersection = do
				   testSet1 <- randomSet
				   testSet2 <- randomSet
				   let testControlSet1 = union' testSet1 (Set [99,100,101])
				   let testControlSet2 = union' testSet2 (Set [100])
				   let testSetUnions = (intersection testControlSet1 testControlSet2)
				   return testSetUnions

--- 3.4.2 Testing of difference between sets
--- Every run of this function should return a set that does not contain an 
--- element of 100 but there should be an element 99 and 101
testDifference :: IO (Set Int)
testDifference = do
				 testSet1 <- randomSet
				 testSet2 <- randomSet
				 let testControlSet1 = union' testSet1 (Set [99,100,101])
				 let testControlSet2 = union' testSet2 (Set [100])
				 let testSetDifference = (diff testControlSet1 testControlSet2)
				 return testSetDifference


{-|
	Exercise 4
	Time taken: 3 hrs
-}

--- Given code
testRelation = [(1,2),(2,3),(3,4)]

type Rel a = [(a,a)]

infixr 5 @@
(@@) :: Eq a => Rel a -> Rel a -> Rel a
r @@ s = nub [ (x,z) | (x,y) <- r,
					   (w,z) <- s,
					   y == w ]

--- Written code (as lambda)
trClos :: Ord a => Rel a -> Rel a
trClos x = lfp (\ x -> nub (x ++ (x @@ x))) x




