--trabalho 10 
tipo de:

foldr (+) . (.) . map

:t foldr =  (a -> b ->b ) -> b -> [a] -> b
:t (+) = Num x => (x -> x -> x) 
:t (.) = (i -> c') ->  (j -> i) -> (j -> c')
:t map =  (z-->y) ->  [z] -> [y]

:t (.) =  (b -> c) -> (a ->b) -> a->c

:t (.).map =  (z->y) -> (j -> [z]) -> j ->  [y]

b = (i -> c') 
c = (j ->i) -> j -> c'
a =  (z->y)
b = ([z] --> [y])
==>  i == [z]
==> c' == [y]

:t  foldr(+) = Num x => x -> [x] -> x

:t (foldr(+)).((.).map)  = (z->y) -> [(j -> [z]) -> j -> [y]] -> (j -> [z]) -> j -> [y]

a = (z->y)
b = (j -> [z]) -> j -> [y]
b= x
c = [x] -> x
==> x = (j -> [z]) -> j -> [y]

(\x y z -> foldr z x y). map 

:t foldr =  (a -> b ->b ) -> b -> [a] -> b
:t map =  (z-->y) ->  [z] -> [y]

:t (.) =  (b -> c) -> (a ->b) -> a->c

a = (z -> y)
b = [z] -> [y]
b = (a-> b ->b)
c = b -> [a] -> b
==> a = [z]
==> [y] = b ->b 

:t (\x y z -> foldr z x y). map = (z->y) -> (?????)

map.((.) (foldr (++) (foldr (++) [] [[1], [2]])))

:t foldr =  (a -> b ->b ) -> b -> [a] -> b
:t map =  (z-->y) ->  [z] -> [y]
:t (.) =  (b' -> c') -> (a' ->b') -> a'->c'

:t foldr (++) [] [[1], [2]]==> b
:t (foldr (++) (foldr (++) [] [[1], [2]])) ==> [a] -> b
:t (.) (foldr (++) (foldr (++) [] [[1], [2]]) ==>  (a' -> [a]) -> a' -> b

:t map . ((.) (foldr (++) (foldr (++) [] [[1], [2]])) = (a' ->[a]) -> [a'] -> [b] 

a'' = (a' -> [a])
b'' = a'  -> b
b'' =  (z -> y)
c'' = [z] -> [y]

(foldr).(.)$(!!)
:t foldr =  (a -> b ->b ) -> b -> [a] -> b
:t (.) =  (b' -> c') -> (a' ->b') -> a'->c'

 :t (.) = (i ->  v) ->  (j -> i) -> (j -> v)

:t (foldr).(.) = (b' -> b) ->b -> (b -> b') -> b 

j = (b' -> c')
i = (a' -> b') -> a' -> c'
i = (a -> b -> b)
v = b -> [a] -> b
==> a = (a' -> b')
==> b = a' = c'

:t (!!) = [t] -> Int -> t
==> b' = [t] 
==> b = Int ->t 

:t (foldr. (.)) $ (!!) = (Int -> t) -> ((Int -> t)-> [t]) -> (Int -> t)

