algoritmo "vetor"
// Fun��o :
// Autor :
// Data : 5/2/2011
// Se��o de Declara��es 
var
numero:vetor [1..4] de real
i, numeros_negativos: inteiro
inicio
escreval ("Informe 4 numeros: ")
numeros_negativos<- 0
para i de 1 ate 4 faca
leia(numero[i])
se numero[i] < 0 entao
numeros_negativos <- numeros_negativos+1
fimse
fimpara
escreva ("Total de n�meros negativos: ", numeros_negativos)
// Se��o de Comandos
fimalgoritmo
