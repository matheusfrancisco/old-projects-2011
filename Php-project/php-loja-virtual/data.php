<HTML>
<HEAD>
 <TITLE>Loja Virtual</TITLE>
</HEAD>
<BODY>
<font face="arial" size="1"><b>
<?php
//busca o dia em que estamos
$dia = date("l");//l (minuscula 'L') - dia da semana

/*depois verifica em que dia estamos e transforma-o em portugues, pois
o retorno da funçao date("l") esta em Inglês */
switch($dia)
{
case "Monday":
$dia_port = "Segunda-Feira";
break;
case "Tuesday":
$dia_port = "Terça-Feira";
break;
case "Wednesday":
$dia_port = "Quarta-Feira";
break;
case "Thursday":
$dia_port = "Quinta-Feira";
break;
case "Friday":
$dia_port = "Sexta-Feira";
break;
case "Saturday":
$dia_port = "Sábado";
break;
case "Sunday":
$dia_port = "Domingo";
break;
}

//busca o mes em que estamos
$mes = date("n");

/*é necessario verificar tambem o mes em portugues e fazer a respectiva
atribuição*/
switch($mes)
{
case "1":
$mes_port = "Janeiro";
break;
case "2":
$mes_port = "Fevereiro";
break;
case "3":
$mes_port = "Março";
break;
case "4":
$mes_port = "Abril";
break;
case "5":
$mes_port = "Maio";
break;
case "6":
$mes_port = "Junho";
break;
case "7":
$mes_port = "Julho";
break;
case "8":
$mes_port = "Agosto";
break;
case "9":
$mes_port = "Setembro";
break;
case "10":
$mes_port = "Outubro";
break;
case "11":
$mes_port = "Novembro";
break;
case "12":
$mes_port = "Dezembro";
break;
}

/*depois de se ter o dia e o mes em portugues, basta mostrar a data da
forma desejada */
echo ($dia_port);
echo (", ");
echo (date("d")); //d - dia do mes, 2 digitos com zeros á esquerda
echo (" de ");
echo ($mes_port);
echo (" de ");
echo (date("Y")); // Y - ano

?>
</BODY>
</HTML>
