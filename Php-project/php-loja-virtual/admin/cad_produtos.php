<?php
session_start();
if(!isset($_SESSION["login"]))
{

header("Location: login.php");
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

$consulta = "SELECT cod_cat, nome_cat FROM categorias";


$registro = mysql_query($consulta, $conexao) or die(mysql_error());


$linha = mysql_fetch_assoc($registro);
?>

<HTML>
<HEAD>
<TITLE>ADMINISTRAÇÃO</TITLE>
</HEAD>
<BODY>
<p><div align="center"><font face="verdana" size="2"><b>Cadastro de Produtos:</b></font><br>
<form name="form1" method="post" action="cad_produtos2.php">
<table width="50%" border="1" cellspacing="2" cellpadding="2" bgcolor="#F2F2F2">
       <tr>
           <td><div align="right"><font face="verdana" size="2"><b>Categoria:</b></font></div></td>
           <td><select name="cod_cat">
<?php
     do {
?>
  <option value="<?php echo $linha['cod_cat']?>"><?php echo $linha['nome_cat']?></option>
  <?php
  }

 while ($linha = mysql_fetch_assoc($registro));
 
 
 $resultado = mysql_num_rows($registro);
 
 if($resultado > 0) {
 
 mysql_data_seek($registro, 0);
 
 
               $linha = mysql_fetch_assoc($registro);
               }
               ?>
               </select></td>
 </tr>
 <tr>
     <td width="35%"><div align="right"><font face="verdana" size="2"><b>Nome:</b></font>
     </div></td>
     <td width="65%"><input name="nome_prod" type="text"></td>
 </tr>
 <tr>
     <td><div align="right"><font face="verdana" size="2"><b>Descri&ccedil;&atilde;o:</b>
     </font></div></td>
     <td><textarea name="descricao" rows="5"></textarea></td>
 </tr>
 <tr>
     <td><div align="right"><font face="verdana" size="2"><b>Valor:</b></font></div></td>
     <td><input name="valor" type="text" size="4"> ,00</td>
 </tr>
 <tr>
     <td><div align="right"><font face="verdana" size="2"><b>Destaque:</b></font></div></td>
     <td><select name="destaque" size="1">
                 <option selected>selecione</option>
                 <option value="sim">sim</option>
                 <option value="nao">n&atilde;o</option>
                 </select></td>
 </tr>
 <tr>
     <td colspan="2"><div align="center">
     <input type="image" name="submit" src="../figuras/botaoenviar.gif" ></div></td>
 </tr>
</table>
</form></div>
</BODY>
</HTML>
<?php
mysql_free_result($registro);
?>
