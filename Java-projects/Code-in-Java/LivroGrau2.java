 
 // Classe LivroGrau2 que contém uma variavel de instancia nomeCurso 
 // e métodos para configurar e obter seu valor
 
 public class LivroGrau2
 {
 private String nomeCurso; // nome curso para esse LivroGrau2
 
 // método para configurar o  nome do curso 
 public void setNomeCurso(String nome)
 {
     nomeCurso = nome; // armazena o nome do curso 
	 } // termina o método setNomeCurso
	 
	 // método para recupera o nome do curso
	 public String getNomeCurso()
	 {
		return nomeCurso;
	} // termina o método getNomeCurso
	
	// exibe uma mensgm de boas-vindas para o usuario do LivroGrau2
	public void displayMessage()
	{
	
	    // essa instrução chama gerNomeCurso para obter o 
		//nome do curso que esse LivroGrau2 representa
		System.out.printf("Bem Vindo ao Curso \n%s!\n",
				getNomeCurso());
		} // termina o método displayMessage		
		
	} // fim da classe livroGrau2