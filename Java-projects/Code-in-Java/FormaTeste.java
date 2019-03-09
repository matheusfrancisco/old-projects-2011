
 // Aplicativo de teste que exibe a classe Formas.
 import javax.swing.JFrame;
 import javax.swing.JOptionPane;
 
 public class FormaTeste
 {
	public static void main(String[] args)
	{
		// obt�m a escolha do usu�rio
		String input = JOptionPane.showInputDialog(
		"Tecle 1 para exibir ret�ngulos\n" +
		"Tecle 2 para exibir Ovais");
		
		int escolha = Integer.parseInt( input ); // converte a entrada em int
		
		// cria o painel com a entrada do usu�rio
		Formas panel = new Formas ( escolha );
		
		JFrame application = new JFrame(); // cria um novo Jframe
		
		application.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
		application.add( panel ); // adiciona o painel ao frame
		application.setSize( 300, 300 ); // configura o tamanho dessejado
		application.setVisible( true ); // mostra o frame
	} // fim de main
} // fim da classe FormasTeste