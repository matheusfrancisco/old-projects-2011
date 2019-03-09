<?php
session_start(); //inicia a sessão
if(!isset($_SESSION["login"])) //verifica se ha dados ativos na sessao
{
//caso nao exista dados registrados exige login
header("Location: login.php");//redireciona para o arquivo login.php
exit;
}
?>

<?php
     include "topoadmin.php"; //inclui o arquivo topoadmin
?>

<?php
     require_once('../Connection/conexao.php'); //inclui o arquivo conexao .php
?>

<?php
mysql_select_db($database_conexao, $conexao);//seleciona o banco de dados mysql

//realizada a busca do codigo e nome da categoria na tabela categorias
$consulta = "SELECT cod_usuario, nome, email FROM usuarios";



$registro = mysql_query($consulta, $conexao) or die(mysql_error());


$linha = mysql_fetch_assoc($registro);
?>

<HTML>
<HEAD>
<TITLE>ADMINISTRAÇÃO</TITLE>
</HEAD>
<BODY>
<div align="center">
     <p>
        <?php
             if ($linha == 0) { //verifica se o registro esta vazio
        ?>
        
        <font face="verdana" size="2"><b>Nenhum cliente cadastrado!</b></font>
        
        <?php }
        //mostra se o registro nao esta vazio
        ?>
<p>
</div>

<?php
     if ($linha > 0) {
?>

<div align="center">
<table width="60%" border="1" align="center" bgcolor="#F2F2F2">
       <tr>
           <td colspan="2"><div align="center"><font face="verdana" size="2"><b>
           Clientes cadastrados:</b></font></div></td>
       </tr>
       
   <?php
        do {
   ?>
   
   <tr>
       <td width="50%"><div align="center"><font face="verdana" size="2"><b>
           <?php echo $linha['nome']; ?></b></font></div></td>
       <td width="40%"><div align="center">
           <a href="excluir_clientes.php?cod_usuario=<?php echo $linha['cod_usuario']; ?>"
           onClick="return confirmSubmit()"><img src="../figuras/botaoexcluir.gif" border="0"></a>&nbsp;
           <a href="alterar_clientes.php?cod_usuario=<?php echo $Linha['cod_usuario']; ?>">
           <img src="../figuras/botaoalterar.gif" border="0"></a>
           </div></td>
   </tr>
   
   <?php }


         while ($linha = mysql_fetch_assoc($registro));
   ?>
</table>

<?php }
//mostra se o registro nao esta vazio
?>
</body>
</html>

<?php
     //libera a memoria depois do resultado de uma consulta
     mysql_free_result($registro);
?>
