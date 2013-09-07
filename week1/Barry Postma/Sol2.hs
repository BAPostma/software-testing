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












