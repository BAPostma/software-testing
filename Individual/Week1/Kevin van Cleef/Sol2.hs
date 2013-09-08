module Sol2 where
-- use hugs -98
import GS
import TAMO


-- Exercise 2.2
-- 	P		Q	|	P ⊻ Q
--	t 		t 	|	f
--	t 		f 	|	t
-- 	f 		t 	|	t
-- 	f 		f 	|	f

-- Exercise 2.4
-- a) 
-- Yes the truth tables are the same for P ⊻ Q and ¬(P ⟺ Q). See Answer 2.2 and the table below.
-- 	P		Q	|	¬(P ⟺ Q)
--	t 		t 	| 	f
--	t 		f 	| 	t
--	f 		t 	| 	t
--	f 		f 	| 	f

-- b) 
-- if (P ⟺ Q) can be implemented as x <=> y = x == y, then ¬ (P ⟺ Q), the opposite of (P ⟺ Q), can indeed be written as 
-- x <+> y = x /= y, where /= is the not equal to operator in haskell which is de opposite of the == operator.

-- Exercise 2.9
-- (	P 	⨁ 	Q	) 	⨁ 	Q
--		t 	f	t 		t	t
--		t 	t	f 		t	f
-- 		f 	t	t 		f	t 
-- 		f 	f	f 		f	f
-- The truth table for P and the second ⨁ are equal so (P ⨁ Q) ⨁ Q ≣ P .

-- Exercise 2.11
-- 1)
-- 	P 	≣ 	¬ 	¬ 	P
-- 	t 	t	t	f	t
-- 	f 	t	f	t	f
		
-- 2)
-- a)
-- 	P 	⋏	P	≣	P
--	t 	t	t 	t	t
-- 	f 	f 	f 	t	f	

-- b)
--	P	⋎	P 	≣ 	P
--	t 	t 	t 	t 	t
-- 	f 	f 	f 	t	f

-- 3)
-- a)
-- 	(	P	⟹	Q	) 	≣	¬ 	P 	∨	Q
--		t 	t	t 		t	f	t 	t	t
-- 		t 	f	f 		t	f	t 	f	f
--		f 	t	t 		t	t	f 	t	t
--		f 	t	f 		t	t	f 	t	f

-- b)
-- 	¬	(	P	⟹	Q	) 	≣ 	P 	∧	¬	Q
--	f		t 	t	t 		t	t 	f	f	t
--	t 		t 	f	f 		t	t 	t	t	f
--	f		f 	t	t 		t	f 	f	f	t
--	f		f 	t	f 		t	f 	f	t	f

-- 4)
-- a)
--	(	¬	P 	⟹	¬ 	Q 	) 	≣ 	( 	Q 	⟹ 	P 	)
--		f	t 	t	f	t 		t		t 	t	t	
--		f	t 	t	t	f 		t		f 	t	t
--		t	f 	f	f	t 		t		t 	f	f
--		t	f 	t	t	f  		t		f 	t	f	

-- b)
-- (	P 	⟹ 	¬ 	Q) 	≣ 	(	Q 	⟹ 	¬ 	P	)	
-- 		t 	f	f	t 	t		t 	f	f	t
-- 		t 	t	t	f 	t		f	t  	f	t
-- 		f 	t	f	t	t		t 	t	t	f
-- 		f 	t	t	f 	t		f 	t	t	f	

-- c)
-- 	( 	¬	P 	⟹ 	Q 	) 	≣ 	( 	¬ 	Q 	⟹ 	P	)	
-- 		f	t 	t	t 		t		f	t 	t	t
-- 		f	t 	t	f 		t		t	f 	t	t
-- 		t	f 	t	t	 	t		f	t 	t	f	
-- 		t	f 	f	f 		t		t	f 	f	f

