
// M�todo fatorial recursivo

public class CalcularFatorial 
{
    // m�todo recursivo fatorial
    public long fatorial( long numero )
    {
        if ( numero <= 1)// testa caso b�sico
            return 1; // casos b�sicos: 0!= 1e 1! = 1
        else // passo de recursao
            return numero * fatorial(numero -1 );
    } // fim do m�todo fatorial
    
    // fera saida de fatoriais para valores 0-10
    public void displayFatoriais()
    {
        // calcula o fatorial de 0 a 10
        for ( int contador = 0; contador <= 10; contador++ )
            System.out.printf( "%d! = %d\n", contador, fatorial( contador ));
    } // fim do m�todo displayFatoriais
    } // fim da calsse calcularfatorial
