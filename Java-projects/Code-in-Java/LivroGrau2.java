 
 // Classe LivroGrau2 que cont�m uma variavel de instancia nomeCurso 
 // e m�todos para configurar e obter seu valor
 
 public class LivroGrau2
 {
 private String nomeCurso; // nome curso para esse LivroGrau2
 
 // m�todo para configurar o  nome do curso 
 public void setNomeCurso(String nome)
 {
     nomeCurso = nome; // armazena o nome do curso 
	 } // termina o m�todo setNomeCurso
	 
	 // m�todo para recupera o nome do curso
	 public String getNomeCurso()
	 {
		return nomeCurso;
	} // termina o m�todo getNomeCurso
	
	// exibe uma mensgm de boas-vindas para o usuario do LivroGrau2
	public void displayMessage()
	{
	
	    // essa instru��o chama gerNomeCurso para obter o 
		//nome do curso que esse LivroGrau2 representa
		System.out.printf("Bem Vindo ao Curso \n%s!\n",
				getNomeCurso());
		} // termina o m�todo displayMessage		
		
	} // fim da classe livroGrau2