-- 5)
-- 	( 	P 	⟺ 	Q 	) 	≣ 	( 	( 	P 	⟹ 	Q 	) 	∧ 	(	Q 	⟹ 	P 	) 	) 	≣ 	( 	( 	P 	∧ 	Q 	) 	∨ 	( 	¬ 	P 	∧ 	¬	Q	 )	 )	
--  	t 	t	t 		t			t 	t	t 		t		t 	t	t 			t			t 	t	t 		t		f	t 	f	f	t
--  	t 	f	f 		t			t 	f 	f 		f		f 	t	t 			t			t 	f	f 		f		f	t 	f	t	f
--  	f 	f	t 		t			f 	t 	t 		f		t 	f	f 			t			f 	f	t 		f		t	f 	f	f	t
--  	f 	t	f 		t			f 	t	f 		t		f 	t	f 			t			f 	f	f 		t		t	f 	t	t	f

-- 6)
-- a)
-- 	P 	^ 	Q 	≣ 	Q 	∧ 	P
-- 	t 	t	t 	t	t 	t	t
-- 	t 	f	f 	t	f 	f	t
-- 	f 	f	t 	t	t 	f	f
-- 	f 	f	f 	t	f 	f	f

-- b)
-- 	P 	∨ 	Q 	≣ 	Q 	∨ 	P
-- 	t 	t	t 	t	t 	t	t
-- 	t 	t	f 	t	f 	t	t
-- 	f 	t	t 	t	t 	t	f
-- 	f 	f	f 	t	f 	f	f

-- 7) 
-- a)
-- 	¬ 	( 	P 	∧ 	Q 	) 	≣ 	¬ 	P 	∨ 	¬ 	Q
-- 	f		t 	t	t 		t	f	t 	f	f	t
-- 	t		t 	f	f 		t	f	t 	t	t	f
-- 	t		f 	f	t 		t	t	f 	t	f	t
-- 	t		f 	f	f 		t	t	f 	t	t	f


-- b)
-- 	¬ 	( 	P 	∨ 	Q 	) 	≣ 	¬ 	P 	∧ 	¬ 	Q
-- 	f		t 	t	t 		t	f	t 	f	f	t
-- 	f		t 	t	f 		t	f	t 	f	t	f
-- 	f		f 	t	t 		t	t	f 	f	f	t
-- 	t		f 	f	f 		t	t	f 	t	t	f

-- 8)
-- a)
-- 	P 	∧ 	( 	Q 	∧ 	R 	) 	≣ 	( 	P 	∧ 	Q 	) 	∧ 	R 
--	t 	t		t 	t	t 		t		t 	t	t 		t	t
--	t 	f		t 	f	f 		t		t 	t	t 		f	f
--	t 	f		f 	f	t 		t		t 	f	f 		f	t
--	t 	f		f 	f	f 		t		t 	f	f 		f	f
--	f 	f		t 	t	t 		t		f 	f	t 		f	t
--	f 	f		t 	f	f 		t		f 	f	t 		f	f
--	f 	f		f 	f	t 		t		f 	f	f 		f	t
--	f 	f		f 	f	f 		t		f 	f	f 		f	f

-- b)
-- 	P 	∨ 	( 	Q 	∨ 	R 	) 	≣ 	( 	P 	∨ 	Q 	) 	∨ 	R 
--	t 	t		t 	t	t 		t		t 	t	t 		t	t
--	t 	t		t 	t	f 		t		t 	t	t 		t	f
--	t 	t		f 	t	t 		t		t 	t	f 		t	t
--	t 	t		f 	f	f 		t		t 	t	f 		t	f
--	f 	t		t 	t	t 		t		f 	t	t 		t	t
--	f 	t		t 	t	f 		t		f 	t	t 		t	f
--	f 	t		f 	t	t 		t		f 	f	f 		t	t
--	f 	f		f 	f	f 		t		f 	f	f 		f	f

