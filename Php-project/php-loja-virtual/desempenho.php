<HTML>
<HEAD>
 <TITLE>Documento PHP</TITLE>
</HEAD>
<BODY>
<?php
    $prova1 = 7;
    $prova2 = 5;

    $nota = ($prova1+$prova2)/2;

    if ($nota<3)
        $desempenho = "P�SSIMO";
    elseif ($nota<5)
        $desempenho = "RUIM";
    elseif ($nota<7)
        $desempenho = "M�DIO";
    elseif ($nota<9)
        $desempenho = "BOM";
    else
        $desempenho = "EXCELENTE";

    echo "O seu desempenho foi $desempenho";
?>
</BODY>
</HTML>
