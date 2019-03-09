
 // Desenha duas linhas que se cruzam em um painel.
 import java.awt.Graphics;
 import javax.swing.JPanel;
 
 public class Linhas2 extends JPanel
 {
	// desenha um X a partir dos cantos do painel
	public void paintComponent(Graphics g)
	{
		// chama paintCompoment para assegurar que o painel é exibido  corretamente
		super.paintComponent( g );
		
		int width =  getWidth(); // largura total
		int height = getHeight(); // altura total
		
		// desenha uma linha a partir do canto superior esquerdo até o inferior direito
		g.drawLine(20, 0, width, height);
		g.drawLine(30, 0, width, height);
		g.drawLine(40, 0, width, height);
		g.drawLine(50, 0, width, height);
		g.drawLine(70, 0, width, height);
		g.drawLine(80, 2, width, height);
		g.drawLine(90, 3, width, height);
		g.drawLine(100, 4, width, height);
		g.drawLine(0 ,10, width, height);
		g.drawLine(120, 100, width, height);
		g.drawLine(130, 0, width, height);
		g.drawLine(140, 0, width, height);
		g.drawLine(20, 0, width, height);
		g.drawLine(20, 0, width, height);
		g.drawLine(20, 0, width, height);
		g.drawLine(20, 0, width, height);
		
	}
 }