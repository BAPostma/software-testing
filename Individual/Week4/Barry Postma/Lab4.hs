module Lab4

where

import SetOrd
import Week3

{-|
	Exercise 2
	Duration: 1hr because of trouble with IO again... :)
-}
randomSet :: IO (Set Int)
randomSet = do
			intl <- getIntList'
			return (list2set intl)
			
