
 // Classe LivroGrau3 com um construtor para inicalizar o nome de um curso
 
 public class LivroGrau3
 {
 private String Nomecurso; // nome do curso para esse LivroGrau3
 
 // contrutor inicaliza Nomecurso com String fornecida com argumento
 public LivroGrau3(String nome)
 {
	Nomecurso = nome; // inicializa Nomecurso
	} // termina construtor
	
	// m�todo para configurar o nome do curso
	public void setNomeCurso(String nome)
	{
		Nomecurso = nome; // armazena o nome do curso 
	} // termina o m�todo setNomeCurso
	
	// m�todo para recuperar o nome do curso
	public String getNomeCurso()
	{
		return Nomecurso;
	} // termina o m�todo getNomeCurso
	
	} // fim da classe LivroGrau3