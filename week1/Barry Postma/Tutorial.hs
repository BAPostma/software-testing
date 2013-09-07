doubleMe :: Int -> Int
doubleMe x = x + x

doubleUs :: Int -> Int -> Int
doubleUs x y = doubleMe x + doubleMe y

removeUpperCase :: String -> String
removeUpperCase str = [ x | x <- str, not (elem x ['A'..'Z']) ]

