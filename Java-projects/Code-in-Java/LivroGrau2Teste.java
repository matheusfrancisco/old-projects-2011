
	// Cria e manipula um objeto LivroGrau2.
	import java.util.Scanner; // Programa Utiliza scanner
	
	public class LivroGrau2Teste
	{
		// método main inicia a execução do programa
		public static void main(String [] args)
		{
				// criar Scanner para obter entrada a partir da janela de comando
		Scanner input = new Scanner (System.in);
		
		//cria um objeto LivroGrau2 e o atribui a meu LivroGrau
		LivroGrau2 meuLivroGrau = new LivroGrau2 ();
				
		// exibe o valor inicial de nomeCurso
		System.out.printf(" Nome do Curso inicial é: %s\n\n",
			meuLivroGrau.getNomeCurso());
			
		// solicita e lê o  nome do curso
		System.out.println("Digite o nome do Curso: ");
		String theNome = input.nextLine(); // lê uma linha de texto
		meuLivroGrau.setNomeCurso (theNome); // configura o nome do curso
		System.out.println(); // gera saida de uma linha em branco

			// exibe mensagem de boas-vindas depois de especificar nome do curso
			meuLivroGrau.displayMessage();
		} // fim de main
		
	} // fim de classe LivroGrauTeste2