<?php
     /* a função 'require_once' inclui o conteudo de outro arquivo "conexao.php" no arquivo atual,
antes do arquivo ser executado */
      require_once('Connection/conexao.php'); // inclui o arquivo "conexao.php"
?>

<?php
$pagina_ativa = $_SERVER["PHP_SELF"]; // edita o script em execução

// inicializa as variaveis
$max_linhas = 2; //essa variavel retorna o numero maximo de registros da tabela que é igual a 2
$num_paginas = 0; // essa variavel retorna o numero de paginas

if (isset($_GET['num_paginas'])) { //verifica se há dados ativos
   $num_paginas = $_GET['num_paginas']; // armazena os dados do array na variavel "$num_paginas
}
$inicio_linha = $num_paginas * $max_linhas;

$coluna = "1";

if (isset($_GET['cod_cat'])) {




   $coluna = (get_magic_quotes_gpc()) ? $_GET['cod_cat'] : addslashes($_GET['cod_cat']);
}
mysql_select_db($database_conexao, $conexao); // seleciona o banco de dados MySQL

//seleciona a tabela produtos
$consulta = sprintf("SELECT * FROM produtos WHERE cod_cat = %s ", $coluna);



$consulta_limite = sprintf("%s LIMIT %d, %d", $consulta, $inicio_linha, $max_linhas);


$registro = mysql_query($consulta_limite, $conexao) or die(mysql_error());


$linha = mysql_fetch_assoc($registro);

if (isset($_GET['total_linhas'])) { //verifica se ha dados ativos

   $total_linhas = $_GET['total_linhas']; // armazena os dados do array na variavel "$total_linhas"
   
} else {

   $total_registros = mysql_query($consulta);


   $total_linhas = mysql_num_rows($total_registros);
}

$total_paginas = ceil($total_linhas/$max_linhas)-1;

$consulta = "";

if(!empty($_SERVER['QUERY_STRING'])) { //verifica se ha variaveis criadas pelo servidor web

   //retorna um array contendo as partes da variavel (string1, string2)
   $parametros = explode("&", $_SERVER['QUERY_STRING']);
   
   
   $novos_parametros = array();
   
   foreach ($parametros as $param) {
   
   
   
   
   if (stristr($param, "num_paginas") == false && stristr($param, "total_linhas") == false) {
      array_push($novos_parametros, $param);
      }
   }
   
   
   
   if (count($novos_parametros) != 0) {
   
      $consulta = "&" . implode("&", $novos_parametros);
   }
}

$consulta = sprintf("&total_linhas=%d%s", $total_linhas, $consulta)
?>

<html>
<head>
<title>Loja Virtual</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
         window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body text="#000000" link="#000000" vlink="#000000" alink="#000000">
