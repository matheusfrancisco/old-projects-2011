public class Retirada
 {
	private double balanco; // variavel de instancia que armazena o saldo
	
	// construtor 
	public Retirada (double inicialBalanco)
	{
		// valida que inicialBalanco é maior que 0.0
		// se nao, o saldo é inicializado como o valor padrao 0.0
		if (inicialBalanco > 0.0)
			balanco = inicialBalanco;
		} // fim do construtor Conta
		
		// credita (retira) uma quantia á conta
		public void debito(double quantia)
		{
			balanco = balanco - quantia; // retira quantia ao saldo
	    } // fim do método credito
		
		// retorna o saldo da conta
		public double getBalanco()
		{
			return balanco; // fornece o valor de saldo ao método chamador
		} // fim do método getBalanco
		
	} // fim da clase Conta