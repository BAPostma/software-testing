module Exercise3

where

import Week2

-- precondition: input is a formula
cnf :: Form -> Form
cnf = cnf' . nnf . arrowfree
-- VVZ: almost, but not quite. Counterexample:
-- VVZ: 'cnf (Cnj [Cnj [p,p], Cnj [p,p]])'
-- VVZ: the definition on the slides talked about conjunction/disjunction as binary due to their distributive and associative nature.
-- VVZ: The Haskell implementation is multiary - remember 'Cnj [Form]', not 'Cnj (Form, Form)'
-- VVZ: your implementation is for a different type.

-- precondition: input is arrow-free and in NNF
cnf' :: Form -> Form
cnf' (Prop x) = Prop x
cnf' (Neg f) = Neg f
cnf' (Cnj fs) = Cnj (map cnf' fs)
cnf' (Dsj fs) = dist (map cnf' fs)

-- precondition: input is CNF
dist :: [Form] -> Form
-- VVZ: dist [] = Dsj []
dist [f] = f
dist (f:fs) = dist' f (dist fs)

-- precondition: input is CNF
dist' :: Form -> Form -> Form
dist' (Cnj fs) q = Cnj (map (\p -> dist' p q) fs)
dist' p (Cnj fs) = Cnj (map (dist' p) fs)
dist' p q = Dsj [p, q]

-- test functions
isCNF :: Form -> Bool
isCNF (Cnj fs) = and (map isCNF fs)
-- VVZ: the line above is not the definition of CNF
isCNF (Dsj fs) = and (map isDist fs)
isCNF f = isLiteral f

isDist :: Form -> Bool
isDist (Cnj _) = False
isDist (Dsj fs) = and (map isDist fs)
-- VVZ: the line above is not the definition of CNF
isDist f = isLiteral f

isLiteral :: Form -> Bool
isLiteral (Prop x) = True
isLiteral (Neg (Prop x)) = True
isLiteral _ = False
