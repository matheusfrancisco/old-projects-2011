<?php
  /* a função 'require_once' inclui o conteúdo de outro arquivo "conexao.php" no arquivo atual,
antes do arquivo ser executado */
    require_once('Connection/conexao.php'); //inclui o arquivo conexao.php"
?>

<?php
error_reporting(0); //desativa o relatório de todos os erros
$max_linhas = 100; //essa variável retorna o número máximo de registros da tabela que é igual a 100
$num_paginas = 0; //essa variável retorna o número de páginas

if (isset($_GET['num_paginas'])) { //verifica se há dados ativos
   $num_paginas = $_GET['num_paginas']; //armazena os dados do array na variável "$num_paginas"
}
$inicio_linha = $num_paginas * $max_linhas; //determina o início da exibição dos dados

$coluna = "1"; //atribui o valor '1' à variável "$coluna"

if (isset($_GET['session_id'])) { //verifica se há dados ativos

  /* se a configuração atual de "magic quotes gpc" estiver definida como 1 (true, verdadeiro),
  a função stripslashes será utlizada sobre o valor informado, desfazendo o efeito de addslashes.
  Caso contrário, nada será feito ao valor. */
  $coluna = (get_magic_quotes_gpc()) ? $_GET['session_id'] : addslashes($_GET['session_id']);
}
mysql_select_db($database_conexao, $conexao); //seleciona o banco de dados MySQL

//seleciona os dados da tabela compras
$consulta = sprintf("SELECT cod_compra, nome_prod, valor, quantidade, valor_compra, id_temp FROM
          compras WHERE id_temp = '%s' and status = 'nao'", $coluna);
          
/* retorna o dados formatados através do "sprintf" e determina o número máximo (100)
de registros em uma consulta */
$consulta_limite = sprintf("%s LIMIT %d, %d", $consulta, $inicio_linha, $max_linhas);

//realiza a consulta no banco de dados ou retorna a mensagem de erro da última consulta realizada
$registro = mysql_query($consulta_limite, $conexao) or die(mysql_error());

//busca o resultado de uma linha e coloca-o em um array
$linha = mysql_fetch_assoc($registro);

if (isset($_GET['total_linhas'])) { //verifica se há dados ativos

     $total_linhas = $_GET['total_linhas']; //armazena os dados do array na variável "$total_linhas"
     
} else {
   //realiza a consulta no banco de dados e armazena todos os dados na variável "$total_registros"
   $total_registros = mysql_query($consulta);
   
   //conta o total de resultados encontrados e armazena na variável "$total_linhas"
   $total_linhas = mysql_num_rows($total_registros);
}
//calcula quantas páginas vão ser necessárias
$total_paginas = ceil($total_linhas/$max_linhas) -1;
?>

<html>
<head>
<title>Loja Virtual</title>
</head>
<body>
<br>
<center><h3>SUAS COMPRAS:</H3></center>
<?php
  if ($total_linhas == 0) { //verifica se o registro está vazio
?>

<p align="center"><font face="verdana" size="2">
<b>Seu carrinho de compras est&aacute; vazio.</b></font></p>

<?php }
  //mostra se o registro não está vazio
?>

<?php
   if ($total_linhas > 0) { //verifica se o registro não está vazio
?>

<table width="578" border="1" align="center" bgcolor="#F2F2F2">
  <tr>
     <td width="163"><div align="center"><font face="verdana" size="2"><b>Produto</b></font></div></td>
     <td width="163"><div align="center"><font face="verdana" size="2"><b>Qtde</b></font></div></td>
     <td><div align="center"><font face="verdana" size="2"><b>Valor</b></font></div></td>
     <td><div align="center"><font face="verdana" size="2"><b>Valor Total</b></font></div></td>
     <td>&nbsp;</td>
  </tr>
  <?php
     do {
  ?>
  
  <?php
  //cálculo = quantidade x valor, para obter o valor total dos produtos
  $valor = $linha['quantidade'] * $linha['valor'];
  $soma = $valor + $soma;
  /* pega o valor total dos produtos e vai somando com o que tem na variável '$soma',
  para obter o valor total da compra */
  
  //obtendo o valor total da compra através do banco de dados
  $total_compras += $linha['valor_compra'];
  
  //atualiza o campo total_compra da tavela compras
  $alterar = mysql_query("UPDATE compras SET total_compra = '$total_compra' WHERE status = 'nao' ");
  ?>
  
  <tr>
    <td width="180"><div align="center"><?php echo $linha['nome_prod'];?></div></td>
    <td width="120"><div align="center"><?php echo $linha['quantidade'];?></div></td>
    <td width="170"><div align="center">R$<?php echo $linha['valor'];?>,00</div></td>
    <?php $total = $linha['quantidade'] * $linha['valor'];?>
    <td width="170"><div align="center">R$ <?php echo $total;?>,00 </div></td>
    
    <td width="52"><div align="center"><a href="excluir.php?cod_compra=<?php echo $linha['cod_compra'];?>
    &session_id=<?php echo $_GET['session_id']?>" onClick="return confirmSubmit()">
    <img src="figuras/botaoexcluir.gif" border="0"></a></a></div></td>
  </tr>
  
  <?php }
  //loop: busca o resultado de uma linha e coloca-o em um array até terminar a consulta
  while ($linha = mysql_fetch_assoc($registro));
  ?>
  
</table>
<table width="450" border="1" align="center" bgcolor="#F2F2F2">
  <tr>
     <td width="71%"><div align="right"><b>
     <?php
     $soma2 = $soma + 5;
     ?>
     
     
     <font face="verdana" size="2"><b>Total geral</b></font></div></td>
  <td width="20%">R$ <?php echo $soma;?>,00</td>
  </tr>
  <tr>
   <td><div align="right"><font face="verdana" size="2"><b>Total geral com taxa de envio (R$5,00):
         </b></font></div></td>
   <td><font color="#FF0000"><b>R$ <?php echo $soma2;?>,00 </b></font></td>
  </tr>
</table>

<?php }
//mostra se o registro não está vazio
?>

<?php
mysql_free_result($registro); //libera memória depois do resultado de uma consulta
?>

<p align="center">
  <?php
    if ($total_linhas > 0) { //verifica se o registro não está vazio
  ?>
  
  <a href="finalizar.php"><img src="figuras/concluircompra.gif" width="180" height="46" border="0"></a>
  
  <?php }
  //mostra se o registro não está vazio
  ?>
</body>
</html>
