<?php
     /* a funçao require once inclui o conteudo de outro arquivo conexao.php no arquivo atual
     antes do arquivo ser executado */
     require_once('Connection/conexao.php'); //inclui o arquivo conexao.php
?>

<?php
$session_id = $_SESSION["id"];


function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "")
{



 $theValue = (!get_magic_quotes_gpc()) ? addslashes($theValue) : $theValue;
 
 switch ($theType) { //compara a variavel com os diversos valores ate encotrar a condiçao verdadeira
        case "text":
             $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
             break;//quebra o fluxo do codigo, para imediatamente a execuçao do laço
        case "long":
        case "int":
             $theValue = ($theValue != "") ? intval($theValue) : "NULL";
             break;
        case "double":
             $theValue = ($theValue != "") ? "'" . doubleval($theValue) . "'" : "NULL";
             break;
        case "date":
             $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
             break;
        case "defined":
             $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
             break;
 }
 return $theValue;
}
//verifica se ha dados arivos e se o array nao esta vazio
if ((isset($_GET['cod_compra'])) && ($_GET['cod_compra'] != "")) {


   $exclusaoSQL = sprintf("DELETE FROM compras WHERE cod_compra=%s", GetSQLValueString($_GET['cod_compra'],"int"));
   
   mysql_select_db($database_conexao, $conexao); //seleciona o banco de dados mysql
   
   
   
   $resultado = mysql_query($exclusaoSQL, $conexao) or die(mysql_error());
}
?>
<br>
<html>
<head>
<title>Loja Virtual</title>
</head>
<body>
<p align="center"><font face="verdana" size="2"><b>Produto exclu&iacute;do com sucesso!</b></font><br>
</body>
</html>

<?php
     include "carrinho2.php";//inclui o arquivo "carrinho2.php"
?>
