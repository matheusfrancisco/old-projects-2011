<?php
session_start(); //inicia a sess�o
if(!isset($_SESSION["login"])) //verifica se ha dados ativos na sess�o
{
//caso nao exista dados registrados exige login
header("Location: login.php"); //redireciona para o arquivo "Login.php"
exit;
}
?>

<?php
     include "topoadmin.php"; //inclui o arquivo topoadmin
?>

<?php
     require_once('../Connection/conexao.php'); //inclui o arquivo "conexao.php"
?>

<?php
//filtra os dados informados pelo usuario
function GetSQlValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "")
{



 $theValue = (!get_magic_quotes_gpc()) ? addslashes($theValue) : $theValue;
 
 switch ($theType) { //compara a variavel com os diversos valores ate encotrar a condi�ao verdadeira
        case "text":
             $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
             break;//quebra o fluxo do codigo, para imediatamente a execu�ao do la�o
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
//PHP_SELF - serve para indicar o endere�o do script em execu��o

$edicao = $_SERVER['PHP_SELF'];/* edita o script em execu��o significa q vai executar os comandos no
mesmo arquivo*/

if (isset($_SERVER['QUERY_STRING'])) { //verifica se ha variaveis criadas pelo servidor web
   $edicao .= "?" . $_SERVER['QUERY_STRING']; //retorna os dados da url que foi acessada
}
//verifica se ha dados ativos os quais foram digitados no form1
if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {

   //insere os dados na tabela categorias
   $insercaoSQL = sprintf("INSERT INTO categorias (nome_cat) VALUES (%s)",
                GetSQLValueString($_POST['nome_cat'], "text")); //filtra os dados do array
                
   mysql_select_db($database_conexao, $conexao); //seleciona o banco de dados MySQL
   
   
   
   $Resultado = mysql_query($insercaoSQL, $conexao) or die(mysql_error());
   
   //atribui a url a variavel $insercao
   $inserir = "cad_categorias.php";
   
   if (isset($_SERVER['QUERY_STRING'])) { //verifica se ha variaveis criadas pelo servidor web

      //retorna a posi�ao da primeira ocorrencia de uma variavel
      $inserir .= (strpos($inserir, '?')) ? "&" : "?";
      
      $inserir .= $_SERVER['QUERY_STRING']; //retorna os dados da url que foi acessada
   }
   echo "<br>";
   echo "<center><font face='verdana' size='2'><b>Opera��o realizada com sucesso!</b></font></center>";
   exit;
}
?>
<HTML>
<HEAD>
<TITLE>ADMINISTRA��O</TITLE>
</HEAD>
<BODY>
<font face="verdana" size="2">
<p>
<div align="center"><font face="verdana" size="2"><b>Cadastro de categorias:</b></font></div>
<form name="form1" method="POST" action="<?php echo $edicao; ?>">
      <table width="35%" border="1" align="center" cellpadding="2" cellspacing="2" bgcolor="#F2F2F2">
             <tr>
                 <td width="55%"><div align="right"><font face="verdana" size="2"><b>Nome da categoria:
                 </b></font></div></td>
                 <td width="45%"><div align="center"><input name="nome_cat" type="text"></div></td>
             </tr>
             <tr>
                 <td colspan="2"><div align="center">
                     <input type="Image" name="submit" src="../figuras/botaoenviar.gif">
                 </div></td>
             </tr>
      </table>
      <input type="hidden" name="MM_insert" value="form1">
</form>
</font>
</BODY>
</HTML>
