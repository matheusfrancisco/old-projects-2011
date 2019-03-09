<HTML>
<HEAD>
 <TITLE>Documento PHP</TITLE>
</HEAD>
<BODY>
<?
      $a = 2;
      $b = 4;
      $c = 7;
      $res1 = ++$b - $a; /* a variavel $res1 recebeu o valor
      gerado pela expressão ++$b - $a */
      $res2 = $c-- + $a; /*a variavel $res2 recebeu o valor
      gerado pela expressão $c-- + $a */
      $res3 = --$a + $c++; /* a variavel $res3 recebeu o valor
      gerado pela expressao --$a + $c++ */

      //resultado das variaveis
      echo "a = $a<br> b = $b<br> c = $c<br><br>";
      echo "res1 = $res1<br> res2 = $res2<br> res3 = $res3<br>";
?>
</BODY>
</HTML>
