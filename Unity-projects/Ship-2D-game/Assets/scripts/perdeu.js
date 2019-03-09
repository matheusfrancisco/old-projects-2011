var texturaFundo : Texture;

function OnGUI(){

GUI.DrawTexture(new Rect(0,0,Screen.width,Screen.height),texturaFundo);

if(GUI.Button(Rect(50,80,180,50), "tente novamente")){
Application.LoadLevel(0);
}
if(GUI.Button(Rect(300,80,100,50), "Fechar")){
Destroy(gameObject);	
	
}
}

