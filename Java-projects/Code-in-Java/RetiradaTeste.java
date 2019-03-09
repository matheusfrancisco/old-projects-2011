// Cria e manipula um objeto Conta
 import java.util.Scanner;
 
 public class RetiradaTeste
 {
	// m�todo principal inicia a execu��o do aplicativo Java
	public static void main(String[] args)
	{
		Retirada conta1 = new Retirada(2000.00); // cria o objeto Conta 
		
		
		// exibe o saldo inicial de cada objeto
		System.out.printf("conta1 balanco: R$%.2f\n",
					conta1.getBalanco());
	
					
		// cria Scanner para obter entrada a partir da janela de comando
		Scanner input = new Scanner(System.in);
		double retiradaQuantia; // quantia da retirada lida do usu�rio
		
		System.out.print("Entre com a quantia da retirada  para conta1: "); // prompt
		retiradaQuantia = input.nextDouble(); // obt�m a entrada de usu�rio
		
		conta1.debito(retiradaQuantia); // Retira  o saldo de conta1
		
		// exibe os saldos 
		System.out.printf("Balanco Conta1: R$%.2f\n",
			conta1.getBalanco());
		
			
			} // fim de main
			
	} // fim da classe ContaTeste