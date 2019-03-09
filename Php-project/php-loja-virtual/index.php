<?php
session_start();//inicia a sessão
if(!isset($_SESSION["id"]))// verifica se ha dados ativos na sessao
{
$_SESSION["id"] = session_id();// registra o id do usuario na sessao
}
?>
<html>
<head>
<title>Loja Virtual</title>
</head>
<body>
<?php
     include "principal.php";//inclui o arquivo "principal.php"
?>

</body>
</html>
