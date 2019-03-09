static var  cor_mouse_sair = Color.white; // variável recebe cor original da caiza
static var verifica_caixa = 0; // verifica qual caixa esta ativa sendo (0=desativada e 1=ativada)

function OnMouseDown () {
    if(gameObject.tag =="Caixa2"){
	   AlterarCor.mudar_cor  = "Caixa2";
	   AlterarTextura.mudar_textura = "Caixa2";
	   verifica_caixa = 2;
	   Caixa1.verifica_caixa = 0;
		Caixa3.verifica_caixa = 0;
	}
}

function OnMouseOver () {
     GameObject.Find("Caixa2").renderer.material.color = Color.cyan;
}

function OnMouseExit () {
	GameObject.Find("Caixa2").renderer.material.color  = Color.white;
}