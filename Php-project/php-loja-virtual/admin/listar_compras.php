<?php
session_start(); //inicia a sessão
if(!isset($_SESSION["login"])) //verifica se ha dados ativos na sessão
{
//caso nao exista dados registrados, exige login
header("Location: login.php"); //redireciona para o arquivo login.php
exit;
}
?>

<?php
     include "topoadmin.php";
?>

<?php
     require_once('../Connection/conexao.php');
?>

<?php
mysql_select_db($database_conexao, $conexao);

//realiza a busca dos dados na tabela usuarios
$consulta = "SELECT cod_usuario, nome, email, status, form_pag, data_compra FROM usuarios
          WHERE status = 'ok'";
          
          

$registro = mysql_query($consulta, $conexao) or die(mysql_error());


$linha = mysql_fetch_assoc($registro);
?>

<HTML>
<HEAD>
<TITLE>ADMINISTRAÇÃO</TITLE>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
         window.open(theURL,winName,features);
}
//-->
</script>
</HEAD>
<BODY>
<div align="center">
     <p>
        <?php
             if ($linha == 0) { //verifica se o registro esta vazio
        ?>
        
        <font face="verdana" size="2"><b>Nenhuma compra cadastrada!</b></font>
        
        <?php }
        
        ?>
<p>
</div>

<?php
     if ($linha > 0) {
?>
<table width="65%" border="1" align="center" bordercolor="#CCCCCC" bgcolor="#666666">
       <tr>
           <td colspan="5"><div align="center"><font face="verdana" size="2" color="#FFFFFF"><b>
           COMPRAS:</b></font><br>
           <font face="verdana" size="1" color="#FFFFFF">Clique no link para ver os detalhes da
           compra.</font>
       </div></td>
       </tr>
       <tr>
           <td width="13%" bgcolor="#333333"><div align="center"><font face="verdana"
           color="#FFFFFF" size="1"><b>C&oacute;d. usu&aacute;rio</b></font></div></td>
           <td width="20%" bgcolor="#333333"><div align="center"><font face="verdana"
           color="#FFFFFF" size="1"><b>Nome</b></font></div></td>
           <td width="20%" bgcolor="#333333"><div align="center"><font face="verdana"
           color="#FFFFFF" size="1"><b>E-mail</b></font></div></td>
           <td width="15%" bgcolor="#333333"><div align="center"><font face="verdana"
           color="#FFFFFF" size="1"><b>Forma de pagto</b></font></div></td>
           <td width="20%" bgcolor="#333333"><div align="center"><font face="verdana"
           color="#FFFFFF" size="1"><b>Data da &uacute;ltima compra</b></font></div></td>
       <tr>
       
       <?php
            do {
       ?>
       
       <tr>
           <td bgcolor="#F1F1F1"><div align="center"><font face="verdana" size="1">
           <?php echo $Linha['cod_usuario']; ?>
           </font></div></td>
           <td bgcolor="#F1F1F1"><div align="center"><font face="verdana" size="1">
           <?php echo $Linha['nome']; ?>
           </font></div></td>
           <td bgcolor="#F1F1F1"><div align="center"><font face="verdana" size="1">
           <?php echo $Linha['email']; ?>
           </font></div></td>
           <td bgcolor="#F1F1F1"><div align="center"><font face="verdana" size="1">
           <?php echo $Linha['form_pag']; ?>
           </font></div></td>
           <td bgcolor="#F1F1F1"><div align="center"><font face="verdana" size="1">
           <?php echo $Linha['data_compra']; ?>
           </font></div></td>
       </tr>
       <tr>
           <td colspan="5" bgcolor="#F1F1F1">
               <div align="center" onClick="MM_openBrWindow('listar_detalhes.php?cod_usuario=<?php
               echo $linha['cod_usuario']; ?>','','')"><a href="javascript:;">
               <font face="verdana" size="2"><b>Ver detalhes:</b></font></a></div></td>
       </tr>
       <tr>
           <td colspan="5" bgcolor="#F1F1F1">&nbsp;</td>
       </tr>
       <?php }

             while ($Linha = mysql_fetch_assoc($registro)); ?>
</table>

<?php }

?>
</BODY>
</HTML>

<?php

     mysql_free_result($registro);
?>
