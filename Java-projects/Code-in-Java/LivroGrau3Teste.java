
 // Contrutor LivroGrau3 utilizado para especificar o nome do curso na
 // hora em que cada objeto LivroGrau3 é criado.
 
 public class LivroGrau3Teste
 {
	// método main inicia a execução do programa
	public static void main(String[] args)
	{
		// cria objeto LivroGrau3
		LivroGrau3 livroGrau1 = new LivroGrau3(
		"01 Introducao de Programacao em Java");
		LivroGrau3 livroGrau2 = new LivroGrau3 (
		"02 Dados e Estruturas em Java");
		
		// exibe o valor inicial de Nomecurso para cada Livrograu3
		System.out.printf("livroGrau1 nome do curso e: %s\n",
			livroGrau1.getNomeCurso());
		System.out.printf("livroGrau2 Nome do curso e: %s\n",
			livroGrau2.getNomeCurso());
		} // fim método main 
		
		} // fim da classe LivroGrau3Teste