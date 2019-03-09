 
 // Cria e manipula um objeto Conta
 import java.util.Scanner;
 
 public class ContaTeste
 {
	// m�todo principal inicia a execu��o do aplicativo Java
	public static void main(String[] args)
	{
		Conta conta1 = new Conta(50.00); // cria o objeto Conta 
		Conta conta2 = new Conta(-7.53); // cria o objeto COnta
		
		// exibe o saldo inicial de cada objeto
		System.out.printf("conta1 balanco: R$%.2f\n",
					conta1.getBalanco());
		System.out.printf("conta2 balanco: R$%.2f\n\n",
					conta2.getBalanco());
					
		// cria Scanner para obter entrada a partir da janela de comando
		Scanner input = new Scanner(System.in);
		double depositoQuantia; // quantia do deposito lida do usu�rio
		
		System.out.print("Entre com a quantia do deposito para conta1: "); // prompt
		depositoQuantia = input.nextDouble(); // obt�m a entrada de usu�rio
		System.out.printf("\nAcrescentando %.2f no saldo da conta1\n\n",
			depositoQuantia);
		conta1.credito(depositoQuantia); // adiciona o saldo de conta1
		
		// exibe os saldos 
		System.out.printf("Balanco Conta1: R$%.2f\n",
			conta1.getBalanco());
		System.out.printf("Balanco conta2: R$%.2f\n",
			conta2.getBalanco());
			
		System.out.print("Entre com a quantia do deposito para conta2: "); //prompt
		depositoQuantia = input.nextDouble(); // obt�m a entrada de usu�rio
		System.out.printf("\nAcrescentando %.2f no saldo da conta2\n\n",
			depositoQuantia);
		conta2.credito(depositoQuantia); // adiciona o saldo de conta2
		
		// exibe os saldos 
		System.out.printf("Balanco Conta1: R$%.2f\n",
			conta1.getBalanco());
		System.out.printf("Balanco conta2: R$%.2f\n",
			conta2.getBalanco());
			} // fim de main
			
	} // fim da classe ContaTeste