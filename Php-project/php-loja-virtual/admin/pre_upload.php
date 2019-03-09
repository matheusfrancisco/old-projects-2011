<?php
     include "topoadmin.php";
?>

<HTML>
<HEAD>
<TITLE>ENVIANDO FOTOS</TITLE>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
         window.open(theURL,winName,features);
}
//-->
</script>
</HEAD>
<BODY>
<p>
<p align="center"><font face="Verdana" size="2"><b>Envio de fotos para o produto de c&oacute;digo:
   </font><?php echo $_GET['cod_prod']; ?></b> </p><p>
<p align="center"><a href="javascript:;" onClick="MM_openBrWindow('upload_foto.php?cod_prod=<?php
   echo $_GET['cod_prod']; ?>&num_foto=0','','scrollbars=yes,width=500,height=300')">
   <font face="Verdana" size="2"><b>Enviar foto</font></b></a></p>
<p align="center"><a href="javascript:;" onClick="MM_openBrWindow('upload_foto.php?cod_prod=<?php
   echo $_GET['cod_prod']; ?>&num_foto=1','','scrollbars=yes,width=500,height=300')">
   <font face="Verdana" size="2"><b>Enviar foto pop_up</font></b></a></p>
</body>
</html>
