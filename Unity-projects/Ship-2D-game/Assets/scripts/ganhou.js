var texturaFundo : Texture;

function OnGUI(){

GUI.DrawTexture(new Rect(0,0,Screen.width,Screen.height),texturaFundo);

if(GUI.Button(Rect(180,80,100,50), "Parabéns")){
Application.LoadLevel(0);

	
	
}
}