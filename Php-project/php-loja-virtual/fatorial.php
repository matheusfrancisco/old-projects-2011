<HTML>
<HEAD>
 <TITLE>Fatorial</TITLE>
</HEAD>
<BODY>
<?php

function fatorial ($numero)
{
 If ($numero < 0)
 {return -1; }
 
 If ($numero <= 1)
 {return 1; }
 
 return $numero*fatorial($numero-1);
}

echo "O fatorial de 3 � ".Fatorial (3);
echo "<br>O fatorial de 4 � ".Fatorial (4);
echo "<br>O fatorial de 5 � ".Fatorial (5);
?>
</BODY>
</HTML>
