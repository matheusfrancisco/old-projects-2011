
function OnGUI () {
  
     GUI.Label(Rect(110,40,320,30), "Escolha uma das opcoes abaixo para alterar o objeto.");
	 if(GUI.Button(Rect(130,300,120,35), "Alterar a Cor")){
	    AlterarCor.mudar_cor = null;
	    Application.LoadLevel(1);
	}
	 if(GUI.Button(Rect(290,300,120,35), "Alterar a Textura")){
		AlterarTextura.mudar_textura = null;
		Application.LoadLevel(2);
	}
}