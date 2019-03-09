<?php session_start();?>
<?php include "topo.php"; //inclui o arquivo "topo.php"
?>

<?php
     /* a função 'require_once' inclui o conteudo de outro arquivo "conexao.php" no arquivo atual,
antes do arquivo ser executado */
      require_once('Connection/conexao.php');  //inclui o arquivo "conexao.php"
?>
     
<?php
mysql_select_db($database_conexao, $conexao);  //seleciona o banco de dados MySQL
     
$consulta = "SELECT * FROM categorias";  //seleciona a tabela categorias
     
//realiza a consulta no banco de dados ou retorna a mensagem de erro da consulta realizada
$registro = mysql_query($consulta, $conexao) or die(mysql_error());
     
//busca o resultado de uma linha e coloca-o em um array
$linha = mysql_fetch_assoc($registro);
?>
     
<html>
<head>
<title>Loja Virtual</title>
</head>
<body text="#000000" link="#000000" vlink="#000000" alink="#000000">
<table width="500" height="300" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
           <td background="figuras/fundo2.jpg"><div align="center">
           <table width="45%" height="40" border="2" align="center" cellpading="2" cellspacing="2"
           bordercolor="#3204A2" bgcolor="#9C85D3">
           <?php
                do {
           ?>
           <tr>
           <tr>
               <td width="100%" bgcolor="#FFFFFF"><div align="center"><font face='verdana' size='3'><b>
               <a href="produtos.php?cod_cat=<?php echo $linha['cod_cat'];?>"><?php echo $linha['nome_cat']; ?>
               </a></b></font></div></td>
           </tr>
           <?php }
           //loop: busca o resultado de uma lçinha e coloca-o em um array
           while ($linha = mysql_fetch_assoc($registro));
           ?>
           </table>
           </div></td>
       </tr>
</table>
</body>
</html>
