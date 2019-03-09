<?php
     include "topoadmin.php"; //inclui o arquivo "topoadmin.php"
?>


<HTML>
<HEAD>
<TITLE>ADMINISTRAÇÃO</TITLE>
</HEAD>
<P><p>
<BODY>
<center><font face="verdana" size="2"><b>Informe seus dados de acesso:</b></font></center>
<form name="form1" method="post" action="verifica.php">
      <div align="center"><font face="Verdana" size="2">
           <b>Login:</b><input name="login" type="text" size="20" maxlength="20"><br>
           <b>Senha:</b><input name="senha" type="password" size="19" maxlength="8"><br>
           <input type="image" name="submit" src="../figuras/botaoenviar.gif">
      </font></div>
</form>
</BODY>
</HTML>
