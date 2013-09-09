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
	A definition of wheter an expression is a logical entailment.
-}
-- entails :: Form -> Form -> Bool


{-|
	Exercise 2d
	A definition of wheter an expression is a logical equivalence.
-}
-- equiv :: Form -> Form -> Bool


{-|
	NOTES:
	-- contradiction: contradiction (Cnj [(Prop 6), (Cnj [(Neg (Prop 6)), (Prop 6)]) ] )

	-- tautology: a or not a
	(Dsj [(Prop 1), (Neg (Prop 1))])
	 A formula is satisfiable if it is true under at least one interpretation, and thus a tautology is a formula whose negation is unsatisfiable.
	 
	given x as formula
	tautology = not (satisfiable (Neg f))
	
	-- {eval valuation([(Name,Bool)]) Form} {allVals Form}

-}