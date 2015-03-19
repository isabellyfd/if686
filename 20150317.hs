vendas :: Int -> Int
vendas x = mod ((+) x 1) 5

equalsS :: Int -> Int -> Bool
equalsS x y = (x == y)

exer :: Int -> Int -> Int
exer s n | n == 0 && (equalsS s 0) = 1
	| n == 0 && not(equalsS s 0) = 0
	|equalsS s n = vendas n + exer s (n-1)
	|not(equalsS s n) = exer s (n-1)