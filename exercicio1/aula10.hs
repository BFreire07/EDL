type Autores = [String]
type Musica = (String, Int, Int)

bandas :: [Autores]
bandas = [["Gilberto Gil"], ["Victor","Leo"], ["Gonzagao"],["Claudinho","Bochecha"]]

musicas :: [Musica]
musicas = [("Aquele Abraco", 1, 100), ("Esperando na Janela", 1, 150),("Borboletas", 2, 120),("Asa Branca", 3, 120),("Assum Preto", 3, 140),("Vem Morena", 3, 200),("Nosso Sonho", 4, 150),("Quero te Encontrar", 4, 100)]


-- Exercicio 1
listaNomesMusicas =  map (\(a,b,c) -> a) musicas


-- Exercicio 2

listaMusicasMinimo2Minutos = filter (\(a,b,c) -> c>=120) musicas

-- Exercicio 3

f1 (a,b,c) v = if (v > c) then v else c
musicaMaiorDuracao = foldr f1 0 musicas

-- Exercicio 4
nomesMusicasMinimo2Minutos = map (\(a,b,c) -> a) listaMusicasMinimo2Minutos

-- Exercicio 5

autoresFormatado = map (\a->foldr (++) "" a) bandas
func (a,b,c) = putStr ("Nome: " ++ a ++ "\nAutores" ++ b ++ "\nDuracao: " ++ c)

main = func("Sou rei", "Bruno", 120)


--main = print  nomesMusicasMinimo2Minutos

