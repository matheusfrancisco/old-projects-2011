<?php
session_start(); //inicia a sessão
                 if(!isset($_SESSION["login"])) //verifica se ha dados ativos na sessão
{
//caso nao exista dados registrados, exige login
header("Location:login.php"); //redireciona para o arquivo "Login.php"
exit; //sai do login
}
?>

<?php
/* a função 'include' inclui o conteudo de outro arquivo "topoadmin.php" no arquivo atual,
durante a execução do arquivo */
include "topoadmin.php"; //inclui o arquivo "topoadmin.php"
?>

<?php
echo "<br><br><center><h1><b>Bem-Vindo " . $_SESSION["login"] . "!</b></h1></center><br>\n";
?>

<html>
<head>
<title>ADMINISTRAÇÃO</title>
</head>
<body>
</body>
</html>
