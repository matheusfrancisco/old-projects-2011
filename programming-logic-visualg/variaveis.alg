algoritmo "variaveis"
// Fun��o :
// Autor :
// Data : 5/2/2011
// Se��o de Declara��es 
var
valor1, valor2, resultado :real

funcao SOMA(v1, v2:real) :real
var
total : real
inicio
total <- v1 + v2
retorne total
fimfuncao

inicio
escreva ("Informe o valor 1: ")
leia (valor1)
escreva ("Informe o valor2: ")
leia ( valor2)
resultado <- SOMA(valor1,valor2)
escreva ("Resultado da soma: ", resultado)
// Se��o de Comandos 
fimalgoritmo
