
-- Trabalho 4

--2 

--look and say onde n é o n-ésimo valor da sequência e x é o valor inicial do look n say iterator que é 0 e dps fica a cargo da recursão
lookNsay :: Int -> Int -> Int
lookNsay 0 x = x
lookNsay n x = lookNsay (n-1) (lookNsayIterator x)

lookNsayIterator :: Int -> Int
lookNsayIterator 0 = 1
lookNsayIterator n = passaPraInt (lookNsaySeq(emLista n))

lookNsaySeq :: [Int] -> [Int]
lookNsaySeq [] = []
lookNsaySeq inn = (length inn - length (cardinal inn (head inn)))*10 + head inn : lookNsaySeq (cardinal inn (head inn))

--lookNsaySeq n = ((length (emLista n) - length(cardinal (emLista n) (head (emLista n))))*10 + (head (emLista n)) : (cardinal (emLista n) (head (emLista n)))
--lookNsaySeq n = ((cardinal (emLista n) (head (emLista n)))*10 + (head (emLista n))) : lookNsaySeq ((cardinal (emLista n) (head (emLista n))))

passaPraInt :: [Int] -> Int
passaPraInt [] = 0
passaPraInt ls = mult ((length ls)-1) (head ls) + passaPraInt (tail ls)

mult :: Int -> Int -> Int
mult factor num
   |factor <= 0 = num
   |otherwise = mult (factor-1) (num*100)

cardinal :: [Int] -> Int -> [Int]
cardinal [] x = []
cardinal  inn x
   |(head inn) /= x = inn
   |otherwise = (cardinal (tail inn) x)

emLista :: Int -> [Int]
emLista 0 = []
emLista n = emLista (reduzNum n) ++ (mod n 10 : [])

--reduz o número da direita pra esquerda pra poder colocar na lista
reduzNum :: Int -> Int
reduzNum n = div (n - mod n 10) 10