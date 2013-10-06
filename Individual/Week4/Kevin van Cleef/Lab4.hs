-- Lab Week 4
module Lab4

where 

import Week4
import SetOrd
import Data.List
import System.Random

-- 2. Implement a random data generator for the datatype Set Int, where
-- Set is as defined in http://homepages.cwi.nl/~jve/rcrh/SetOrd.hs.
-- (Deliverables: Haskell program, indication of time spent.)

-- Duration: 30 minutes.

-- Code from Lab3 for generating a list with random integers.
getRandomInt :: Int -> IO Int
getRandomInt n = getStdRandom (randomR (0,n))

int_list_length = 10
int_list_max_int = 10
genIntList :: IO [Int]
genIntList = sequence (replicate int_list_length (getRandomInt int_list_max_int))

getRandomIntSet :: IO (Set Int)
getRandomIntSet = do 
    xs <- genIntList
    return (list2set xs)

-- 3. Implement operations for set intersection, set union and set difference,
-- for the datatype Set defined in http://homepages.cwi.nl/~jve/rcrh/
-- SetOrd.hs. Next, use automated random testing to check that your
-- implementation is correct.
-- Note: you may have to change import List to import Data.List in
-- the module SetOrd.
-- (Deliverables: Haskell program, test code, short test report, indication of time spent.)

-- Duration: 45 minutes.

-- Intersection
getSetIntersection :: Ord a => Set a -> Set a -> Set a
getSetIntersection (Set xs) (Set ys) = list2set (intersect xs ys)

-- Union
getSetUnion :: Ord a => Set a -> Set a -> Set a
getSetUnion (Set xs) (Set ys) = list2set (union xs ys)

-- Difference 
getSetDifference :: Ord a => Set a -> Set a -> Set a
getSetDifference (Set xs) (Set ys) = list2set ((\\) xs ys)


-- Test set functions
testSetOperation :: IO ()
testSetOperation = do
  set1 <- getRandomIntSet
  set2 <- getRandomIntSet
  let ints = (getSetIntersection set1 set2)
      uni = (getSetUnion set1 set2)
      differ = (getSetDifference set1 set2)
      in
        print ("Set 1: " ++ show(set1) ++ " Set 2: " ++ show(set2) ++ " Intersection: " ++ show(ints) ++ " Union: " ++ show(uni) ++ " Difference: " ++ show(differ))

-- Test function for set operations
testSetOperations :: Int -> IO ()
testSetOperations 0 = print ("Done testing")
testSetOperations n = do testSetOperation
                         testSetOperations (n-1)


-- 4. Suppose we implement binary relations as list of pairs, Haskell type [(a,a)].
-- Assume the following definitions:

-- Duration: 90 minutes

type Rel a = [(a,a)]

infixr 5 @@

(@@) :: Eq a => Rel a -> Rel a -> Rel a
r @@ s = nub [ (x,z) |  (x,y) <- r, 
                        (w,z) <- s, 
                        y == w ]

-- Use this to implement a function
trClos :: Ord a => Rel a -> Rel a
trClos r = lfp trClos' r

trClos' :: Ord a => Rel a -> Rel a
trClos' r = sort (nub (r ++ (r @@ r)))

-- Alternative implementation of trClos
trClosAlternative :: Ord a => Rel a -> Rel a
trClosAlternative [] = []
trClosAlternative r | uhm == r = sort r
                    | otherwise = trClosAlternative uhm
                    where uhm = nub (r ++ (r @@ r))

-- 5. Test the function trClos from the previous exercise. Devise your own
-- test method for this. Try to use random test generation. Define reasonable properties to test.
-- (Deliverables: test code, short test report, indication of time spent.)

genRel :: IO (Rel Int)
genRel = do
  xs <- genIntList 
  ys <- genIntList
  return (zip xs ys)


trClos2 :: IO (Rel Int) -> Rel a
trClos2 xs = do 
  return (trClos xs)













