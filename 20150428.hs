--exercicios não feitos desde o começo, estudando para a prova.
import Data.Char

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo :: BancoDados
baseExemplo =  [("Sergio","O Senhor dos Aneis"),("Andre","Duna"), ("Fernando","Jonathan Strange & Mr. Norrell"), ("Fernando","A Game of Thrones")]

emprestimosCL :: BancoDados -> Livro -> [Pessoa]
emprestimosCL bd lv =  [x | (x,y) <- bd, (y == lv)]

emprestadoCL :: BancoDados -> Pessoa -> Int
emprestadoCL bd ps = length ([x | (x, y) <- bd , (x == ps)])

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver bd ps lv = [x | x <- bd] ++ [(ps,lv)]



myTake :: [t] -> Int -> [t]
myTake _ 0 = []
myTake (a:as) n = a : myTake as (n-1)  

myDrop :: [t] -> Int -> [t]
myDrop ls 0 = ls
myDrop (a:as) n = myDrop as (n-1)

myTakeWhile :: (b -> Bool) -> [b] -> [b]
myTakeWhile f [] =  []
myTakeWhile f (a:as) | ((f a) == True) = a : myTakeWhile f as
 |otherwise = [] 

 --dropWhile mt louco, não entendi a composição da função 

poliFunction :: Ord a =>(a->Bool)->[a] -> [a]
poliFunction f ls = [ x | x <- ls, (f x)]


--fazer a função agrupar assim que possivel
data Tree t = NilT |Node t (Tree t) (Tree t) | Compare (Tree t) (Tree t)
	deriving (Show)

bfs :: Eq t => Tree t -> t -> Bool
bfs NilT num = False
bfs (Node x t1 t2) num | (x == num) = True 
 |otherwise = (bfs t1 num) || (bfs t2 num)

mapTree :: (t -> u) -> Tree t -> Tree u 
mapTree f NilT = NilT
mapTree f (Node x t1 t2) = (Node (f x) (mapTree f t1) (mapTree f t2)) 

sqrtList :: Floating a => [a] -> [a]
sqrtList ls = (map sqrt ls)

posicaoAlfabeto :: String -> [Int]
posicaoAlfabeto str =  (map ord str)

mapCL :: (a->b) -> [a] -> [b]
mapCL f list = [ (f x) | x <-list]

--member :: t -> [t] -> Bool
--member x ls = (foldr (||) [] (foldr (==x) [] ls))



--union :: [a] -> [a] -> [a]
--union y b =  (foldr (++) (foldr (++) [] y) b)
