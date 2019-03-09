<?php
session_start(); //inicia a sessao
if(!isset($_SESSION["login"])) //verifica se ha dados ativos na sessao
{
//caso nao exista dados registrados, exige login
header("Location:login.php");//redireciona para o arquivo "Login.php"
exit;
}
?>
