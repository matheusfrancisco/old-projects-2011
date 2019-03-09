
 // Demostra o desenho de diferentes formas.
 import java.awt.Graphics;
 import javax.swing.JPanel;
 
 public class Formas extends JPanel
 {
	private int escolha; // escolha do usu�rio de qual forma desenhar
	
	// construtor configura a escolha do usu�rio
	public Formas( int usuarioEscolha )
	{
		escolha = usuarioEscolha;
	} // fim do construtor Formas
	
	// desenha uma cascata de formas que iniciam do canto superior  esquerdo
	public void paintComponent(Graphics g )
	{
		super.paintComponent(g );
		
		for ( int i = 0; i < 10; i++)
		{
			// seleciona a forma com a base na escolha do usu�rio
			switch ( escolha )
			{
			case 1: // desenha ret�ngulos
				g.drawRect(10 + i * 10, 10 + i * 10,
				        50 + i * 10, 50 + i * 10);
				break;
			} // fim do switch
		} // fim do for
	} // fim do m�todo paintComponent
} // fim da calsse formas