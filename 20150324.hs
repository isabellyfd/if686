type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

firstCoord :: Ponto -> Float
firstCoord (x,y) = x

secondCoord :: Ponto -> Float
secondCoord (x,y) = y

vert :: Reta -> String
vert ((x1,y1), (x2,y2)) | x1 == x2 = "sim"
		|otherwise =  "não"