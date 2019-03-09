
 // Classe LivroGrau4 que resolve o problema da m�dia da classe utilizando
 // repeti��o controlada por contador.
 import java.util.Scanner; // programa utiliza a classe Scanner
 
 public class LivroGrau4
 {
	private String nomeCurso; // nome do curso que essa livrograu4 representa
	
	//contrutor inicializa nomeCurso
	public LivroGrau4(String nome)
	{
		nomeCurso = nome; // inicializa nomeCurso
	} // fim do construtor
	
	// m�todo para configurar o nome do curso
	public void setNomeCurso(String nome)
	{
		nomeCurso = nome; // armazena o nome do curso
	} // fim do m�todo setNomeCurso
	
	// m�todo para recuperar o nome do curso
	public String getNomeCurso()
	{
		return nomeCurso;
	} // fim do m�[etodo getNomeCurso
	
	// exibe uma mensagem de boas-vindas para o usu�rio LivroGrau4
	public void displayMessage()
	{
		// getNomeCurso obt�m o nome do Curso 
		System.out.printf("Bem - Vindo ao Livro de Grau\n%s!\n\n",
				getNomeCurso());
	} // fim do m�todo displayMessage
	
	// determina a m�dia da classe com base em 10 notas inseridas pelo usu�rio
	public void determineClasseAverage()
	{
		// cria Scanner para obter entrada a partir da janela de comando
		Scanner input = new Scanner(System.in);
		
		int total; // soma das notas inseridas pelo usu�rio
		int contadorNota; // n�mero da nota a ser inserida a seguir
		int nota; // valor da nota inserida pelo usu�rio
		int media; // m�dia das notas
		
		// fas de processamento
		total =0; // inicializa o total
		contadorNota = 1; // inicializa o contador de loops
		
		// fase de inicializa��o 
		while (contadorNota <= 10) // faz o loop 10 vezes
		{
			System.out.print("Entre com a nota:"); // prompt
			nota = input.nextInt();// insere a proxima nota
			total = total + nota; // adiciona nota a total
			contadorNota = contadorNota + 1; // incrementa o contador 1
			} // fim do while
			
			// fase de t�rmino
			media = total / 10; //divisao de inteiros produz um resultado inteiro
			
			// exibe o total e a m�dia das notas
			System.out.printf("\nTotal de todas as  10 notas e %d\n", total);
			System.out.printf("A media da classe e %d\n", media);
		} // fim do metodo determineClasseAvarege
		
	} // fim da classe livrograu4
		