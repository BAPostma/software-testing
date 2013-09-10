module Exercise2

where

import Week2

{-|
	Exercise 2a
	A definition of wheter an expression is a contradiction.
-}
contradiction :: Form -> Bool
contradiction f = not (any (\ v -> eval v f) (allVals f))

{-|
	Exercise 2b
	A definition of wheter an expression is a tautology.
	
	The implementation is created based on this statement:
	"A formula is satisfiable if it is true under at least one interpretation, and thus a tautology is a formula whose negation is unsatisfiable." (src. Wikipedia)
-}
tautology :: Form -> Bool
tautology f = not (satisfiable (Neg f))

{-|
	Exercise 2c
	A definition of wheter an expression is a logical entailment. (p -> q)
	Rewriting entailment: (p => q) <=> ¬p v q
-}
entails :: Form -> Form -> Bool
entails fa fb = all (\ v -> (eval v fx) && (eval v fy)) (allVals fx)
				where
					fx = (Impl fa fb)
					fy = (Dsj [(Neg fa), fb])

{-|
	Exercise 2d
	A definition of wheter an expression is a logical equivalence.
-}
equiv :: Form -> Form -> Bool
equiv fa fb = (map (\ v -> eval v fa) (allVals fx))
				==
			  (map (\ v -> eval v fb) (allVals fx))
			  where
				  fx = Equiv fa fb