<div align="center">
     <?php
          if ($total_linhas == 0) { //verifica se o registro esta vazio
     ?>
     
     <center><font face="verdana" size="2"><b>No momento n&atilde;o dispomos de nenhum
                   produto para essa categoria.</b></font></center>
                   
     <?php }
     //mostra se o registro nao esta vazio
     ?>
     
     <?php
          do {
     ?>
     
     <?php
          if($total_linhas > 0) { //verifica se o registro nao esta vazio
     ?>
     
<table width="70%" border="1" align="center" cellpadding="4" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
       <tr>
           <td rowspan="2" bgcolor="#FFFFFF">
           <div align="center"><img src="<?php echo $linha['fot_peq'];?>"></div></td>
           <td width="60%" bgcolor="#F1F1F1"><div align="center"><font face="arial" size="3"><b>
           <?php echo $linha['nome_prod']; ?></b></font></div></td>
       </tr>
       <tr>
           <td bgcolor="#F1F1F1"><font face="arial" color="#666666" size="1">
               <div align="center">
           <?php echo $linha['descricao']; ?></font></div></td>
       </tr>
       <tr>
           <td bgcolor="#F1F1F1"><div align="center">
           <a href="javascript:;" onClick="MM_openBrWindow('fotos.php?cod_prod=<?php
           echo $linha['cod_prod']; ?>','','scrollbars=yes,width=450,height=620,left=10, top=10')">
           <img src="figuras/info.gif" width="165" height="32" border="0"></a></div></td>
           <td rowspan="2" bgcolor="#F1F1F1"><form method=POST action="comprar.php">
               <div align="center">
                    <input type="hidden" name="session_id" value="<?php echo $_SESSION["id"]; ?>">
                    <input type="hidden" name="valor" value="<?php echo $linha['valor']; ?>">
                    <input type="hidden" name="nome_prod" value="<?php echo $linha['nome_prod']; ?>">
                    <font face="verdana" color="#666666" size="2"><b>Quantidade</b></font>
                    <select name="quantidade" id="quantidade">
                       <option value="1">1</option>
                       <option value="2">2</option>
                       <option value="3">3</option>
                       <option value="4">4</option>
                       <option value="5">5</option>
                       <option value="6">6</option>
                       <option value="7">7</option>
                       <option value="8">8</option>
                       <option value="9">9</option>
                       <option value="10">10</option>
                    </select>
                    <p>
                    <input type="image" name="submit" src="figuras/botaocomprar.gif">
               </div>
           </form></td>
       </tr>
       <tr>
           <td bgcolor="#F1F1F1"><center>
               <font face="verdana" size="2"><b>R$ <?php echo $linha['valor']; ?>,00</b></font></p>
           </center></td>
       </tr>
</table>
<p>
<?php }
//mostra se o registro não esta vazio
?>

<?php }
      //loop: busca o resultado de uma linha e coloca-o em um array até terminar a consulta
      while ($linha = mysql_fetch_assoc($registro));
      mysql_free_result($registro); //libera a memoria depois do resultado de uma consulta
?>

<p align="right"><font face="verdana" size="2"><b>Registros <?php echo ($inicio_linha + 1) ?> a
   <?php echo min($inicio_linha + $max_linhas, $total_linhas) ?>
   &nbsp;de <?php echo $total_linhas ?> </b></font>
<table border="0" width="50%" align="left">
       <tr>
       
           <?php if ($num_paginas > 0) { //verifica se nao é a primeira pagina ?>
                 <a href="<?php printf("%s?num_paginas=%d%s", $pagina_ativa, 0,
                 $consulta); ?>"><img src="figuras/primeiro.gif" width="40" height="25" border="0"></a>
                 <?php }
                 //mostra se não for a primeira pagina
                 ?>

           <?php if ($num_paginas > 0) { //verifica se nao é a primeira pagina ?>
                 <a href="<?php printf("%s?num_paginas=%d%s", $pagina_ativa, max(0, $num_paginas - 1),
                 $consulta); ?>"><img src="figuras/retornar.gif" width="40" height="25" border="0"></a>
                 <?php }
                 //mostra se não for a primeira pagina
                 ?>
                 
           <?php if ($num_paginas < $total_paginas) { //verifica se não é a ultima agina ?>
                 <a href="<?php printf("%s?num_paginas=%d%s", $pagina_ativa, min($total_paginas, $num_paginas + 1),
                 $consulta); ?>"><img src="figuras/avancar.gif" width="40" height="25" border="0"></a>
                 <?php }
                 //mostra se não for a ultima pagina
                 ?>
                 
           <?php if ($num_paginas < $total_paginas) { //verifica se não é a ultima pagina ?>
                 <a href="<?php printf("%s?num_paginas=%d%s", $pagina_ativa, $total_paginas,
                 $consulta); ?>"><img src="figuras/ultimo.gif" width="40" height="25" border="0"></a>
                 <?php }
                 //mostra se não for a ultima pagina
                 ?>
       </tr>
</table>
</body>
</html>
