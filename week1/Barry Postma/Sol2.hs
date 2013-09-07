module Sol2 where

import GS
import TAMO
	
{-|
	Exercise 2.2
	
	P Q | P xor Q
	t t | 	f
	t f | 	t
	f t | 	t
	f f | 	f
	
-}

{-|
	Exercise 2.4
	
	not (True <=> True) = False
	not (True <=> False) = True
	not (False <=> True) = True
	not (False <=> False) = False
	
	The function <+> implies the commands above. In essence, for a
	given x, y it says (x not equals y). This is correct because
	True ne True = False
	True ne False = True
	False ne True = True
	False ne False = False (because False eq False = True)
-}

{-|
	Exercise 2.9
	
	(P xor Q) xor Q
	 t  f  t   t  t
	 t  t  f   t  f
	 f  t  t   f  t
	 f  f  f   f  f
	For every P the value under the second xor is equal to P.
-}

{-|
	Exercise 2.11
	-- 1
	P | ! ! P
	T | T F T
	F | F T F
	
	-- 2
	P ^ P | P		           P v P | P
	T	T |	T                  T   T | T
	F	F |	F                  F   F | F
	Every column's value is the same
	
	-- 3
	P => Q | !P v Q            !( P => Q ) | P ^ !Q
	T T  T | F  T T            F  T T  T	| T F F
	T F  F | F  F F            T  T F  F   | T T T
	F T  T | T  T T            F  F T  T   | F F F
	F T  F | T  T F            F  F T  F   | F F T
	Col 3 === Col 5            Col 1 === Col 6
	
	-- 4
	! P => ! Q | Q => P        P => ! Q | Q => ! P        ! P => Q | ! Q => P
	F T T  F T | T T  T        T F  F T | T F  F T        F T T  T | F T T  T
	F T T  T F | F T  T        T T  T F | F T  F T        F T T  F | T F T  T
	T F F  F T | T F  F        F T  F T | T T  T F        T F T  T | F T T  F
	T F T  T F | F T  F        F T  T F | F T  T F        T F F  F | T F F  F
	Col 2 === Col 7            Col 2 === Col 6            Col 3 === Col 7
	
	-- 5
	P <=> Q | (P => Q) ^ (Q => P)  |  (P ^ Q) v (!P ^ !Q)
	T  T  T |  T T  T  T  T T  T   |   T T T  T  F  F  F
	T  F  F |  T F  F  F  F T  T   |   T F F  F  F  F  T
	F  F  T |  F T  T  F  T F  F   |   F F T  F  T  F  F
	F  T  F |  F T  F  T  F T  F   |   F F F  T  T  T  T
	Col 2 === Col 7 == Col 14
	
	-- 6
	P ^ Q | Q ^ P              P v Q | Q v P
	T T T | T T T              T T T | T T T
	T F F | F F T              T T F | F T T
	F F T | T F F              F T T | T T F
	F F F | F F F              F F F | F F F
	Col 2 === Col 5            Col 2 === Col 5
	
	-- 7
	Already proven
	
	-- 8
	Ands bind equally strong therefore the parenthesis for precedence in evaluation
	do not add value when ^ and v are used.
	
	-- 9
	P ^ (Q v R) | (P ^ Q) v (P ^ R)     P v (Q ^ R) | (P v Q) ^ (P v R)
	T T  T T T  |  T T T  T  T T T      T T  T T T  |  T T T  T  T T T
	T T  T T F  |  T T T  T  T F F      T T  T F F  |  T T T  T  T T F
	T T  F T T  |  T F F  T  T T T      T T  F F T  |  T T F  T  T T T
	T F  F F F  |  T F F  F  T F F      T T  F F F  |  T T F  T  T T F
	F F  T T T  |  F F T  F  F F T      F T  T T T  |  F T T  T  F T T
	F F  T T F  |  F F T  F  T F F      F F  T F F  |  F T T  T  T T F
	F F  F T T  |  F F F  F  F F T      F F  F F T  |  F F F  F  F T T
	F F  F F F  |  F F F  F  F F F      F F  F F F  |  F F F  F  F F F
	Col 2 === Col 9                     Col 2 === Col 9 however, this 
	                                    doesn't go for row 7
-}

{-|
	Exercise 2.9
-}
test1a   = not True == False
test1b   = not False == True
test2  p = False <=> (not p)
test3a p = (p || True) <=> True
test3b p = (p && False)  <=> False
test4a p = (p || False) <=> p
test4b p = (p && True) <=> p
test5  p = (p || (not p)) <=> True
test6  p = (p && (not p)) <=> False

{-|
	Exercise 2.15
-}
contradiction fx = not (fx True)
-- no idea... :S

{-|
	Exercise 2.16
	
	1. The equation x2 + 1 = 0 does not have a solution.
	2. There exists a largest natural number.
	3. The number 13 is not prime.
	4. The number n is not a prime.
	5. There is a finite amount of primes.
-}

{-|
	Exercise 2.17
	x < y < z
	x > y ^ z < y
	z < y < x
-}

{-|
	Exercise 2.18
-}
showEqual1 x y = x == y && not x == not y
showEqual2 x y = not x == y && x == not y

{-|
	Exercise 2.19
-}
showEqualWhenValid x y = logEquiv1 (==> x) not == logEquiv1 (==> y) not

{-|
	Exercise 2.20
	1. Not equivalent
	2. Not equivalent
	3. Equivalent: contraposition
	4. Not equivalent
	5. Not equivalent
	6. Equivalent: idempotence & contraposition
	7. Not equivalent
-}











