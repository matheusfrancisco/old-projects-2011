
// um aplicativo que tenta dividir por zero.
import java.util.InputMismatchException;
import java.util.Scanner;

public class DividirZero1 
{
    // demonstra o lancamento de uma exceçao quando ocorre uma divisao por zero
    public static int quociente(int numerador, int denominador)
    throws ArithmeticException
    {
        return numerador / denominador; // possivel divisao por zero
    }// fim do método quociente
    
    public static void main ( String args[] )
    {
        Scanner scanner = new Scanner(System.in ); // scanner para entrada
        boolean continueLoop = true; // determina se mais entradas sao necessarias
        
        do
        {
           try 
           {
        System.out.println(" Por Favor insira um numerador inteiro: ");
        int numerador =  scanner.nextInt();
        System.out.println(" Por Favor insira um denominador inteiro: ");
        int denominador =  scanner.nextInt();
        
        int resultado = quociente(numerador, denominador);
        System.out.printf("\nResultado: %d / %d = %d\n", numerador, 
                denominador, resultado);
        continueLoop = false; // entrada bem-sucedida; fim de loop
           } // fim de try
           catch ( InputMismatchException inputMismatchException )
           {
               System.err.printf( " \nExcecção: %s\n",
                       inputMismatchException );
               scanner.nextLine(); // descarta a entrada para o usuario tentar novamente
               System.out.println(
                       "Voce tem que entra com numeros inteiros. Por favor tente novamente.\n");
           } // fim de catch
           catch ( ArithmeticException arithmeticException )
           {
               System.err.printf("\nExcecção: %s\n", arithmeticException );
               System.out.println(
                       "Zero é um denominador invalido. Por favor tente novamente.\n");
           } // fim de catch
    } while( continueLoop );  // fim de do...while
    } // fim de main
} // fim da classe dividirzero1
