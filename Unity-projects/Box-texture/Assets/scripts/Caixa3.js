static var  cor_mouse_sair = Color.white; // variável recebe cor original da caiza
static var verifica_caixa = 0; // verifica qual caixa esta ativa sendo (0=desativada e 1=ativada)

function OnMouseDown () {
    if(gameObject.tag =="Caixa3"){
	   AlterarCor.mudar_cor  = "Caixa3";
	   AlterarTextura.mudar_textura = "Caixa3";
	   verifica_caixa = 3;
	   Caixa2.verifica_caixa = 0;
	   Caixa1.verifica_caixa = 0;
	}
}

function OnMouseOver () {
     GameObject.Find("Caixa3").renderer.material.color = Color.cyan;
}

function OnMouseExit () {
	GameObject.Find("Caixa3").renderer.material.color  = Color.white;
}
