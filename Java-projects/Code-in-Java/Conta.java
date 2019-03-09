 
 // classe conta com um construtor para
 // inicializar a variavel de instancia balanco
 
 public class Conta
 {
	private double balanco; // variavel de instancia que armazena o saldo
	
	// construtor 
	public Conta (double inicialBalanco)
	{
		// valida que inicialBalanco � maior que 0.0
		// se nao, o saldo � inicializado como o valor padrao 0.0
		if (inicialBalanco > 0.0)
			balanco = inicialBalanco;
		} // fim do construtor Conta
		
		// credita (adiciona) uma quantia � conta
		public void credito(double quantia)
		{
			balanco = balanco + quantia; // adiciona quantia ao saldo
	    } // fim do m�todo credito
		
		// retorna o saldo da conta
		public double getBalanco()
		{
			return balanco; // fornece o valor de saldo ao m�todo chamador
		} // fim do m�todo getBalanco
		
	} // fim da clase Conta
		