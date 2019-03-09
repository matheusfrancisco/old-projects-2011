<?php
     require_once('Connection/conexao.php');  //inclui o arquivo "conexao.php"
?>

<?php
mysql_select_db($database_conexao, $conexao);  //seleciona o banco de dados Mysql

$consulta = "SELECT * FROM categorias";  //seleciona a tabela categorias

//realiza a consulta no banco de dados ou retorna a mensagem de erro da ultima consulta realizada
$registro = mysql_query($consulta, $conexao) or die(mysql_error());

//busca o resultado de uma linha e coloca-o em um array
$linha = mysql_fetch_assoc($registro);

?>

<body background="figuras/fundo.jpg" text="#000000" link="#000000" vlink="#000000" alink="#000000">
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2"
       bordercolor="#993300" bgcolor="#F7E6D2">
       <?php
            do {
       ?>
       <tr>
           <td width="155" bgcolor="#FFFFFF"><div align="center"><font face='verdana' size='2'><b>
               <a href="produtos.php?cod_cat=<?php echo $linha['cod_cat'];?>">
               <?php echo $linha['nome_cat']; ?></a></b></font></div></td>
               
       </tr>
       <?php }
             //loop: busca o resultado de uma linha e coloca-o em um array até terminar a consulta
             while ($linha = mysql_fetch_assoc($registro));
       ?>
</table>
<br>
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2"
       bordercolor="#993300" bgcolor="#F7E6D2">
       <tr>
           <td width="155" bgcolor="#FFFFFF"><div align="center"><a href="carrinho.php?session_id=
               <?php echo $_SESSION["id"];?>"><font face="verdana" size="1"><b>CARRINHO DE COMPRAS
               </b></font></a></div></td>
       </tr>
</table>
<body>
<html>
