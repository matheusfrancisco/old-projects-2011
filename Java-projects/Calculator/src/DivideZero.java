
// um aplicativo que tenta dividir por zero.
import java.util.Scanner;

public class DivideZero 
{
    // demonstra o lancamento de uma exceçao quando ocorre uma divisao por zero
    public static int quociente(int numerador, int denominador)
    {
        return numerador / denominador; // possivel divisao por zero
    }// fim do método quociente
    
    public static void main ( String args[] )
    {
        Scanner scanner = new Scanner(System.in ); // scanner para entrada
        
        System.out.println(" Por Favor insira um numerador inteiro: ");
        int numerador =  scanner.nextInt();
        System.out.println(" Por Favor insira um denominador inteiro: ");
        int denominador =  scanner.nextInt();
        int resultado = quociente(numerador, denominador);
        System.out.printf(
                "\nResultado: %d / %d = %d\n", numerador, denominador, resultado);
    }
}
