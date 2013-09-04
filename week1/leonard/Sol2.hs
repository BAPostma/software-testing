module Sol2 where

import GS
import TAMO

-- - Exercise 2.2
-- P Q | exclusive or 
-- t t | f
-- t f | t
-- f t | t
-- f f | f

-- - Exercise 2.4
-- Yes, the truth table is the same
-- Yes, if 'not (P <=> Q)' is the same as the 'exclusive or' and the implemenatation 'x <=> y' = 'x == y',  then the implementation of 'x <+> y' = 'x /= y'

-- - Exercise 2.9
-- (P <+> Q) <+> Q
--  t  f  t   t  t
--  t  t  f   t  f
--  f  t  t   f  t
--  f  f  f   f  f
-- The column P and the column of the second <+> are indeed equivalent

-- - Exercise 2.11
-- 1.
-- P | not not P
-- t | t   f   t
-- t | t   f   t
-- f | f   t   f
-- f | f   t   f
-- Columns 1 and 2 are indeed equivalent

-- 2.
-- P || P | P
-- t t  t | t
-- f f  f | f
-- Columns 2 and 4 are indeed equivalent

-- P && P | P
-- t t  t | t
-- f f  f | f
-- Columns 2 and 4 are indeed equivalent

-- 3.
-- (P ==> Q) | not P || Q
--  t t   t  | f   t t  t
--  t f   f  | f   t f  f
--  f t   t  | t   f t  t
--  f t   f  | t   f t  f
-- Columns 2 and 6 are indeed equivalent

-- not (P ==> Q) | P && not Q
-- f    t t   t  | t f  f   t
-- t    t f   f  | t t  t   f
-- f    f t   t  | f f  f   t
-- f    f t   f  | f f  t   f
-- Columns 1 and 6 are indeed equivalent

-- 4.
-- (not P ==> not Q) | (Q ==> P)
--  f   t t   f   t  |  t t   t
--  f   t t   t   f  |  f t   t
--  t   f f   f   t  |  t f   f
--  t   f t   t   f  |  f t   f
-- Columns 3 and 7 are indeed equivalent

-- (P ==> not Q) | (Q ==> not P)
--  t f   f   t  |  t f   f   t
--  t t   t   f  |  f t   f   t
--  f t   f   t  |  t t   t   f
--  f t   t   f  |  f t   t   f
-- Columns 2 and 6 are indeed equivalent

-- (not P ==> Q) | (not Q ==> P)
--  f   t t   t  |  f   t t   t
--  f   t t   f  |  t   f t   t
--  t   f t   t  |  f   t t   f
--  t   f f   f  |  t   f f   f
-- Columns 3 and 7 are indeed equivalent

-- 5.
-- (P <=> Q) | ((P ==> Q) && (Q ==> P)) | ((P && Q) || (not P && not Q))
--  t t   t  |   t t   t  t   t t   t   |   t t  t  t   f   t f  f   t
--  t f   f  |   t f   f  f   f t   t   |   t f  f  f   f   t f  t   f
--  f f   t  |   f t   t  f   t f   f   |   f f  t  f   t   f f  f   t
--  f t   f  |   f t   f  t   f t   f   |   f f  f  t   t   f t  t   f
-- Columns 2, 7 and 14 are indeed equivalent

-- 6.
-- P && Q | Q && P
-- t t  t | t t  t
-- t f  f | f f  t
-- f f  t | t f  f
-- f f  f | f f  f
-- Columns 2 and 5 are indeed equivalent

-- P || Q | Q || P
-- t t  t | t t  t
-- t t  f | f t  t
-- f t  t | t t  f
-- f f  f | f f  f
-- Columns 2 and 4 are indeed equivalent

-- 7.
-- See example 2.6

-- 8.
-- P && (Q && R) | (P && Q) && R
-- t t   t t  t  |  t t  t  t  t
-- t f   t f  f  |  t t  t  f  f
-- t f   f f  t  |  t f  f  f  t
-- t f   f f  f  |  t f  f  f  f
-- f f   t t  t  |  f f  t  f  t
-- f f   t f  f  |  f f  t  f  f
-- f f   f f  t  |  f f  f  f  t
-- f f   f f  f  |  f f  f  f  f
-- Columns 2 and 9 are indeed equivalent

-- P || (Q || R) | (P || Q) || R
-- t t   t t  t  |  t t  t  t  t
-- t t   t t  f  |  t t  t  t  f
-- t t   f t  t  |  t t  f  t  t
-- t t   f f  f  |  t t  f  t  f
-- f t   t t  t  |  f t  t  t  t
-- f t   t t  f  |  f t  t  t  f
-- f t   f t  t  |  f f  f  t  t
-- f f   f f  f  |  f f  f  f  f
-- Columns 2 and 9 are indeed equivalent

