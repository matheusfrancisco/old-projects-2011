
 // aplicativo para exibir linhas.
 import javax.swing.JFrame;
 
 public class Linhas22
 {
	public static void main(String[] args)
	{
		// crua um painel que contém nosso desenho
		Linhas2 panel = new Linhas2 ();
		
		// cria um novo frame para armazenar o painel
		JFrame application = new JFrame();
		
		// configura o frame para ser encerrado quando ele é fechado
		application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		application.add( panel ); // adiciona o painel ao frame
		application.setSize( 250, 250 ); // configura o tamanho do frame 
		application.setVisible( true ); // torna o frame visivel
	}
	
}