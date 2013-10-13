module Lab6

where
import Data.List
import System.Random
import Week6
import Control.Monad

carmichael :: [Integer]
carmichael = [ (6*k+1)*(12*k+1)*(18*k+1) | 
      k <- [2..], 
      isPrime (6*k+1), 
      isPrime (12*k+1), 
      isPrime (18*k+1) ]

-- Exercise 1: is already given in Week6.hs

-- Exercise 2:
{-
 For realistic tests we compute if a number is prime by Fermat's Test

 Fermat's Test tests if n is prime
 - we pick an a with 1 < a < n
 - we comput exM a (n-1) n (and same for expM)

 Test 1: a = 4, n = m2
  expM 4 (m2-1) m2
  1
  (0.00 secs, 1580936 bytes)
  exM 4 (m2-1) m2
  1
  (0.00 secs, 1583136 bytes)

 Test 2: a = 123456, n = m6
  expM 123456 (m6-1) m6
  1
  (0.06 secs, 14780448 bytes)
  exM 123456 (m6-1) m6
  1
  (0.00 secs, 1584048 bytes)

 - Test 3: a = 123456, n = m8
  expM 123456 (m8-1) m8 
  (ran more than 10 minutes)
  exM 123456 (m8-1) m8
  1
  (0.00 secs, 1029544 bytes)
-}

-- Exercise 3:
composites :: [Integer]
composites = differenceSorted [2..] primes

-- precondition: both lists are sorted
-- postcondition: the difference between the two lists
differenceSorted :: [Integer] -> [Integer] -> [Integer]
differenceSorted (x:xs) (y:ys) | x < y = x : differenceSorted xs (y:ys)
                               | otherwise = differenceSorted xs ys

-- this function is implemented according the hints in the assignment, but the function above is much faster
composites1 :: [Integer]
composites1 = [x | (x,False) <- sieveComposites [(i,True) | i <- [2..]]]

sieveComposites :: [(Integer,Bool)] -> [(Integer,Bool)]
sieveComposites ((i,False):ibs) = (i,False) : sieveComposites ibs
sieveComposites ((i,True):ibs) = (i,True) : sieveComposites (map (\ (n,b) -> (n, b && rem n i /= 0)) ibs)

-- Exercise 4:
-- 'k' is the number of times the Fermat prime check is conducted, so increasing k results in a more reliable check
-- The least numbers that fool the check are:
-- - testF 1 composites -> 4
-- - testF 2 composites -> 21
-- - testF 3 composites -> 85
-- - testF 4 composites -> 481
-- - testF 5 composites -> 561
-- - testF 10 composites -> 1105
-- - testF 15 composites -> 46657
-- - testF 20 composites -> no number that fooled the check was found after running for 5 minutes

-- takes an Int which indicates how many times the Fermat prime check is conducted and a list of composites
testF :: Int -> [Integer] -> IO ()
testF k (p:ps) = do
  r <- primeF k p
  when (r) $ print("Composite number: " ++ show p ++ ", Fermat's check: " ++ show r)
  testF k ps

-- Exercise 5:
-- Results of testing:
-- - testF 1 carmichael -> seems to return all CarMicheal numbers
-- - testF 2 carmichael -> seems to return all CarMicheal numbers
-- - testF 5 carmichael -> does not return the first CarMicheal number (294409) as a number that fools Fermat's little theory
-- So if 'k' gets higher, not all CarMicheal numbers are returned as numbers that fool Fermat's little theory. This is because
-- Fermat's little theory states that prime numbers have the property a^p = a (mod p). CarMicheal numbers have the property
-- a^p = a (mod p) too, however 'a' and 'p' have to be relatively prime (i.e. gcd has to be 1). So if we find an 'a' that is
-- not relatively prime with 'p', is does not pass Fermat's prime check. The higher 'k' gets, the higher the probability we
-- find such an 'a'.
