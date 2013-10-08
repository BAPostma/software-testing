module Lab6

where
import Data.List
import System.Random
import Week6

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
