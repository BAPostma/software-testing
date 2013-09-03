module Sol2Leonard where

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

-- - Exercise 2.10
-- 1.
-- P | not not P
-- t | t   f   t
-- t | t   f   t
-- f | f   t   f
-- f | f   t   f
-- Rows 1 and 2 are indeed equivalent
--
-- 2.
-- P || P | P
-- t t  t | t
-- f f  f | f
-- Rows 2 and 4 are indeed equivalent
--
-- P && P | P
-- t t  t | t
-- f f  f | f
-- Rows 2 and 4 are indeed equivalent
--
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