-- 9.
-- P && (Q || R) | (P && Q) || (P && R)
-- t t   t t  t  |  t t  t  t   t t  t
-- t t   t t  f  |  t t  t  t   t f  f
-- t t   f t  t  |  t f  f  t   t t  t
-- t f   f f  f  |  t f  f  f   t f  f
-- f f   t t  t  |  f f  t  f   f f  t
-- f f   t t  f  |  f f  t  f   f f  f
-- f f   f t  t  |  f f  f  f   f f  t
-- f f   f f  f  |  f f  f  f   f f  f
-- Columns 2 and 9 are indeed equivalent

-- P || (Q && P) | (P || Q) && (P || R)
-- t t   t t  t  |  t t  t  t   t t  t
-- t t   t f  f  |  t t  t  t   t t  f
-- t t   f f  t  |  t t  f  t   t t  t
-- t t   f f  f  |  t t  f  t   t t  f
-- f t   t t  t  |  f t  t  t   f t  t
-- f f   t f  f  |  f t  t  f   f f  f
-- f f   f f  t  |  f f  f  f   f t  t
-- f f   f f  f  |  f f  f  f   f f  f
-- Columns 2 and 9 are indeed equivalent

-- - Exercise 2.13
tst1a = not True <=> False
tst1b = not False <=> True
tst2 = logEquiv1 (==> False) not
tst3a = logEquiv1 (|| True) (const True)
tst3b = logEquiv1 (&& False) (const False)
tst4a = logEquiv1 (|| False) id
tst4b = logEquiv1 (&& True) id
tst5 = logEquiv1 (\ p -> p || not p) (const True)
tst6 = logEquiv1 (\ p -> p && not p) (const False)

-- - Exercise 2.15
contradiction1 bf = not (bf True) && not (bf False)
contradiction2 bf = not (or [ bf p q | p <- [True, False],
                                       q <- [True, False]])
contradiction3 bf = not (or [ bf p q r | p <- [True, False],
                                         q <- [True, False],
                                         r <- [True, False]])

-- - Exercise 2.16
-- 1. The equation x2 + 1 = 0 has no solution.
-- 2. A largest natural number does exist.
-- 3. The number 13 is not prime (use d|n for 'd divides n').
-- 4. The number n is not prime.
-- 5. There aren't infinitely many primes.

-- - Exercise 2.17
-- statement: x < y < z
--        === x < y && y < z
-- negation : not (x < y && y < z)
--        === x >= y || y >= z

-- - Exercise 2.18
-- (P <=> Q) === (P ==> Q) && (Q ==> P)
--           === (not Q ==> not P) && (not P ==> not Q)
--           === (not P ==> not Q) && (not Q ==> not P)
--           === (not P <=> not Q)

-- (not P <=> Q) === (not P ==> Q) && (Q ==> not P)
--               === (not Q ==> not not P) && (not not P ==> not Q)
--               === (not Q ==> P) && (P ==> not Q)
--               === (P ==> not Q) && (not Q ==> P)
--               === (P <=> not Q)

-- - Exercise 2.19
-- P and Q are logically equivalent iff, no matter the truth values of P and Q, the truth values obtained are the same.
-- P <=> Q is logically valid iff the outcome will always be True, regardless of the truth values of P and Q.
-- So iff the outcome of P <=> Q will always be true then P and Q are logically equivalent, because the truth values obtained are the same (regardless the truth values of P and Q).

-- - Exercise 2.20
-- 1.
-- not P ==> Q | P ==> not Q
-- f   t t   t | t t   f   t
-- f   t t   f | t f   t   f
-- t   f t   t | f t   f   t
-- t   f f   f | f t   t   f
-- Not equivalent (column 3 and 6)

-- 2.
-- not P ==> Q | Q ==> not P
-- f   t t   t | t t   f   t
-- f   t t   f | f t   f   t
-- t   f t   t | t f   t   f
-- t   f f   f | f t   t   f
-- Not equivalent (column 3 and 6)

-- 3. Equivalent, see Theorem 2.10 4c

-- 4.
-- P ==> (Q ==> R) | Q ==> (P ==> R)
-- t t    t t   t  | t t    t t   t
-- t f    t f   f  | t f    t f   f
-- t t    f t   t  | f t    t t   t
-- t t    f t   f  | f t    t f   f
-- f t    t t   t  | t t    f t   t
-- f t    t f   f  | t t    f t   f
-- f t    f t   t  | f t    f t   t
-- f t    f t   f  | f t    f t   f
-- Equivalent (column 2 and 7)

