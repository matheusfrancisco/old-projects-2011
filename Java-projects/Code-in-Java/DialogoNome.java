 
 // Entrada básica com uma caixa de diálogo
 import javax.swing.JOptionPane;
 
 public class DialogoNome
 {
	public static void main(String[] args)
	{
		// pede para o usuário inserir seu nome
		String nome =
		JOptionPane.showInputDialog("Qual seu nome?" );
		
	// cria a mensagem
	String mensagem =
		String.format("Bem Vindo, %s a Programação Java !", nome);
	
		// exibe a mensagem para cumprimentar o usuário pelo nome 
		JOptionPane.showMessageDialog(null, mensagem);
	} // fim de main
} // termina DialogoNome