-- 9)
-- a)
-- 	P 	∧ 	( 	Q 	∨ 	R 	) 	≣ 	( 	P 	∧  	Q 	) 	∨ 	( 	P 	∧ 	R 	) 	
-- 	t 	t		t 	t	t 		t		t 	t	t 		t		t 	t	t 	
-- 	t 	t		t 	t	f 		t		t 	t	t 		t		t 	f	f 	
-- 	t 	t		f 	t	t 		t		t 	f	f 		t		t 	t	t 	
-- 	t 	f		f 	f	f 		t		t 	f	f 		f		t 	f	f 	
-- 	f 	f		t 	t	t 		t		f 	f	t 		f		f 	f	t 	
-- 	f 	f		t 	t	f 		t		f 	f	t 		f		f 	f	f 	
-- 	f 	f		f 	t	t 		t		f 	f	f 		f		f 	f	t 	
-- 	f 	f		f 	f	f 		t		f 	f	f 		f		f 	f	f 	

-- b)
-- 	P 	∨ 	( 	Q 	∧ 	R 	) 	≣ 	( 	P 	∨  	Q 	) 	∧ 	( 	P 	∨ 	R 	) 	
-- 	t 	t		t 	t	t 		t		t 	t	t 		t		t 	t	t 	
-- 	t 	t		t 	f	f 		t		t 	t	t 		t		t 	t	f 	
-- 	t 	t		f 	f	t 		t		t 	t	f 		t		t 	t	t 	
-- 	t 	t		f 	f	f 		t		t 	t	f 		t		t 	t	f 	
-- 	f 	t		t 	t	t 		t		f 	t	t 		t		f 	t	t 	
-- 	f 	f		t 	f	f 		t		f 	t	t 		f		f 	f	f 	
-- 	f 	f		f 	f	t 		t		f 	f	f 		f		f 	t	t 	
-- 	f 	f		f 	f	f 		t		f 	f	f 		f		f 	f	f 

-- Exercise 2.13
exercise2_13p1a = not True <=> False
exercise2_13p1b = not False <=> True
exercise2_13p2 = logEquiv1 ( ==> False ) not
exercise2_13p3a = logEquiv1 ( || True ) 	( const True )
exercise2_13p3b = logEquiv1 ( && False ) ( const False )
exercise2_13p4a = logEquiv1 ( || False ) id
exercise2_13p4b = logEquiv1 ( && True ) id
exercise2_13p5 = logEquiv1 (\ p -> p || not p) ( const True )
exercise2_13p6 = logEquiv1 (\ p -> p && not p) ( const False )

--Exercise 2.15
exercise2_15a :: (Bool -> Bool) -> Bool
exercise2_15a bf = not (bf True) && not (bf False)

exercise2_15b :: (Bool -> Bool -> Bool) -> Bool
exercise2_15b bf = not (or [ bf p q | p <- [True,False], 
                             			q <- [True,False] ])

exercise2_15c :: (Bool -> Bool -> Bool -> Bool) -> Bool
exercise2_15c bf = not (or [ bf p q r | 	p <- [True,False], 
                             				q <- [True,False],
                             				r <- [True,False] ])

-- Exercise 2.16
-- 1.	The equation x^2 + 1 = 0 hasn't a solution.
-- 2. 	A largest natural number does exist.
-- 3. 	The number 13 is not a prime (use d|n for 'd divides n').
-- 4. 	The number n is not a prime.
-- 5.	There are not infinitely many primes.

-- Exercise 2.17
-- x > y > z

-- Exercise 2.18
-- 1) 	(Φ ⟺ Ψ) ≣	 (Φ ⟹ Ψ) ∧ (Ψ ⟹ Φ) ≣ 	(¬Φ ⟹ ¬Ψ) ∧ (¬Ψ ⟹ ¬Φ) ≣ 	(¬Φ ⟺ ¬Ψ)
-- 2) 	(¬Φ ⟺ Ψ) ≣		(¬Φ ⟹ Ψ) ∧ (Ψ ⟹ ¬Φ) ≣	 (¬Ψ ⟹ Φ) ^ (Φ ⟹ ¬Ψ) ≣   (Φ ⟺ ¬Ψ) 

-- Exercise 2.19
-- ??

