module Exercise2 where

import Week2

contradiction :: Form -> Bool
contradiction = not . satisfiable

tautology :: Form -> Bool
tautology f = all (\v -> eval v f) (allVals f)

-- logical entailment
-- entails :: Form -> Form -> Bool
-- entails f1 f2 = TODO

-- logical equivalence
-- equiv :: Form -> Form -> Bool
-- equiv f1 f2 = True -- TODO
