module Exercise4 where 

import Data.List
import Exercise3
import System.Random

-- 4. The course notes of this week contain a sudoku solver. A sudoku generator written
-- in Haskell is available on the course web page, as RandomSudoku.hs. Use your
-- program from the previous exercise and this program to create a program that
-- generates NRC-Handelsblad sudoku problems.
-- Deliverables: NRC-Handelsblad sudoku generator, indication of time spent.

-- The exercise can easily be solved by taking the file 'RandomSudoku.hs' and import the file from exercise 3 instead of the
-- code file from week5. So changed 'import Week5' into 'import Exercise3'. Now you can generate NRC Sudoku puzzles by 
-- loading this file and calling the function 'main'. If you won't to see te solution and the problem 
-- at once then you can run 'genNewNRCSudoku'.

-- Duration: 45 minutes.

{---------------------------------------------------------

  Jan van Eijck, October 2010, modified October 2012

 --------------------------------------------------------}

-- Empty grid.
emptyN :: Node
emptyN = (\ _ -> 0,constraints (\ _ -> 0))

getRandomInt :: Int -> IO Int
getRandomInt n = getStdRandom (randomR (0,n))

-- pick a random member from a list
-- empty list indicates failure
getRandomItem :: [a] -> IO [a]
getRandomItem [] = return []
getRandomItem xs = 
  do n <- getRandomInt maxi
     return [xs !! n]
     where maxi = length xs - 1

-- randomize a list
randomize :: Eq a => [a] -> IO [a]
randomize xs = do y <- getRandomItem xs 
                  if null y 
                    then return []
                    else do ys <- randomize (xs\\y)
                            return (head y:ys)                     

sameLen :: Constraint -> Constraint -> Bool
sameLen (_,_,xs) (_,_,ys) = length xs == length ys

getRandomCnstr :: [Constraint] -> IO [Constraint]
getRandomCnstr cs = getRandomItem (f cs) 
  where f [] = []
        f (x:xs) = takeWhile (sameLen x) (x:xs)

rsuccNode :: Node -> IO [Node]
rsuccNode (s,cs) = do xs <- getRandomCnstr cs
                      if null xs 
                        then return []
                        else return (extendNode (s,cs\\xs) (head xs))

-- find a random solution for a member of 
rsolveNs :: [Node] -> IO [Node]
rsolveNs ns = rsearch rsuccNode solved (return ns)

rsearch :: (node -> IO [node]) 
            -> (node -> Bool) -> IO [node] -> IO [node]
rsearch succ goal ionodes = 
  do xs <- ionodes 
     if null xs 
       then return []
       else 
         if goal (head xs) 
           then return [head xs]
           else do ys <- rsearch succ goal (succ (head xs))
                   if (not . null) ys 
                      then return [head ys]
                      else if null (tail xs) then return []
                           else rsearch succ goal (return $ tail xs)
          
-- Generate random Sudoku.
genRandomSudoku :: IO Node
genRandomSudoku = do [r] <- rsolveNs [emptyN]
                     return r
-- Generate random Sudoku and print it on the screen.
randomS = genRandomSudoku >>= showNode

uniqueSol :: Node -> Bool
uniqueSol node = singleton (solveNs [node]) where 
  singleton [] = False
  singleton [x] = True
  singleton (x:y:zs) = False


-- erase a position from a Sudoku
eraseS :: Sudoku -> (Row,Column) -> Sudoku
eraseS s (r,c) (x,y) | (r,c) == (x,y) = 0
                     | otherwise      = s (x,y)

-- erase a position from a Node 
eraseN :: Node -> (Row,Column) -> Node
eraseN n (r,c) = (s, constraints s) 
  where s = eraseS (fst n) (r,c) 

-- return a "minimal" node with a unique solution
-- by erasing positions until the result becomes ambiguous
minimalize :: Node -> [(Row,Column)] -> Node
minimalize n [] = n
minimalize n ((r,c):rcs) | uniqueSol n' = minimalize n' rcs
                         | otherwise    = minimalize n  rcs
  where n' = eraseN n (r,c)

filledPositions :: Sudoku -> [(Row,Column)]
filledPositions s = [ (r,c) | r <- positions,  
                              c <- positions, s (r,c) /= 0 ]

genProblem :: Node -> IO Node
genProblem n = do ys <- randomize xs
                  return (minimalize n ys)
   where xs = filledPositions (fst n)

--main :: IO ()
main = do [r] <- rsolveNs [emptyN]
          showNode r
          s  <- genProblem r
          showNode s
          solveShowNs [s]

-- Generate a new NRC Sudoku puzzles without the solution.
genNewNRCSudoku = do [r] <- rsolveNs [emptyN]
                     s <- genProblem r
                     showNode s