
// programa de impressao de grafico de barras

public class BarChart 
{
    public static void main(String args [])
    {
        int array[] = {0 , 0, 0, 0, 0, 0, 1, 2, 4, 2, 1};
        
        System.out.println("Classificação das Notas;");
        
        // para cada elemento de array, gera saida de uma barra de gráfico
        for ( int counter = 0; counter < array.length; counter++ )
        {
            // gera saida do rotulo de barra ("00-09:" ." 100:" )
            if (counter == 10)
                System.out.printf("%5d: ", 100 );
            else
                System.out.printf( "%02d-%02d: ",
                        counter * 10, counter * 10 + 9);
            
// imprime a barra de asteriscos
            for ( int stars = 0; stars < array[ counter ]; stars++)
                System.out.print("*");
            // inicia uma nova linha de saida
            System.out.println() ;

        }// fim do for externo
    } // fim do main
   
    
}// fim da classe BarChart
