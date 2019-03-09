var Textura:Texture[];
static var mudar_textura:String;

function  OnGUI () {

if(GUI.Button(Rect(420,10,100,30), "Voltar ao Menu")){
    Application.LoadLevel(0);
}

if(mudar_textura != null){
  GUI.Label(Rect(150,30,270,30), "CLIQUE EM UM DOS BOTOES ABAIXO");

if(GUI.Button(Rect(50,330,100,40), "Madeira")){
   GameObject.Find(mudar_textura).renderer.material.mainTexture = Textura[0];
}
if(GUI.Button(Rect(180,330,100,40), "Pedra")){
 GameObject.Find(mudar_textura).renderer.material.mainTexture = Textura[1];
}
if(GUI.Button(Rect(310,330,100,40), "Praia")){
 GameObject.Find(mudar_textura).renderer.material.mainTexture = Textura[2];
}
if(GUI.Button(Rect(440,330,100,40), "Brasil")){
 GameObject.Find(mudar_textura).renderer.material.mainTexture = Textura[3];
}
}else{
 GUI.Label(Rect(180,220,300,500), "CLIQUE EM UMA CAIXA");
 }

}