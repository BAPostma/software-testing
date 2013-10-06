module Exercise1
where

import Week5

-- 1. The function merge from the course notes can be used as follows, to create a function
-- for list sorting:

mergeSrt :: Ord a => [a] -> [a]
mergeSrt [] = []
mergeSrt (x:xs) = merge [x] (mergeSrt xs)

-- Find a suitable assertion, and write an assertive version of this.
-- Deliverables: Assertion, Haskell program that uses this assertion, indication of time
-- spent.

-- Assertions:
-- Precondition(s): None
-- Postcondition(s): Every element in the list is smaller than the next element in the list. In other
-- words the output list is sorted.

mergeSrtA :: Ord a => [a] -> [a]
mergeSrtA = assert1 (\_ ys -> sorted ys) mergeSrt

-- Duration: 60 minutes