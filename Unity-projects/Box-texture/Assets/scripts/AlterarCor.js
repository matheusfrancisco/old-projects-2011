static var mudar_cor:String;

function OnGUI () {

if(GUI.Button(Rect(420,10,100,30), "Voltar ao Menu")){
    Application.LoadLevel(0);
	Caixa1.cor_mouse_sair = Color.white;
	Caixa2.cor_mouse_sair = Color.white;
	Caixa3.cor_mouse_sair = Color.white;
}

if(mudar_cor !=null){
  GUI.Label(Rect(150,30,270,30), "CLIQUE EM UM DOS BOTOES ABAIXO");

	if(GUI.Button(Rect(50,330,100,40), "Azul")){
           GameObject.Find(mudar_cor).renderer.material.color  = Color.blue;
		   if(Caixa1.verifica_caixa == 1){ //verifica se a caixa está ativa
		         Caixa1.cor_mouse_sair = Color.blue; // a variável ( cor_mouse_sair) recebe a cor azul
				 }
		   if(Caixa2.verifica_caixa == 1){ //verifica se a caixa está ativa
		         Caixa2.cor_mouse_sair = Color.blue; // a variável ( cor_mouse_sair) recebe a cor azul
				 }	 
			 if(Caixa3.verifica_caixa == 1){ //verifica se a caixa está ativa
		         Caixa3.cor_mouse_sair = Color.blue; // a variável ( cor_mouse_sair) recebe a cor azul
				 }	 	
		
	}
	if(GUI.Button(Rect(180,330,100,40), "Verde")){
		   GameObject.Find(mudar_cor).renderer.material.color = Color.green;
		   if(Caixa1.cor_mouse_sair == 1){
		    Caixa1.cor_mouse_sair = Color.green;
			}
		   if(Caixa2.cor_mouse_sair == 1){
		    Caixa2.cor_mouse_sair = Color.green;
			}
			if(Caixa3.cor_mouse_sair == 1){
		    Caixa3.cor_mouse_sair = Color.green;
			}
    }

	if(GUI.Button(Rect(310,330,100,40), "Amarelo")){
          GameObject.Find(mudar_cor).renderer.material.color = Color.yellow;
		  if(Caixa1.cor_mouse_sair == 1){
		    Caixa1.cor_mouse_sair = Color.yellow;
			}
		  if(Caixa2.cor_mouse_sair == 1){
		    Caixa2.cor_mouse_sair = Color.yellow;
			}
		  if(Caixa3.cor_mouse_sair == 1){
		   Caixa3.cor_mouse_sair = Color.yellow;
			}
    }

    if(GUI.Button(Rect(440,330,100,40), "Vermelho")){
          GameObject.Find(mudar_cor).renderer.material.color  = Color.red;
		  if(Caixa1.cor_mouse_sair == 1){
		    Caixa1.cor_mouse_sair = Color.red;
			}
		  if(Caixa2.cor_mouse_sair == 1){
		    Caixa2.cor_mouse_sair = Color.red;
			}
		  if(Caixa3.cor_mouse_sair == 1){
		    Caixa3.cor_mouse_sair = Color.red;
			}
    }
}else{
   GUI.Label(Rect(180,220,300,500), "CLIQUE EM UMA CAIXA");
}

}