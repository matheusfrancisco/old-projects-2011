
// Criando um array

public class InitArray 
{
        public static void main( String args[] )
        {
    int array[]; // declara o array identificado
    
    array = new int[ 10 ]; // cria o espaço para o array
    
    System.out.printf("%s%8s\n", "Índice", "Valor" ); // titulos de coluna
    
    // Gera saída do valor de cada elemento array
    for ( int counter = 0; counter < array.length; counter++ )
        System.out.printf( "%5d%8d\n", counter, array[ counter ] );
        } // fim de main
} // fim de classe InitArray
