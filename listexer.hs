--exercicio de lista

double :: [Int] -> [Int]
double [] = []
double as = (*) 2 (head as) : double (tail as)

member :: [Int] -> Int -> Bool
member [] n = False
member as n | (head as) == n = True
			| otherwise = member (tail as) n

digits :: String -> String
digits [] = []
digits as | (((head as) == '1') || ((head as) == '2') || ((head as) == '3') || ((head as) == '4') || ((head as) == '5') || ((head as) == '6') || ((head as) == '7') || ((head as) == '8') || ((head as) == '9') || ((head as) == '0') )= (head as) : digits (tail as)
	| otherwise =  digits (tail as)

sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] [] = []
sumPairs as bs = ((head as) + (head bs)) : sumPairs (tail as) (tail bs)

getPivo:: [Int] -> Int
getPivo [] = []
getPivo as = head as

getTamList :: [Int] -> Int
getTamList [] = 0
getTamList as = 1 + getTamList (tail as)

part :: [Int]-> Int -> Int -> Int
part as 