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

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib x = fib(x-2) + fib (x-1)

parFib:: Int-> Int -> [Int]
parFib 0 x = []
parFib n x |  mod (fib x) 2 == 0  =  fib x : parFib (n-1) (x+1)
           | otherwise =  parFib n (x+1)


getMajor :: Int -> [Int] -> [Int]
getMajor x [] = []
getMajor x (a:as) | (x <= a) = a : (getMajor x as)
	|otherwise = (getMajor x as)
	
getMinor :: Int -> [Int] -> [Int]
getMinor x [] = []
getMinor x (a:as) | (x > a) = a: (getMinor x as)
	|otherwise = (getMinor x as)
	
qsort :: [Int] -> [Int]
qsort [] = []
qsort (a:as) = qsort (getMinor a as) ++ (a:[]) ++ qsort (getMajor a as)
	
