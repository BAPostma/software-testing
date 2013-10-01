module Lab5
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

-- Duration: 40 minutes



-- 2. Another approach to merge sort is to start by splitting the list to be sorted in equal
-- parts, recursively sort the parts, next merge.
-- Implement this, using the following split function.

split :: [a] -> ([a],[a])
split xs = let
     n = (length xs) `div` 2
    in
     (take n xs, drop n xs)

-- Next, find a suitable assertion, and write an assertive version.
-- Deliverables: Haskell program, assertion, assertive version of Haskell program that
-- uses this assertion, indication of time spent.

splitSrt :: Ord a => [a] -> [a]
splitSrt [] = []
splitSrt [x] = [x]
splitSrt xs = let 
     (ys,zs) = split xs
    in
     merge (splitSrt ys) (splitSrt zs)

-- Assertions:
-- Precondition(s): None
-- Postcondition(s): Every element in the list is smaller than the next element in the list. In other
-- words the output list is sorted.

splitSrtA :: Ord a => [a] -> [a]
splitSrtA = assert1 (\_ ys -> sorted ys) splitSrt

-- Duration:   30 minutes

-- 3. The goal of this exercise is to extend the sudoku program from the course notes
-- with functions that can also handle sudokus of a special kind: the sudokus that
-- appear in NRC-Handelsblad each week (designed by Peter Ritmeester, from Oct
-- 8, 2005 onward). These NRC sudokus are special in that they have to satisfy a
-- few extra constraints: in addition to the usual sudoku constraints, each of the
-- 3 x 3 subgrids with left-top corner (2,2), (2,6), (6,2), and (6,6) should also yield a
-- surjective function.
-- Your task is to formalize this extra constraint, and to use your formalization in a
-- program that can solve this sudoku.
-- Deliverables: formal statement of new constraint, modified Haskell program, sudoku
-- solution for the above NRC-Handelsblad sudoku, indication of time spent.

-- The solutions can be find in the file 'NRCSudokuSolver.hs'.

-- Duration: 90 minutes.

-- 4. The course notes of this week contain a sudoku solver. A sudoku generator written
-- in Haskell is available on the course web page, as RandomSudoku.hs. Use your
-- program from the previous exercise and this program to create a program that
-- generates NRC-Handelsblad sudoku problems.
-- Deliverables: NRC-Handelsblad sudoku generator, indication of time spent.

-- The exercise can easily be solved by taking the file 'RandomSudoku.hs' and import the file from exercise 3 instead of the
-- code file from week5. So changed 'import Week5' into 'import RandomSudoku.hs'. Now you can generate NRC Sudoku puzzles by 
-- loading the file 'RandomSudoku.hs' and calling the function 'genNewNRCSudoku'. If you won't to see te solution and the problem 
-- at once then you can run 'main'.

-- Duration: 45 minutes.

-- 5. Test your programs from the previous two exercises, and document the test process. One important property to test is whether 
-- the generated sudoku problems are minimal. How can you test this?
-- Deliverables: testing code, test report, indication of time spent.

-- Duration: ...











