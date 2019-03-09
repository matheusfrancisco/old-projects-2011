
	// Programa de subtração que utiliza JOptionPane para entrada e saida
	import javax.swing.JOptionPane; // programa utiliza JOptionPane
	
	public class Subtracao
	{
		public static void main(String[] args)
		{
			// obtém a entrada de usuário a partir dos diálogos de entrada JOptionPane
			String primeiroNumero =
				JOptionPane.showInputDialog ("Digite o primeiro número: ");
			String segundoNumero =
				JOptionPane.showInputDialog ("Digite o segundo número: ");
				
			// converte String em valores int para utilização em um cálculo
			int numero1 = Integer.parseInt (primeiroNumero);
			int numero2 = Integer.parseInt (segundoNumero);
			
			int sub = numero1 - numero2; // subtrai os nnúmeros
			
			// exibe o resultado em um dialogo de mensagem JOptionPane
			JOptionPane.showMessageDialog(null, " O valor da subtração é: "+ sub,
			"Subtração de dois inteiros", JOptionPane.ERROR_MESSAGE);
		} // fim do método main
	} // fim da classe Subtracao