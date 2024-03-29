
// metodo recursivo para localizar todas as permutaçoes de uma string

public class Permutacao
{
    
    public void permuteString(
            String beginningString, String endingString)
    {  
        
        if (endingString.length() <= 1 )
            System.out.println( beginningString + endingString );
        else 
        {
            
            for ( int i = 0; i < endingString.length(); i++)
            {
                try
                {
                    
                    String newString = endingString.substring(0, i )+
                            endingString.substring( i + 1);
                    
                    
                    permuteString(beginningString +
                            endingString.charAt( i ), newString );
                }
                catch ( StringIndexOutOfBoundsException exception )
                {
                    exception.printStackTrace();
                }
                }
            }
    }
}

