var tiroVel  = 2;
var velInimigo = 1;
var velJogador = 1;
var  posExplosao: Transform;

function Update () {


   //Calculo de velocidade da bala
   var_Veloc = tiroVel;
   
   // Mover bala
   transform.Translate(Vector3.forward* var_Veloc);
   
   if(transform.position.z >= -100){
       Destroy(gameObject);
	   }
	
}
function OnTriggerEnter(outroObjeto:Collider){
   var tempExplosao: Transform;

	if(outroObjeto.gameObject.tag =="inimigo"){
	   jogadorScript.PontosJogador += 100;
	   
	   
	   outroObjeto.gameObject.transform.position.z = -929;
	   outroObjeto.gameObject.transform.position.x = Random.Range(264, -201);
	   
	   tempExplosao = Instantiate(posExplosao,transform.position, transform.rotation);
	   
	Destroy(gameObject);
	inimigo.inimigoVel += 1;
	jogadorScript.jogadorVel += velJogador;
	estrelas.velocidade += velInimigo;
	   }
}