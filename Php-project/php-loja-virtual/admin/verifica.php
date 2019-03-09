<?php
     session_start(); //inicia a sessao
?>

<?php


require_once('../connection/conexao.php');
?>

<?php
//recebemos os dados digitados pelo usuario
$usuario = $_POST["login"];

$senha = $_POST["senha"];

$selecao = mysql_query("SELECT * FROM admin WHERE login = '$usuario' AND senha = '$senha' ");
$linha = mysql_fetch_array($selecao); //retorna os dados do banco de dados

if ($linha == "") { //caso nenhuma linha seja retornada emite uma mensaegm
   echo "<center><font face='verdana' size='2'><b>Login e/ou senha inválidos.
        </b></font></center>";
   echo "<br>";
   echo "<center><a href=javascript:history.go(-1);><font face='verdana' size='2'><b>
        Voltar</b></font></a></center>";
   }
   else{ //usuario correto... vamos criar os cookies com sessões...
   session_start(); //inicia a sessao
   $_SESSION["login"] = $usuario; //registra os dados do usuario na sessao
   include "index.php"; //inclui o conteudo do arquivo "index.php"
}
mysql_close($conexao); //encerra a conexao com o mysql
?>
