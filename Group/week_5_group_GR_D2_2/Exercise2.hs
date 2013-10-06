module Exercise2
where

import Week5

-- 2. Another approach to merge sort is to start by splitting the list to be sorted in equal
-- parts, recursively sort the parts, next merge.
-- Implement this, using the following split function.

split :: [a] -> ([a],[a])
split xs = let
     n = (length xs) `div` 2
    in
     (take n xs, drop n xs)

mergeSplitSrt :: Ord a => [a] -> [a]
mergeSplitSrt [] = []
mergeSplitSrt [x] = [x]
mergeSplitSrt xs = let 
     (ys,zs) = split xs
    in
     merge (mergeSplitSrt ys) (mergeSplitSrt zs)

-- Next, find a suitable assertion, and write an assertive version.
-- Deliverables: Haskell program, assertion, assertive version of Haskell program that
-- uses this assertion, indication of time spent.

-- Assertions:
-- Precondition(s): None
-- Postcondition(s): Every element in the list is smaller than the next element in the list. In other
-- words the output list is sorted.

mergeSplitSrtA :: Ord a => [a] -> [a]
mergeSplitSrtA = assert1 (\_ ys -> sorted ys) mergeSplitSrt

-- Duration:   30 minutes