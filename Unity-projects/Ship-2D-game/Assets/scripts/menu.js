var texturaFundo:Texture;

function OnGUI(){
 	//instrucoes="Iintrucoes:\nAperte as teclas para cima e para baixo para mover!\nAperte espaco parar atirar!";
	//GUI.Label(Rect(10,10,350,500),instrucoes);
	GUI.DrawTexture(new Rect(0,0,Screen.width,Screen.height),texturaFundo);
	
	//if(GUI.Button(Rect(180,80,100,50), "iniciar jogo")){
	if(Input.anyKeyDown)
    Application.LoadLevel(1);
}

