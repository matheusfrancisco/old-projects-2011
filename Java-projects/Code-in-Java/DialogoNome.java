 
 // Entrada b�sica com uma caixa de di�logo
 import javax.swing.JOptionPane;
 
 public class DialogoNome
 {
	public static void main(String[] args)
	{
		// pede para o usu�rio inserir seu nome
		String nome =
		JOptionPane.showInputDialog("Qual seu nome?" );
		
	// cria a mensagem
	String mensagem =
		String.format("Bem Vindo, %s a Programa��o Java !", nome);
	
		// exibe a mensagem para cumprimentar o usu�rio pelo nome 
		JOptionPane.showMessageDialog(null, mensagem);
	} // fim de main
} // termina DialogoNome