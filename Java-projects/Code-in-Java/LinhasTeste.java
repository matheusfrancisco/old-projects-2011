
 // aplicativo para exibir linhas.
 import javax.swing.JFrame;
 
 public class LinhasTeste
 {
	public static void main(String[] args)
	{
		// crua um painel que cont�m nosso desenho
		Linhas panel = new Linhas ();
		
		// cria um novo frame para armazenar o painel
		JFrame application = new JFrame();
		
		// configura o frame para ser encerrado quando ele � fechado
		application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		application.add( panel ); // adiciona o painel ao frame
		application.setSize( 250, 250 ); // configura o tamanho do frame 
		application.setVisible( true ); // torna o frame visivel
	}
	
}
	
