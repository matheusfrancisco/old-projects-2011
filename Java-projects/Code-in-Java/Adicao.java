
// Programa de adi��o que exibe a soma de dois n�meros.
import java.util.Scanner; // programa utiliza a classe de Scanner

	public class Adicao
	{
		// cria Scanner para obter entrada a partir da janela de comando
		Scanner input = new Scanner(System.in);
		
		int numero1; // primeiro numero a somar
		int numero2; // segundo numero a somar
		int soma; // soma de numero1 e numero2
		
		System.out.print("Digite o primeiro numero: "); //prompt
		numero2 = input.nextInt(); // l� o segundo n�mero fornecido pelo usu�rio
		
		soma = numero1 + numero2; // soma os numeros
		
		System.out.println("A soma e: "+Integer.tosString(soma)); // exibe a soma
		
		} // fim do metodo principal
		
	} // fim da classe Adicao