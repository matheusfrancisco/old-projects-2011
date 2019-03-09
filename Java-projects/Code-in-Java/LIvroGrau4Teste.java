
 // cria o objeto da classe LivroGrau4 e invoca seu método determineClasseAverage
 
 public class LivroGrau4Teste
 {
	public static void main(String[] args)
	{
		// cria objeto meuLivroGrau da Classe LivroGrau4 e
		// passa o nome do curso para o construtor
		LivroGrau4 meuLivroGrau = new LivroGrau4(
		"01 - Introducao a PRogramacao Java");
		
		meuLivroGrau.displayMessage(); // exibe a mensagem de boas-vindas
		meuLivroGrau.determineClasseAverage(); // calcula a média das 10 notas
	} // fim de mains
	
 } // fim da classe LivroGrau4Teste