-- Exercise 2.20
-- 1) Not equivalent. See column 5.
-- 	¬ 	P 	⟹ 	Q 	≣ 	P 	⟹ 	¬ 	Q
-- 	f	t 	t	t 	f	t 	f	f	t 
-- 	f	t 	f	f 	f	t 	t	t	f 
-- 	t	f 	t	t 	t	f 	t	f	t 
-- 	t	f 	t	f 	f	f 	t	t	f 		 

-- 2) Not equivalent. See column 5.
-- 	¬ 	P 	⟹ 	Q 	≣ 	Q 	⟹ 	¬ 	P
-- 	f	t 	t	t 	f	t 	f	f	t
-- 	f	t 	t	f 	t	f 	t	f	t
-- 	t	f 	t	t 	t	t 	t	t	f
-- 	t	f 	f	f 	t	f 	t	t	f

-- 3) Equivalent. See column 5 and Theorem 2.10 4c: Laws of contraposition.
-- 	¬ 	P 	⟹ 	Q 	≣ 	¬ 	Q 	⟹ 	P
-- 	f	t 	t	t 	t	f	t 	t	t
-- 	f	t 	t	f 	t	t	f 	t	t
-- 	t	f 	t	t 	t	f	t 	t	f
-- 	t	f 	f	f 	t	t	f 	f	f

-- 4) Equivalent. See column 6.
-- 	P 	⟹ 	( 	Q 	⟹ 	R 	) 	≣ 	Q 	⟹ 	( 	P 	⟹ 	R 	)
-- 	t 	t		t 	t	t 		t	t 	t		t 	t	t
-- 	t 	f		t 	f	f 		t	t 	f		t 	f	f
-- 	t 	t		f 	t	t 		t	f 	t		t 	t	t
-- 	t 	t		f 	t	f  		t	f 	t		t 	f	f
-- 	f 	t		t 	t	t 		t	t 	t		f 	t	t
-- 	f 	t		t 	f	f 		t	t 	t		f 	t	f
-- 	f 	t		f 	t	t 		t	f 	t		f 	t	t
-- 	f 	t		f 	t	f 		t	f 	t		f 	t	f

-- 5) Not equivalent. See column 6.
-- 	P 	⟹ 	( 	Q 	⟹ 	R 	) 	≣	( 	P 	⟹ 	Q 	) 	⟹ 	R
-- 	t 	t		t 	t	t 		t		t 	t	t 		t	t
-- 	t 	f		t 	f	f 		t		t 	t	t 		f	f
-- 	t 	t		f 	t	t 		t		t 	f	f 		t	t
-- 	t 	t		f 	t	f 		t		t 	f	f 		t	f
-- 	f 	t		t 	t	t 		t		f 	t	t 		t	t
-- 	f 	t		t 	f	f 		f		f 	t	t 		f	f
-- 	f 	t		f 	t	t 		t		f 	t	f 		t	t
-- 	f 	t		f 	t	f 		f		f 	t	f 		f	f

-- 6) Equivalent. See column 6.
-- 	( 	P 	⟹ 	Q 	) 	⟹ 	P 	≣ 	P
-- 		t 	t	t 		t	t 	t	t
-- 		t 	f	f 		t	t 	t	t
-- 		f 	t	t 		t	t 	t	t
-- 		f 	t	f 		t	t 	t	t

-- 7) Equivalent. See column 6.
-- 	P 	∨ 	Q 	⟹ 	R 	≣ 	( 	P 	⟹ 	R 	) 	∧ 	( 	Q 	⟹ 	R 	)
-- 	t 	t	t 	t	t 	t		t 	t	t 		t 		t 	t	t
-- 	t 	t	t 	f	f 	t		t 	f	f 		f 		t 	f	f
-- 	t 	t	f 	t	t 	t		t 	t	t 		t		f 	t	t
-- 	t 	t	f 	f	f 	t		t 	f	f 		f		f 	t	f
-- 	f 	t	t 	t	t 	t		f 	t	t 		 t		t 	t	t
-- 	f 	t	t 	f	f 	t		f 	t	f 		 f		t 	f	f
-- 	f 	f	f 	t	t 	t		f 	t	t 		 t		f 	t	t
-- 	f 	f	f 	t	f 	t		f 	t	f 		 t		f 	t	f

