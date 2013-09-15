module Exercise3

where

import Week2

-- precondition: input is a formula
cnf :: Form -> Form
cnf = cnf' . nnf . arrowfree

-- precondition: input is arrow-free and in NNF
cnf' :: Form -> Form
cnf' (Prop x) = Prop x
cnf' (Neg f) = Neg f
cnf' (Cnj fs) = Cnj (map cnf' fs)
cnf' (Dsj fs) = dist (map cnf' fs)

-- precondition: input is CNF
dist :: [Form] -> Form
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
isCNF (Dsj fs) = and (map isDist fs)
isCNF f = isLiteral f

isDist :: Form -> Bool
isDist (Cnj _) = False
isDist (Dsj fs) = and (map isDist fs)
isDist f = isLiteral f

isLiteral :: Form -> Bool
isLiteral (Prop x) = True
isLiteral (Neg (Prop x)) = True
isLiteral _ = False
