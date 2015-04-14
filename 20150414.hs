{-trabalho 07 -}

-- 01 composição de funções

compose:: (t -> t) -> [(t->t)] -> [(t -> t)]
compose f [] = []
compose f (g:gs) = [fog]  ++ (compose f gs)
	where fog x = f (g x)

--questão 2

data Graph t = Graph [t] [(t, t, Int)]
   deriving (Eq, Show)

-- mapGraph (*2) (Graph [2, 3, 4, 6] [(2,3,5), (6, 4, 2), (3, 4, 0), (3, 2, 1)])

changeEdges :: (t -> u) -> [(t, t, Int)] -> [(u, u, Int)]
changeEdges f [] = []
changeEdges f ((a, b, c):as) = (((f a), (f b), c) : (changeEdges f as))

mapGraph :: (t -> u) -> Graph t -> Graph u
mapGraph f (Graph [] []) = (Graph [] [])
mapGraph f (Graph nos arestas) = Graph (map f nos) (changeEdges f arestas)

-- foldGraph sumWeight 0 (Graph [2, 3, 4, 6] [(2,3,5), (6, 4, 2), (3, 4, 0), (3, 2, 1)])

foldGraph :: ((t, t, Int) -> u -> u) -> u  -> Graph t -> u
foldGraph f base (Graph _ []) = base
foldGraph f base (Graph nos ((a, b ,c):as)) = f (a, b ,c) (foldGraph f base (Graph nos as))

sumWeight :: (t, t, Int) -> Int -> Int
sumWeight (a, b, c) memo = c + memo

-- questão 3

data Tree t = Nul | Node t (Tree t) (Tree t) 
   deriving Show

aux :: Tree t -> (t -> Bool) -> [Tree t]
aux Nul f = [Nul]
aux (Node x a b) f
   |f x = [Node x] ++ (aux a f) ++ (aux b f)
   |otherwise = (aux a f) ++ (aux b f)
   
filterTree :: (t -> Bool) -> Tree t -> [Tree t]
filterTree f Nul = []
filterTree f (Node x a b)
   |f x = (aux (Node x a b) f) 
   |otherwise = filterTree f a ++ filterTree f b