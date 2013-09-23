module Lab4

where

import Data.List
import SetOrd
import Week3

{-|
	Exercise 2
	Duration: 1hr because of trouble with IO again... :)
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

