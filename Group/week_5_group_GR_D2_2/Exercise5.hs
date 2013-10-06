module Exercise5

where

import Exercise3
import Exercise4
import Week5 (pre1,post1,assert1)

-- 5. Test your programs from the previous two exercises, and document the test process. One important property to test is whether 
-- the generated sudoku problems are minimal. How can you test this?
-- Deliverables: testing code, test report, indication of time spent.

-- Duration: 360 minutes

-- Test report:
-- First we wrote the method 'solve' which takes a sudoku problem and returns the possible solutions. Then we wrote a precondition, postcondition and assertion wrapper for that function.
-- Precondition wrapper (solvePre): checks if the grid is a Nrc sudoku problem and if it is a minimal Nrc sudoku problem.
-- Postcondition wrapper (solvePost): checks if the solutions are solved sudokus, satisfying the Nrc sudoku constraints.
-- Assertion wrapper (solveA): verifies that if the input is a minimal Nrc sudoku problem, the output is/are solution(s) to the problem satisfying the Nrc sudoku constraints.

-- Finally we wrote a method testSolve, which generates a random sudoku problem and solves it, and also checks the pre- and postconditions with help of the assertion wrapper.

-- testSolve
-- isMinimalNrcSudoku nrc_exercise3_lab5_example
-- isMinimal nrc_exercise3_lab5_example

testSolve = do [r] <- rsolveNs [emptyN]
               showNode r
               s  <- genProblem r
               showNode s
               solveAShowSudokus s

solveAShowSudokus :: Node -> IO[()]
solveAShowSudokus n = sequence $ fmap showSudoku (solveA g)
                  where
                    g = sud2grid (fst n)               

-- Solves an Nrc sudoku
solve :: Grid -> [Sudoku]
solve g = map fst (solveNs (initNode g))

-- Pre: is minimal Nrc sudoku problem, i.e. partial sudoku matrix
solvePre :: Grid -> [Sudoku]
solvePre = pre1 isMinimalNrcSudoku solve

-- Post: solution to a Nrc sudoku problem, i.e. a complete extension of the problem, satisfying the Nrc sudoku constraints
solvePost :: Grid -> [Sudoku]
solvePost = post1 (all isSolvedNrcSudoku) solve

-- Assert: if the input is a minimal Nrc sudoku problem, then the output is/are solution(s) to the problem satisfying the Nrc sudoku constraints
solveA :: Grid -> [Sudoku]
solveA = assert1 (\ g ss -> isMinimalNrcSudoku g && all isSolvedNrcSudoku ss) solve

-- Checks if a grid is a minimal Nrc sudoku problem (which can take a while)
isMinimalNrcSudoku :: Grid -> Bool
isMinimalNrcSudoku g = consistent (grid2sud g) && isMinimal g 

-- Checks if a grid is minimal sudoku problem (which can take a while)
isMinimal :: Grid -> Bool
isMinimal g = g == minGrid
          where 
          	n = head (initNode g)
          	s = fst n
          	minNode = minimalize n [(x,y) | x <- [1..9], y <- [1..9], s (x,y) /= 0]
          	minGrid = sud2grid (fst minNode)

-- Checks if a sudoku is a solved and is satisfying the Nrc sudoku constraints
isSolvedNrcSudoku :: Sudoku -> Bool
isSolvedNrcSudoku s = consistent s && solved (head (initNode (sud2grid s)))