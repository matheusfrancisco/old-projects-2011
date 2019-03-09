
 // testando o metodo recursivo para permutar strings
import java.util.Scanner;

public class PermutacaoTeste
{
    public static void main( String args [] )
    {
       Scanner scanner = new Scanner(System.in);
       Permutacao permutacaoObjeto = new Permutacao();
       
       System.out.print("Enter a string: ");
       String input = scanner.nextLine(); // recupera String a permutar
       
       // permuta String
       permutacaoObjeto.permuteString("", input );
       
       
    }
    
    }
