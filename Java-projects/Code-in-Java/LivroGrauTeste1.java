
	// cria um objeto livrograu e chama seu DisplayMessage

	import java.util.Scanner; // programa utiliza Scanner
	
	public class LivroGrauTeste1
	{
	// método main inicia a execução de programa
	public static void main(String[] args)
	{
		// cria um objeto Livro e o atribui a meuLivroGrau
		Scanner input = new Scanner(System.in);
		
		//cria um objeto LivroGrau e o atribui a meuLivroGrau
			 LivroGrau1 meuLivroGrau = new LivroGrau1();

		// prompt para entrada do nome do curso
		System.out.println("Por favor digite o nome do Curso: ");
		String nameOfcourse = input.nextLine(); // lê uma linha de texto
		System.out.println(); // fera saida de uma linha em branco 
		
		// chama método displayMessage de meu LivroGrau
		// e passa nameofCourse como um argumento
		meuLivroGrau.displayMessage(nameOfcourse);
	 } // fim de main
	 
	} // fim da classe LivroGrauTeste1
		