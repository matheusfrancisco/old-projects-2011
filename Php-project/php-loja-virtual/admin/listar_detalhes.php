<?php
     require_once('../Connection/conexao.php');
?>

<?php
$cod_usuario = $_GET['cod_usuario'];

$coluna = "1";
if (isset($_GET['cod_usuario'])) {




   $coluna = (get_magic_quotes_gpc()) ? $_GET['cod_usuario'] : addslashes($_GET['cod_usuario']);
}
mysql_select_db($database_conexao, $conexao);


$consulta = sprintf ("SELECT data_compra, cod_compra, nome_prod, valor, quantidade,
          valor_compra, form_pag, cod_usuario FROM compras WHERE cod_usuario = '$cod_usuario'
          ORDER BY data_compra DESC, cod_compra DESC ", $coluna);
          
          
$registro = mysql_query($consulta, $conexao) or die(mysql_error());


$linha = mysql_fetch_assoc($registro);


$total_linhas = mysql_num_rows($registro);


//inicializa as variaveis
$max_linhas2 = 10; //essa variavel retorna o numero maximo de registros da tabela que é igual a 10
$num_paginas2 = 0; //essa variavel retorna o numero de paginas

if (isset($_GET['num_paginas2'])) { //verifica se ha dados ativos
   $num_paginas2 = $_GET['num_paginas2'];
}
$inicio_linha2 = $num_paginas2 * $max_linhas2;

$coluna2 = "1";

if (isset($_GET['cod_usuario'])) {




   $coluna2 = (get_magic_quotes_gpc()) ? $_GET['cod_usuario'] : addslashes($_GET['cod_usuario']);
}
mysql_select_db($database_conexao, $conexao);

//seleciona a tabela produtos
$consulta2 = sprintf("SELECT nome, email, endereco, cidade, cep, estado, pais, nome_cartao, cartao,
           cartao_numero, cartao_cvc, cartao_data, form_pag, data_compra FROM usuarios
           WHERE cod_usuario = %s", $coluna2);
           


$consulta_limite2 = sprintf("%s LIMIT %d, %d", $consulta2, $inicio_linha2, $max_linhas2);


$registro2 = mysql_query($consulta_limite2, $conexao) or die(mysql_error());


$linha2 = mysql_fetch_assoc($registro2);

if (isset($_GET['total_linhas2'])) { //verifica se ha dados ativos

   $total_linhas2 = $_GET['total_linhas2'];
}
   else {
   
   
        $total_registros2 = mysql_query($consulta2);
        
        
        $total_linhas2 = mysql_num_rows($total_registros2);
}
//calcula quantas paginas vao ser necessarias
$total_paginas2 = ceil($total_linhas2/$max_linhas2)-1;
?>

<HTML>
<HEAD>
<TITLE>ADMINISTRAÇÃO</TITLE>
</HEAD>
<BODY text="#000000" link="#000000" vlink="#000000" alink="#000000">
<p align="center"><img src="../figuras/topo.jpg" width="100%" height="17%"></p>
<div align="center">
<a href="#" onClick="window.print();return false"><img src="../figuras/imprime.gif"
alt="" border="0"></a></div><p>
<table width="70%" border="1" align="center" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
<tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
    <td width="38"><div align="center"><b><font size="1" face="verdana">Data</font></b></div></td>
    <td width="64"><div align="center"><b><font size="1" face="verdana">C&oacute;d. compra
    </font></b></div></td>
    <td width="84"><div align="center"><b><font size="1" face="verdana">Produto</font></b></div></td>
    <td width="93"><div align="center"><b><font size="1" face="verdana">Valor</font></b></div></td>
    <td width="25"><div align="center"><b><font size="1" face="verdana">Qtde</font></b></div></td>
    <td width="90"><div align="center"><b><font size="1" face="verdana">Total</font></b></div></td>
    <td width="130"><div align="center"><b><font size="1" face="verdana">Forma de pagto
    </font></b></div></td>
</tr>
<?php
     do {
?>
<tr bgcolor="#F2F2F2">
    <td><div align="center"><font size="1" face="verdana"><?php echo $linha['data_compra']; ?>
    </font></div></td>
    <td><div align="center"><font size="1" face="verdana"><?php echo $linha['cod_compra']; ?>
    </font></div></td>
    <td><div align="center"><font size="1" face="verdana"><?php echo $linha['nome_prod']; ?>
    </font></div></td>
    <td><div align="center"><font size="1" face="verdana">R$ <?php echo $linha['valor']; ?>,00
    </font></div></td>
    <td><div align="center"><font size="1" face="verdana"><?php echo $linha['quantidade']; ?>
    </font></div></td>
    <td><div align="center"><font size="1" face="verdana">R$ <?php echo $linha['valor_compra']; ?>,00
    </font></div></td>
    <td><div align="center"><font size="1" face="verdana"><?php echo $linha['form_pag']; ?>
    </font></div></td>
 </tr>
 <?php }
 
       while ($linha = mysql_fetch_assoc($registro));
 ?>
 <tr>
     <td colspan="8" bgcolor="#F2F2F2"><font face="verdana"><b>OBS.</b> Compras efetuadas
     atrav&eacute;s de boleto banc&aacute;rio, ser&aacute; acrescentado o valor de <b>R$ 2,00</b>
     (tx. banc&aacute;ria).<br>Tx. envio: <b>R$ 5,00</b></font></td>
 </tr>
 </table>
 <p>

<?php
     if ($linha2['form_pag'] == "boleto") { //verifica se a forma de pagamento é boleto
?>

<table width="60%" border="1" align="center" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
<?php
     do {
?>
<tr>
    <td width="50%" bgcolor="#F2F2F2"><div align="right"><font size="2" face="verdana"><b>
    Nome:</b></font></div></td>
    <td width="50%" bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['nome']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Email:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['email']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Endere&ccedil;o:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['endereco']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Cidade:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cidade']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    CEP:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cep']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Estado:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['estado']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Pa&iacute;s:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['pais']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Forma de pagamento:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['form_pag']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Data de &uacute;ltima compra:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['data_compra']; ?>
    </font></td>
</tr>
<?php }

      while ($Linha = mysql_fetch_assoc($registro2));
?>
</table>

<?php }
      else {
?>

<table width="60%" border="1" align="center" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
<?php
     do {
?>
<tr>
    <td width="50%" bgcolor="#F2F2F2"><div align="right"><font size="2" face="verdana"><b>
    Nome:</b></font></div></td>
    <td width="50%" bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['nome']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Email:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['email']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Endere&ccedil;o:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['endereco']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Cidade:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cidade']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    CEP:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cep']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Estado:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['estado']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Pa&iacute;s:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['pais']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Nome no cat&atilde;o de cr&eacute;dito:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['nome_cartao']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Cart&atilde;o:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cartao']; ?></font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    N&uacute;mero do cart&atilde;o:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cartao_numero']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    N&uacute;mero verificador do cart&atilde;o:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cartao_cvc']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Data de expira&ccedil;&atilde;o do cart&atilde;o:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['cartao_data']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Forma de pagamento:</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['form_pag']; ?>
    </font></td>
</tr>
<tr>
    <td bgcolor="#F2F2F2"><div align="right"><font size="2"><b><font face="verdana">
    Data da &uacute;ltima compra::</font></b></font></div></td>
    <td bgcolor="#F2F2F2"><font size="2" face="verdana"><?php echo $linha2['data_compra']; ?>
    </font></td>
</tr>
<?php }

      while ($linha2 = mysql_fetch_assoc($registro2));
      ?>
</table>

<?php  }

?>

<p align="center"><a href="encluir_compra.php?cod_usuario=<?php echo $cod_usuario; ?>">
<font size="2" face="verdana" onClick="return confirmSubmit()"><b>
Excluir o registro das compras acima.</b></font></a></p>
</BODY>
</HTML>

<?php
mysql_free_result($registro);
mysql_free_result($registro2);
?>
