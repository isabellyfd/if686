data Shape =  Circle Float | Rectangle Float Float

area :: Shape -> Float
area (Circle a) =  a*(pi**2)
area (Rectangle a b) = a*b


type HorasAula = Int
type Disciplinas = [String]
data Dias =  Domingo | Segunda HorasAula Disciplinas |Terca HorasAula Disciplinas 
	| Quarta HorasAula Disciplinas | Quinta HorasAula Disciplinas | Sexta HorasAula Disciplinas
	|Sabado

isWeekend :: Dias -> Bool
isWeekend (Sabado) = True
isWeekend (Domingo) = True
isWeekend _ = False

isPLC :: [String] -> Bool
isPLC [] = False
isPLC (a:as) | a == "plc" || a == "PLC" =  True
	|otherwise =  isPLC as

thereIsPLC :: Dias -> Bool
thereIsPLC (Sabado) = False
thereIsPLC (Domingo) = False
thereIsPLC (Segunda n (a:as)) = isPLC (a:as)
thereIsPLC (Terca n (a:as)) = isPLC (a:as)
thereIsPLC (Quarta n (a:as)) = isPLC (a:as)
thereIsPLC (Quinta n (a:as)) = isPLC (a:as)
thereIsPLC (Sexta n (a:as))  = isPLC (a:as)


data Tree t = NilT |Node t (Tree t) (Tree t) | Compare (Tree t) (Tree t)
	deriving (Show)

data Expr = Lit Int | Add Expr Expr | Sub Expr Expr

showExpr :: Expr -> String
showExpr (Lit a) = show a
showExpr (Add e1 e2) = (showExpr e1) ++ " + " ++ (showExpr e2)
showExpr (Sub e1 e2) = (showExpr e1) ++ " - " ++ (showExpr e2)

data List t = Nil | Cons t (List t)
	deriving (Show)


toList :: List t -> [t]
toList (Nil) = []
toList (Cons t (l)) = t : toList l

fromList :: [t] -> List t
fromList [] = Nil
fromList (a:as) = (Cons a (fromList as))


maximum1 :: Int -> Int -> Int
maximum1 a b | a > b  = a
	|otherwise = b

depth :: Tree t -> Int
depth (NilT) = 0
depth (Node a t1 t2) = 1 + maximum1 (depth t1) (depth t2)

collapse :: Tree t -> [t]
collapse (NilT) = []
collapse (Node a t1 t2) = [a] ++ collapse t1 ++ collapse t2

bfs :: Tree t -> t -> Bool
