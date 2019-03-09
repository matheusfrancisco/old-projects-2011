algoritmo "valores"
// Função :
// Autor :
// Data : 5/2/2011
// Seção de Declarações 
var
valor1, valor2, valor3, valor_menor : inteiro
resposta : caracter
inicio
reipta
limpatela
escreva (" Digite 3 valores:")
leia(valor1 , valor2 , valor3)
se (valor1 < valor2) E ( valor1 < valor3) entao
  valor_menor <- valor1
  senao
  se (valor2 < valor1) E (valor2 < valor3) entao
  valor_menor <- nalor2
  senao
  valor_menor <- valor3
  fimse
  fimse
escreval (" O menor valor é o ", valor_menor)
escreval ("Deseja fazer outro teste? ")
escreval ("Pressione 'Enter' para continuar ou digite a palavra 'não' para encerrar.")
leia (resposta)
ate (resposta ="não")
// Seção de Comandos
fimalgoritmo
