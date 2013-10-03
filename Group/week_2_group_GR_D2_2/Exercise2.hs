module Exercise2

where

import Week2

{-|
	Exercise 2a
	A definition of wheter an expression is a contradiction.
-}
-- VVZ: *whether (also in many places below)
contradiction :: Form -> Bool
contradiction f = not (satisfiable f)

{-|
	Exercise 2b
	A definition of wheter an expression is a tautology.
-}
tautology :: Form -> Bool
tautology f = all (\ v -> eval v f) (allVals f)

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
-- VVZ: why do you check for two identical (yet differently formulated) properties?
-- VVZ: also, part of this definition looks like the definition of 'tautology'. Code reuse, anyone?

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
-- VVZ: again, could be written much simpler as 'tautology (Equiv f1 f2)'
-- VVZ: be lazy, reuse your own functions!
