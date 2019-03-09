
// calculando valores a serem colocados em elementos de um array.

public class InitArray2 
{
    public static void main( String args[] )
    {
    final int ARRAY_LENGTH = 10; // declara a constante
    int array[] = new int[ ARRAY_LENGTH ]; // cria o array
    
    // calcula o valor de cada elemento do array
    for ( int counter = 0; counter < array.length; counter++ )
        array[ counter ] = 2 + 2 * counter;
    
    System.out.printf( "%s8sa\n","Inicio","Valor"); // titulos de coluna
    
    // Gera saída do valor de cada elemento do array
    for ( int counter = 0; counter < array.length; counter++ )
        System.out.printf( "%5d%8d\n", counter, array[ counter ] );
    }// fim de main
} // fim da classe InitArray2
    
   
