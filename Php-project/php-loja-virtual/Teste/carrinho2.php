<?php
     /* a função 'require_once' inclui o conteudo de outro arquivo "conexao.php" no arquivo atual,
antes do arquivo ser executado */
     require_once('Connection/conexao.php'); //inclui o arquivo "conexao.php"
?>

<?php
error_reporting(0); //desativa o relatorio de todos os erros
$max_linhas = 100; //essa variavel retorna o numero maximo de registros da tabela que é igual a 100
$num_paginas = 0; //essa variavel retorna o numero de paginas

if (isset($_GET['num_paginas'])) { //verifica se ha dados ativos
   $num_paginas = $_GET['num_paginas']; // armazena os dados do array na variavel "$num_paginas"
}
$inicio_linha = $num_paginas * $max_linhas; //determina o inicio da exibiçao dos dados

$coluna = "1"; //atribui o valor '1' á variavel "$coluna"

if (isset($_GET['session_id'])) { //verifica se ha dados ativos

   /* se a configuração atual de "magic quotes gpc" estiver definida como 1 "true, verdadeiro),
   a função stripslashes sera utilizada sobre o valor informado, desfazendo o efeiro de addslashes.
   Caso contrario nada sera feito ao valor. */
   $coluna = (get_magic_quotes_gpc()) ? $_GET['session_id'] : addslashes($_GET['session_id']);
}
mysql_select_db($database_conexao, $conexao); //seleciona o banco de dados mysql

//seleciona os dados da tabela compras
$consulta = sprintf("SELECT cod_compra, nome_prod, valor, quantidade, valor_compra, id_temp FROM
          compras WHERE id_temp = '$session_id' and status = 'nao'" , $coluna);
          
          
          
$consulta_limite = sprintf("%$ LIMIT %d, %d", $consulta, $inicio_linha, $max_linhas);


$registro = mysql_query($consulta_limite, $conexao) or die(mysql_error());


$linha = mysql_fetch_assoc($registro);

if (isset($_GET['total_linhas'])) { //verifica se ha dados ativos

   $total_linhas = $_GET['total_linhas']; //armazena os dados do array na variavel "$total_linhas"
   
} else {

  $total_registros = mysql_query($consulta);
  
  
  $total_linhas = mysql_num_rows($total_registros);
}

$total_paginas = ceil($total_linhas/$max_linhas)-1;
?>

<html>
<head>
<title>Loja Virtual</title>
</head>
<body>
<br>
<center><h3>SUAS COMPRAS:</h3></center>
<?php
     if ($total_linhas == 0) { //verifica se o registro esta vazio
?>

<p align="center"><font face="verdana" size="2">
<b>Seu carrinho de compras est$aacute; vazio.</b></font></p>

<?php }
//mostra se o registro nao esta vazio
?>

<?php
     if ($total_linhas > 0) { //verifica se o registro nao esta vazio
?>

<table width="578" border="1" align="center" bgcolor="#F2F2F2">
       <tr>
           <td width="163"><div align="center"><font face="verdana" size="2"><b>Produto</b></font></div></td>
           <td width="163"><div align="center"><font face="verdana" size="2"><b>Qtde</b></font></div></td>
           <td><div align="center"><font face="verdana" size="2"><b>Valor</b></font></div></td>
           <td><div align="center"><font face="verdana" size="2"><b>Valor Total</b></font></div></td>
           <td>$nbsp;</td>
       </tr>
       <?php
            do {
       ?>
       
       <?php
       //calculo = quantidade x valor, para obter o valor total dos produtos
       $valor = $linha['quantidade'] * $linha['valor'];
       $soma = $valor + $soma;
       
       
       
       
       $total_compra += $linha['valor_compra'];
       
       
       $alterar = mysql_query("UPDATE compras SET total_compra = '$total_compra'
       WHERE id_temp = '$session_id' and status = 'nao' ");?>
       
       <tr>
           <td width="180"><div align="center"><?php echo $linha['nome_prod']; ?></div></td>
           <td width="120"><div align="center"><?php echo $linha['quantidade']; ?></div></td>
           <td width="170"><div align="center">R$ <?php echo $linha['valor']; ?>,00</div></td>
           <?php $total = $linha['quantidade'] * $linha['valor'];?>
           <td width="170"><div align="center">R$ <?php echo $total;?>,00 </div></td>
       
           <td width="52"><div align="center"><a href="excluir.php?cod_compra=<?php echo $linha['cod_compra'];?>
               $session_id=<?php echo $_GET['session_id']?>" onClick="return confirmSubmit()">
               <img src="figuras/botaoexcluir.gif" border="0"></a></a></div></td>
       <tr>
       
       <?php }
             //loop: busca o resutlado de uma linha e coloca-o em um array até terminar a consulta
             while ($linha = mysql_fetch_assoc($registro));
       ?>
       
</table>
<table width="450" border="1" align="center" bgcolor="#F2F2F2">
       <tr>
           <td width="71%">><div align="right"><b>
               <?php
               $soma2 = $soma + 5;
               ?>
               
               
               <font face="verdana" size="2"><b>Total geral:</b></font></div><td>
           <td width="29%">R$ <?php echo $soma;?>,00</td>
       </tr>
       <tr>
           <td><div align="right"><font face="verdana" size="2"><b>Total geral com taxa de envio (R$5,00):
                    </b></font></div></td>
           <td><font color="#FF0000"><b>R$ <?php echo $soma2;?>,00 </b></font></td>
       </tr>
</table>

<?php }
//mostra se o registro nao esta vazio
?>

<?php
mysql_free_result($registro) //libera a memoria depois do resultado de uma consulta
?>

<p align="center">
   <?php
        if ($total_linhas > 0) { //verifica se o registro nao esta vazio
   ?>
   
   <a href="finalizar.php"><img src="figuras/concluircompra.gif" width="180" height="46" border="0"></a>
   
   <?php
   //mostra se o registro nao esta vazio
   ?>
</body>
</html>
