public class Retirada
 {
	private double balanco; // variavel de instancia que armazena o saldo
	
	// construtor 
	public Retirada (double inicialBalanco)
	{
		// valida que inicialBalanco � maior que 0.0
		// se nao, o saldo � inicializado como o valor padrao 0.0
		if (inicialBalanco > 0.0)
			balanco = inicialBalanco;
		} // fim do construtor Conta
		
		// credita (retira) uma quantia � conta
		public void debito(double quantia)
		{
			balanco = balanco - quantia; // retira quantia ao saldo
	    } // fim do m�todo credito
		
		// retorna o saldo da conta
		public double getBalanco()
		{
			return balanco; // fornece o valor de saldo ao m�todo chamador
		} // fim do m�todo getBalanco
		
	} // fim da clase Conta