-- 5.
-- P ==> (Q ==> R) | (P ==> Q) ==> R
-- t t    t t   t  |  t t   t  t  t
-- t f    t f   f  |  t t   t  f  f
-- t t    f t   t  |  t f   f  t  t
-- t t    f t   f  |  t f   f  t  f
-- f t    t t   t  |  f t   t  t  t
-- f t    t f   f  |  f t   t  f  f
-- f t    f t   t  |  f t   f  t  t
-- f t    f t   f  |  f t   f  f  f
-- Not Equivalent (column 2 and 9)

-- 6.
-- (P ==> Q) ==> P | P
--  t t   t  t   t | t
--  t f   f  t   t | t
--  f t   t  f   f | f
--  f t   f  f   f | f
-- Equivalent (column 4 and 6)

-- 7.
-- P || Q ==> R | (P ==> R) && (Q ==> R)
-- t t  t t   t |  t t   t  t   t t   t
-- t t  t f   f |  t f   f  f   t f   f
-- t t  f t   t |  t t   t  t   f t   t
-- t t  f f   f |  t f   f  f   f t   f
-- f t  t t   t |  f t   t  t   t t   t
-- f t  t f   f |  f t   f  f   t f   f
-- f f  f t   t |  f t   t  t   f t   t
-- f f  f t   f |  f t   f  t   f t   f
-- Equivalent (column 4 and 9)

-- - Exercise 2.21
-- 1.
-- not (not (P && Q) && Q)

-- 2.
-- A 2 letter formula has a truth table of 4 rows. The value of row can either be True or False. So there are 2^4 = 16 truth tables altogether.

-- 3, 4, 5
-- Don't know

-- - Exercise 2.22
-- No. I can think of an irrational one, the mean of the 2 rational numbers.

-- - Exercise 2.23
-- 1.
-- all x ( A(x) ==> ( B(x) ==> C(x)))
--                     |
--                     |
--         A(x) ==> ( B(x) ==> C(x))
--          |              |
--          |              |
--         A(x)       B(x) ==> C(x)
--                      |        |
--                      |        |
--                     B(x)     C(x)

-- 2. some x ( A(x) && B(x))
--                 |
--                 |
--             A(x) && B(x)
--              |       |
--              |       |
--             A(x)    B(x)

-- 3. some x A(x) && some x B(x)
--                  |
--                  |
--           A(x) && some x B(x)
--            |            |
--            |		   |
--           A(x)    some x B(x)
--                           |
--                           |
--                          B(x)

-- - Exercise 2.26
-- 1.
-- some x, y element of Q (x < y)

-- 2.
-- all x element of R, some y element of R (x < y))

-- 3.
-- all x element of Z, some m, n element of N (x = m - n))

-- - Exercise 2.27
-- 1.
-- all x (x element of Q ==> some m, n (m element of Z && n element of Z && n is not equal to 0 && x = m/n))

-- 2.
-- all x (Fx ==> all y (Dy ==> (Oxy ==> Dxy)))

-- - Exercise 2.31
-- 1.
-- some x (x^2 + 1 = 0)

-- 2.
-- all x element of N, some y element of N (x < y)

-- 3.
-- all n element of N (0 < n && n < 13 && not (n|13))

-- 4.
-- all x element of N, some n element of N (0 < x && x < n ** not (x|n))

-- 5.
-- all x element of Primes, some y element of Primes (x < y)

-- - Exercise 2.32
-- 1.
-- all x L(x, d)

-- 2.
-- all x L(d, x)

-- 3.
-- some x (M(x) ==> M'(x))

-- 4.
-- some x (B(x) && not F(x))

-- - Exercise 2.33
-- 1. (B for Bark and B' for Bite
-- all x ((D(x) && B(x)) ==> not B'(x))

-- 2. (G for Glitters and G' for Gold)
-- all x (G(x) ==> not G'(x))

-- 3. (F for Friends and d For Diana)
-- all x, all y ((F(d, x) && F(x, y)) ==> F(d, y)

-- - Exercise 2.34
-- 1.
-- all x (not x == c ==> L(x, d))

-- 2.
-- all x (M(x) ==> some y, some z (W(y) && W(z) && not y = z && (A(x, y) || A(x, z)))

-- 3.
-- all x (M(x) ==> some y (W(y) ==> M(x, y)) && all z (W(z) ==> M(x, z)) && z = y)

-- - Exercise 2.35
-- 1.
-- some x (King(x) && all y (King(y) => y = x) && not Raging(x)

-- 2.
-- some x (King(x) && all y (King(y) => y = x) && all z (S(z, x) ==> L(z, x)))

