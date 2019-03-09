
// Método fatorial recursivo

public class CalcularFatorial 
{
    // método recursivo fatorial
    public long fatorial( long numero )
    {
        if ( numero <= 1)// testa caso básico
            return 1; // casos básicos: 0!= 1e 1! = 1
        else // passo de recursao
            return numero * fatorial(numero -1 );
    } // fim do método fatorial
    
    // fera saida de fatoriais para valores 0-10
    public void displayFatoriais()
    {
        // calcula o fatorial de 0 a 10
        for ( int contador = 0; contador <= 10; contador++ )
            System.out.printf( "%d! = %d\n", contador, fatorial( contador ));
    } // fim do método displayFatoriais
    } // fim da calsse calcularfatorial
