<?php
//inicializa as variaveis
$hostname_conexao = "localhost";  //nome ou IP do servidor
$database_conexao = "loja_4200a";  //nome do banco de dados
$username_conexao = "4200a";  //nome do usuario
$password_conexao = "microway";  //senha do usuario

//mysql_pconnect("Nome ou IP do servidor", "Usuario", "Senha");

//abre uma conexão com um banco de dados MySQL
$conexao = mysql_pconnect($hostname_conexao, $username_conexao, $password_conexao)
         or die(mysql_error());
         
mysql_select_db("loja_4200a", $conexao);  //especifica o banco de dados a ser utilizado
?>
