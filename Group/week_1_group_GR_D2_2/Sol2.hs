module Sol2 where
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

-- Exercise 2.15
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
-- P and Q are logically equivalent iff, no matter the truth values of P and Q, the truth values obtained are the same.
-- P <=> Q is logically valid iff the outcome will always be True, regardless of the truth values of P and Q.
-- So iff the outcome of P <=> Q will always be true then P and Q are logically equivalent, because the truth values obtained are the same (regardless the truth values of P and Q).

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
-- Each truth table has 4 rows with for each row 2 options (True and False). This makes 2 ^ 4 = 16 different truth tables.

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
-- I think you can but I don't know how.

-- 5) 
-- A 3-letter formula has truth tables of 2 ^ 3 = 8 rows each with a 2 ^ (2 ^ n) = 2 ^ (2 ^ 3) = 256 different truth tables. Where n stand for the number of letters in the formula.

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
-- 1)
-- ∃x,y ∈ Q (x < y)

-- 2)
-- ∀x ∈ R ∃y ∈ R (x < y)

-- 3)
-- ∀x ∈ Z ∃m,n ∈ N (x = m - n)

-- Exercise 2.27
-- 1)
-- ∀x (x ∈ Q) ⟹ ∃m,n (m ∈ Z ∧ n ∈ Z ∧ n ≠ 0 ∧ x = m / n)

-- 2)
-- ∀x (Fx ⟹ ∀y (Dy ⟹ ( Oxy ⟹ Bxy ) ) ) 

---

-- Exercise 2.31
-- 1)
-- some x (x^2 + 1 = 0)

-- 2)
-- all x element of N, some y element of N (x < y)

-- 3)
-- all n element of N (0 < n && n < 13 && not (n|13))

-- 4)
-- all x element of N, some n element of N (0 < x && x < n ** not (x|n))

-- 5)
-- all x element of Primes, some y element of Primes (x < y)

-- Exercise 2.32
-- 1)
-- all x L(x, d)

-- 2)
-- all x L(d, x)

-- 3)
-- some x (M(x) ==> M'(x))

-- 4)
-- some x (B(x) && not F(x))

-- Exercise 2.33
-- 1) 
-- (B for Bark and B' for Bite
-- all x ((D(x) && B(x)) ==> not B'(x))

-- 2)
-- (G for Glitters and G' for Gold)
-- all x (G(x) ==> not G'(x))

-- 3) 
-- (F for Friends and d For Diana)
-- all x, all y ((F(d, x) && F(x, y)) ==> F(d, y)

-- Exercise 2.34
-- 1)
-- all x (not x == c ==> L(x, d))

-- 2)
-- all x (M(x) ==> some y, some z (W(y) && W(z) && not y = z && (A(x, y) || A(x, z)))

-- 3)
-- all x (M(x) ==> some y (W(y) ==> M(x, y)) && all z (W(z) ==> M(x, z)) && z = y)

-- Exercise 2.35
-- 1)
-- some x (King(x) && all y (King(y) => y = x) && not Raging(x)

-- 2)
-- some x (King(x) && all y (King(y) => y = x) && all z (S(z, x) ==> L(z, x)))

-- Exercise 2.36
-- 1)
-- Some real numbers x are 5 when x^2

-- 2)
-- There is no largest natural number

-- 3)
-- For all natural numbers n, 2^n + 1 is a prime
-- Note: not sure if this is the right answer, because the statement is false

-- 4)
-- No idea

-- 5)
-- No idea

-- Exercise 2.37
-- 1)
-- a: false
-- b: false
-- c: false
-- d: false
-- e: false
-- f: false

-- 2)
-- a: false
-- b: true
-- c: true
-- d: false
-- e: false
-- f: false

-- 3)
-- a: false
-- b: false
-- c: false
-- d: false
-- e: false
-- f: true

-- 4)
-- a: true
-- b: false
-- c: false
-- d: false
-- e: false
-- f: false

-- 5)
-- a) true (For every x there is and y which is bigger, and no z wich is bigger than x but smaller than y. So it says that every N has a number that comes immediately after it.)
-- b) false (Same as 'a', but it says that every N has a number that comes immediately before it, which is false for 0)
-- c) ??
-- d) ??
-- e) false
-- f) false

-- Exercise 2.38
-- 1)
-- a) No natural number is smaller than any natural number
-- b) No natural number is greater than any natural number
-- c) No rational number is smaller than any rational number
-- d) All reals greater than 0
-- e) No one is the father of anyone
-- f) All people that love anyone

-- 2)
-- a) Any natural number has the property of not being the greatest
-- b) Any natural number greater than 0 has the property of not being the smallest
-- c) Any rational number has the property of not being the greatest
-- d) All reals greater than 0
-- e) Some people
-- f) Some people

-- 3)
-- Same as 1

-- 4)
-- a) 0 is the only natural number that is equal or smaller than any natural number
-- b) No natural number is equal or greater than any natural number
-- c) No rational number is equal or smaller than any rational number
-- d) All reals greater than 0
-- e) No one is father of himself or father of anyone
-- f) Some people love themself or love anyone

-- 5)
-- a) Every natural number has a number that comes immediately after it
-- b) Every natural number greater than 0 has a number that comes immediately before it
-- c) ??
-- d) ??
-- e) No people
-- f) ??

-- Exercise 2.39
-- P and Q are logically equivalent iff, no matter the truth values of P and Q, the truth values obtained are the same.
-- P <=> Q is logically valid iff the outcome will always be True, regardless of the truth values of P and Q.
-- So iff the outcome of P <=> Q will always be true then P and Q are logically equivalent, because the truth values obtained are the same (regardless the truth values of P and Q).

-- Exercise 2.41
-- 1) all x element of R (x^2 /= 5)
-- 2) some n element of N, all m element of N (n >= m)
-- 3) some n element of N, some d element of N (1 < d < (2^n + 1) && d|(2^n + 1))
-- 4) some n element of N, all m element of N (n >= m || some p element of N (p > n && m > p))
-- 5) some e element of R+, all n element of N >= n(|a - a_m| > e)

-- Exercise 2.46
-- No. If A is the set of Students and F(x) expresses that x is lazy. The formula 'some x not element of A F(x)' states that there are lazy people that are not student, which is true. But the formula 'not some x element of A F(x)' states that no student is lazy, which is false. So the formulas are not equivalent.

-- Exercise 2.47
-- No. Let's take the same quantifier as exercise 2.46. The first formula states that there are people wo are not student and not clever. The second formula states that there are students that are not clever. While both statements are true, their meaning is not the same.

-- Exercise 2.48
-- 1. all x element of A, all y element of A F(x, y) === all y element of A, all x element of A F(x, y).
-- 2. See example above exercise 2.46
-- 3. all x element of A (F(x) && G(x)) === (all x element of A F(x) && all x element of A G(x))

-- Exercise 2.50
-- some d > 0 all n some m >= n(|a - a_m| >= d)

-- Exercise 2.51
unique :: (a -> Bool) -> [a] -> Bool
unique p xs = length (filter p xs) == 1

-- Exercise 2.52
parity :: [Bool] -> Bool
parity xs = mod (length (filter (== True) xs)) 2 == 0

-- Exercise 2.53
evenNR :: (a -> Bool) -> [a] -> Bool
evenNR p = parity . map p












































