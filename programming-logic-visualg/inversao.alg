algoritmo "invers�o"
// Fun��o :
// Autor :
// Data : 5/2/2011
// Se��o de Declara��es 
var
a, b :inteiro

procedimento inverte (var x, y :inteiro)
var
aux :inteiro
inicio
aux <- x
x <- y
y <- aux
fimprocedimento

inicio
a <- 10
b <- 42
escreval ("A:",a," B:",b)
inverte (a,b)
escreval ("A:" ,a," B:",b)
// Se��o de Comandos 
fimalgoritmo
