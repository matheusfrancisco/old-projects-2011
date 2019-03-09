
// rola um dado de seis lados 6000vezes
import java.util.Random;

public class RollDie 
{
 public static void main ( String args[])
 {
     Random randomNumbers = new Random(); // gerador de numero aleatorio
     int frequency[] = new int[ 7 ]; // array de contadores de frequencia
     
     // lança os dados 6000 vezes; utiliza o valor do dado como indice de frequncia
     for ( int roll = 1; roll<= 6000; roll++)
         ++frequency[ 1 + randomNumbers.nextInt( 6 )];
     
     System.out.printf( " %s%10s \n", "Face", "Frequency");
     
     // Gera saida do valor de cada elemento do array
     for ( int face = 1; face < frequency.length; face++ )
         System.out.printf( "%4d%10d\n", face, frequency[ face ]);
        
    } // fim main
 
    
} // fim classe
