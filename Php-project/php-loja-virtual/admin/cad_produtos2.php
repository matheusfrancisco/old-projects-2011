<?php
     include "topoadmin.php";
?>

<?php
     require_once('../Connection/conexao.php');
?>

<HTML>
<HEAD>
<TITLE>ADMINISTRAÇÃO</TITLE>
</HEAD>
<BODY>
<div align="center" >
     <?php $cod_cat = $_POST['cod_cat']; ?>
     <?php $nome_prod = $_POST['nome_prod']; ?>
     <?php $valor = $_POST['valor']; ?>
     <?php $destaque = $_POST['destaque']; ?>
     <?php $descricao = $_POST['descricao']; ?>

<?php

$inserir = mysql_query("INSERT INTO produtos (nome_prod, descricao, valor, destaque, cod_cat) VALUES
         ('$nome_prod', '$descricao', '$valor', '$destaque', '$cod_cat')");
         
         
$selecao = mysql_query("SELECT * FROM produtos WHERE nome_prod = '$nome_prod'");


$linha = mysql_fetch_array($selecao);
echo "<br>";
echo "<font face='verdana' size='2'><b>Produto cadastrado!</b></font>";
echo "<br>";

$cod_prod2 = $linha["cod_prod"];

mysql_close($conexao)

?>
<br><b><font face="verdana" size="2"><b>
             Clique <a href="pre_upload.php?cod_prod=<?php echo $cod_prod2?>">aqui</a>
             para enciar as fotos desse produto.</b></font></div>
</font>
</BODY>
</HTML>
