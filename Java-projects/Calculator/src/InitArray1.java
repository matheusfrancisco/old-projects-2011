
// Inicializando os elementos de um array  com um inicialixador da array.

public class InitArray1 
{
    public static void main(String args [] )
    {
        // lista de inicializadores especificava o valor de cada elemento 
        int array[] = { 32, 27, 64,18,95, 14, 90, 70, 60, 37};
        System.out.printf( "%s%8s\n", "Inicio", "Valor" ); // titulos de coluna 
        
        // Gera saida do valor de cada elemnto array
        for ( int counter = 0; counter < array.length; counter++ )
            System.out.printf( "%5d%8d\n", counter, array[ counter ] );
        } // fim de main
} // fim da classe InitArray1
