------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicios de Sorts
merge :: [Int] -> [Int] -> [Int]
merge [] []      = []
merge l  []      = l
merge [] l       = l
merge (a:as) (b:bs) | a <= b     = a : (merge as     (b:bs))
                    | otherwise  = b : (merge (a:as) bs)

split :: [Int] -> ([Int], [Int])
split []        = ([],[])
split (a:[])	= ([a], [])
split (a:b:[])	= ([a], [b])
split (a:b:as) 	= (a : fst (split as), b : snd (split as))


mergeSort :: [Int] -> [Int]
mergeSort []     = []
mergeSort (a:[]) = [a]
mergeSort l      = merge (mergeSort (fst (split l))) (mergeSort (snd (split l)))


quicksort :: [Int] -> [Int]
quicksort l | l == []   = []
            | otherwise = (quicksort (isLow (tail l) (head l))) ++ [head l] ++ (quicksort (isHigh (tail l) (head l)))

isLow :: [Int] -> Int -> [Int]
isLow l n | l == []    = []
          | head l <= n = (head l) : isLow (tail l) n
          | otherwise  = isLow (tail l) n

isHigh :: [Int] -> Int -> [Int]
isHigh l n| l == []    = []
          | head l > n = (head l) : isHigh (tail l) n
          | otherwise  = isHigh (tail l) n

len :: [Int] -> Int
len [] = 0
len l  = 1 + len (tail l)

findEl :: [Int] -> Int -> Int
findEl [] _ = -2000000000000000000
findEl l  1 = head l
findEl l n  = findEl (tail l) (n-1)


findElPermuta :: [Int] -> Int -> ([Int],[Int])
findElPermuta [] _ = ([],[])
findElPermuta l  1 = ([], tail l)
findElPermuta l n  = (head l : fst (findElPermuta (tail l) (n-1)), [] ++ snd (findElPermuta (tail l) (n-1)))

permuta :: [Int] -> Int -> Int -> [Int]
permuta [] _ _           = []
permuta l 1 j
             | j > len l = l
	     | j == 1    = l
             | otherwise = (findEl l j) : fst(findElPermuta (tail l) (j -1)) ++ [head l] ++ snd (findElPermuta (tail l) (j-1))
permuta l i j
             | i == j    = l
	     | otherwise = head l : permuta (tail l) (i-1) (j-1)


heapfy :: [Int] -> Int -> [Int]
heapfy [] _ = []
heapfy l  i | ((findEl l  (2*i)      > findEl l (i)) && (findEl l  (2*i)      > findEl l ((2*i) + 1))) = heapfy ((permuta l i  (2*i)))       (2*i)
	    | ((findEl l ((2*i) + 1) > findEl l (i)) && (findEl l ((2*i) + 1) > findEl l  (2*i)))      = heapfy ((permuta l i ((2*i) + 1))) ((2*i) + 1)
            |  (findEl l  (2*i)      > findEl l (i))                                                   = heapfy ((permuta l i  (2*i)))       (2*i)
	    |  (findEl l ((2*i) + 1) > findEl l (i))                                                   = heapfy ((permuta l i ((2*i) + 1))) ((2*i) + 1)
	    | otherwise = l


buildMaxHeap :: [Int] -> Int -> [Int]
buildMaxHeap [] _ = []
buildMaxHeap l  1 = heapfy l 1
buildMaxHeap l  i = buildMaxHeap(heapfy l i) (i-1)

heapSort :: [Int] -> [Int]
heapSort []     = []
heapSort (a:[]) = [a]
heapSort l  =  heapSort(buildMaxHeap (tail l) (len (tail l))) ++ [head l]


---------- sala de aula 


type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

firstCoord :: Ponto -> Float
firstCoord (x,y) = x

secondCoord :: Ponto -> Float
secondCoord (x,y) = y

vert :: Reta -> String
vert ((x1,y1), (x2,y2)) | x1 == x2 = "sim"
		|otherwise =  "não"

menor :: (Int, Int, Int) -> Int
menor (a,b,c) | a < b && a < c = a
			| b < c = b
			|otherwise = c
maior :: (Int, Int, Int) -> Int
maior (a,b,c) | a > b && a > c = a
			| b > c = b
			|otherwise = c

medium:: Int -> Int -> (Int, Int, Int) -> Int
medium a b (x, y, z) | x /= a && x /= b = x 
					| y /= a && y /= b = y
					| z /= a && z /= b  = z


menorMaior :: Int -> Int -> Int-> (Int,Int)
menorMaior a b c = (menor(a,b,c), maior(a,b,c))

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a,b,c) = (menor(a,b,c), ((a+b+c) - (menor(a,b,c) + maior(a,b,c))) , maior(a,b,c))

pontoY :: Float -> Reta -> Float
pontoY x ((x1,y1),(x2,y2)) = (+) (((y2-y1)/(x2-x1))*(x - x1)) y1
--se for vertical a resposta é infinito

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio","O Senhor dos Aneis"), ("Andre","Duna"), ("Fernando","Jonathan Strange & Mr. Norrell"), ("Fernando","A Game of Thrones")]

livros :: BancoDados -> Pessoa -> [Livro]
livros [] p = []
livros ((str1,str2):str) p | str1 == p = str2 : livros str p
	|otherwise = livros str p 

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos [] l = []
emprestimos ((str1,str2):str) l | str2 == l = str1 : emprestimos str l

emprestado :: BancoDados -> Livro -> Bool
emprestado [] l = False
emprestado ((str1,str2):str) l | str2 == l = True
							| otherwise = emprestado str l

qtdEmprestimos:: BancoDados -> Pessoa -> Int
qtdEmprestimos [] p = 0
qtdEmprestimos ((str1,str2):str) p | p == str1 = 1 + qtdEmprestimos str p
	|otherwise = qtdEmprestimos str p

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar ls p l = (p,l):ls

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] p l = []
devolver ((str1,str2):str) p l | str1 /= p && str2 /= l = (str1,str2) : devolver str p l
	| otherwise = devolver str p l

isEquals :: Int -> Int -> Bool
isEquals a b | a == b = True
	|otherwise = False 

verify :: (String, String) -> String -> Bool
verify (x, y) str | x == str =  True
	|otherwise = False

livrosCL :: BancoDados -> Pessoa -> [Livro]
livrosCL bd p = [y |(x,y)<-bd, verify (x,y) p]
