<?php
     include "topoadmin.php";
?>

<?php
     require_once('../Connection/conexao.php');
?>

<?php
//filtra os dados informados pelo usuario
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "")
{



 $theValue = (!get_magic_quotes_gpc()) ? addslashes($theValue) : $theValue;
 
 switch ($theType) { //compara a variavel com os diversos valores até encontrar a condição verdadeira
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
//verifica se ha dados ativos e se o array nao esta vazio
if ((isset($_GET['cod_cat'])) && ($_GET['cod_cat'] != "")) {

   //realiza a deleção na tabela categorias
   $deleteSQL = sprintf("DELETE FROM categorias WHERE cod_cat=%s",
              GetSQLValueString($_GET['cod_cat'], "int")); //filtra os dados do array
              
   mysql_select_db($database_conexao, $conexao); //seleciona o banco de dados mysql
   
   
   
   $Resultado = mysql_query($deleteSQL, $conexao) or die(mysql_error());
   
   
   $deleteGoTo = "excluir_categorias.php";
   
   if (isset($_SERVER['QUERY_STRING'])) {
   
   
      $deleteGoTo .= (strpos($deleteGoTo, '?')) ? "&" : "?";
      
      $deleteGoTo .= $_SERVER['QUERY_STRING'];
   }
   echo "<br>";
   echo "<center><font face='verdana' size='2'><b>Operação realizada com sucesso!</b></font></center>";
}
?>
<html>
<head>
<title>ADMINISTRAÇÃO</title>
</head>
<body>
<font face="verdana" size="2"></font>
</body>
</html>
