
	// Programa de subtra��o que utiliza JOptionPane para entrada e saida
	import javax.swing.JOptionPane; // programa utiliza JOptionPane
	
	public class Subtracao
	{
		public static void main(String[] args)
		{
			// obt�m a entrada de usu�rio a partir dos di�logos de entrada JOptionPane
			String primeiroNumero =
				JOptionPane.showInputDialog ("Digite o primeiro n�mero: ");
			String segundoNumero =
				JOptionPane.showInputDialog ("Digite o segundo n�mero: ");
				
			// converte String em valores int para utiliza��o em um c�lculo
			int numero1 = Integer.parseInt (primeiroNumero);
			int numero2 = Integer.parseInt (segundoNumero);
			
			int sub = numero1 - numero2; // subtrai os nn�meros
			
			// exibe o resultado em um dialogo de mensagem JOptionPane
			JOptionPane.showMessageDialog(null, " O valor da subtra��o �: "+ sub,
			"Subtra��o de dois inteiros", JOptionPane.ERROR_MESSAGE);
		} // fim do m�todo main
	} // fim da classe Subtracao