-- Exercise 2.21
-- 1)
-- 	P 	∨ 	¬ 	Q 	
-- 	t 	t	f	t
-- 	t 	t	t	f
-- 	f 	f	f	t
-- 	f 	t	t	f

-- 2)
-- Total rows in truth table can be calculated by 2 ^ n, where n is the number of variables and 2 the total of options for each variable which in this case is True and False.
-- The total different truth tables can be calculated by r ^ 2, where r is the number of rows in the truth table and 2 the total op options for earch variable.
-- Thus is the case of 2-letter formulas there are (2 ^ n) ^ 2 = (2 ^ 2) ^ 2 = 16 different truth tables that can be made.

-- 3) 
-- Yes. All the possible truth tables for 2-letter formula's are.
--	P	Q		0 	1 	2 	3 	4 	5 	6 	7 	8 	9 	10	11	12	13	14	15
--	t	t		f	f	f	f	f	f	f	f	t	t	t	t	t	t	t	t
--	t	f		f	f	f	f	t	t	t	t	f	f	f	f	t	t	t	t
--	f	t		f	f	t	t	f	f	t	t	f	f	t	t	f	f	t	t
--	f	f		f	t	f	t	f	t	f	t	f	t	f	t	f	t	f	t

-- 0)	(P ∧ ¬P) ∧ (Q ∧ ¬Q)
-- 1)	(¬P ∧ ¬Q)
-- 2) 	(¬P ∧ Q)
-- 3) 	(¬P ∧ ¬Q) ∨ (¬P ∧ Q)
-- 4) 	(P ∧ ¬Q)
-- 5) 	(P ∧ ¬Q) ∨ (¬P ∧ ¬Q)
-- 6) 	(P ∧ ¬Q) ∨ (¬P ∧ Q)
-- 7)	¬(P ∧ Q)
-- 8) 	(P ∧ Q)
-- 9)	(P ∧ Q) ∨ (¬P ∧ ¬Q)
-- 10)	(P ∧ Q) ∨ (¬P ∧ Q)
-- 11)	¬(P ∧ ¬Q)
-- 12)	(P ∧ Q) ∨ (P ∧ ¬Q)
-- 13) 	¬(¬P ∧ Q)
-- 14)	¬(¬P ∧ ¬Q)
-- 15) 	(P ∨ ¬P) ∧ (Q ∨ ¬Q) 	

-- 4)
-- Yes, I think you can generate formula's for all the different truth tables for a 2-letter formula. You only need a combination of the operators' ∧ (and), ∨ (or), and ¬ (not). And a list of return combinations.

-- 5) 
-- I think you can do it. But the complexity increases for each extra letter.

-- Exercise 2.22
-- x < y < z
-- For each two rational numbers (x and z) there is a number that's lays inbetween, called the average of the two numbers.
-- x < (x+z)/2 < z where y equals to (x+z)/2.

-- Exercise 2.23
-- 1)
-- 	∀x 	( 	Ax 	⟹ 	( 	Bx 	⟹ 	Cx 	) 	)					
--					|
--					|	
--			Ax 	⟹ 	( 	Bx 	⟹ 	Cx 	)
--			|				|
--			|				|
--			Ax 			Bx 	⟹ 	Cx 	
-- 						|		|
--						|		|
--						Bx 		Cx 	

-- 2)
-- 	∃x 	( 	Ax 	∧ 	Bx 	)
-- 				|
-- 				|
-- 		 	Ax 	∧ 	Bx 	
--			|		|
--			|		|
--			Ax 		Bx

-- 3)
-- ∃x 	Ax 	∧ 	∃x 	Bx
-- 			|
-- 			|
-- 		Ax 	∧ 	∃x 	Bx
--		| 		|	
--		|		|
--		Ax		∃x 	Bx
-- 					|
-- 					| 					
-- 					Bx

-- Exercise 2.26
-- 
























