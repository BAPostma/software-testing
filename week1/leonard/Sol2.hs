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
-- The row P and the row of the second <+> are indeed equivalent

-- - Exercise 2.11
-- 1.
-- P | not not P
-- t | t   f   t
-- t | t   f   t
-- f | f   t   f
-- f | f   t   f
-- Rows 1 and 2 are indeed equivalent

-- 2.
-- P || P | P
-- t t  t | t
-- f f  f | f
-- Rows 2 and 4 are indeed equivalent

-- P && P | P
-- t t  t | t
-- f f  f | f
-- Rows 2 and 4 are indeed equivalent

-- 3.
-- (P ==> Q) | not P || Q
--  t t   t  | f   t t  t
--  t f   f  | f   t f  f
--  f t   t  | t   f t  t
--  f t   f  | t   f t  f
-- Rows 2 and 6 are indeed equivalent

-- not (P ==> Q) | P && not Q
-- f    t t   t  | t f  f   t
-- t    t f   f  | t t  t   f
-- f    f t   t  | f f  f   t
-- f    f t   f  | f f  t   f
-- Rows 1 and 6 are indeed equivalent

-- 4.
-- (not P ==> not Q) | (Q ==> P)
--  f   t t   f   t  |  t t   t
--  f   t t   t   f  |  f t   t
--  t   f f   f   t  |  t f   f
--  t   f t   t   f  |  f t   f
-- Rows 3 and 7 are indeed equivalent

-- (P ==> not Q) | (Q ==> not P)
--  t f   f   t  |  t f   f   t
--  t t   t   f  |  f t   f   t
--  f t   f   t  |  t t   t   f
--  f t   t   f  |  f t   t   f
-- Rows 2 and 6 are indeed equivalent

-- (not P ==> Q) | (not Q ==> P)
--  f   t t   t  |  f   t t   t
--  f   t t   f  |  t   f t   t
--  t   f t   t  |  f   t t   f
--  t   f f   f  |  t   f f   f
-- Rows 3 and 7 are indeed equivalent

-- 5.
-- (P <=> Q) | ((P ==> Q) && (Q ==> P)) | ((P && Q) || (not P && not Q))
--  t t   t  |   t t   t  t   t t   t   |   t t  t  t   f   t f  f   t
--  t f   f  |   t f   f  f   f t   t   |   t f  f  f   f   t f  t   f
--  f f   t  |   f t   t  f   t f   f   |   f f  t  f   t   f f  f   t
--  f t   f  |   f t   f  t   f t   f   |   f f  f  t   t   f t  t   f
-- Rows 2, 7 and 14 are indeed equivalent

-- 6.
-- P && Q | Q && P
-- t t  t | t t  t
-- t f  f | f f  t
-- f f  t | t f  f
-- f f  f | f f  f
-- Rows 2 and 5 are indeed equivalent

-- P || Q | Q || P
-- t t  t | t t  t
-- t t  f | f t  t
-- f t  t | t t  f
-- f f  f | f f  f
-- Rows 2 and 4 are indeed equivalent

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
-- Rows 2 and 9 are indeed equivalent

-- P || (Q || R) | (P || Q) || R
-- t t   t t  t  |  t t  t  t  t
-- t t   t t  f  |  t t  t  t  f
-- t t   f t  t  |  t t  f  t  t
-- t t   f f  f  |  t t  f  t  f
-- f t   t t  t  |  f t  t  t  t
-- f t   t t  f  |  f t  t  t  f
-- f t   f t  t  |  f f  f  t  t
-- f f   f f  f  |  f f  f  f  f
-- Rows 2 and 9 are indeed equivalent

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
-- Rows 2 and 9 are indeed equivalent

-- P || (Q && P) | (P || Q) && (P || R)
-- t t   t t  t  |  t t  t  t   t t  t
-- t t   t f  f  |  t t  t  t   t t  f
-- t t   f f  t  |  t t  f  t   t t  t
-- t t   f f  f  |  t t  f  t   t t  f
-- f t   t t  t  |  f t  t  t   f t  t
-- f f   t f  f  |  f t  t  f   f f  f
-- f f   f f  t  |  f f  f  f   f t  t
-- f f   f f  f  |  f f  f  f   f f  f
-- Rows 2 and 9 are indeed equivalent

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
