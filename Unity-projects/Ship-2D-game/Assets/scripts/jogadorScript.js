static var jogadorVel = 500;
var vidaJogador = 3;
static var PontosJogador = 0;
var tiro:Rigidbody;
var posExplosao:Transform;
var tempo=10.0;
private var estado = State.Jogando;
private var tempo_espera=10;
private var cont=0;

enum State{
 Jogando,
 Explodindo,
 Invencivel
}

function Update () {

if(estado != State.Explodindo){

//calculo da velocidade
var_vel = (jogadorVel * Input.GetAxis("Vertical")) *Time.deltaTime;
var_vel_frente = (jogadorVel * Input.GetAxis("Horizontal")) *Time.deltaTime;

//movel o  jogador
transform.Translate(Vector3.left * var_vel);
transform.Translate(Vector3.forward * var_vel_frente);

if(transform.position.x > 468.9846 )
transform.position.x =-331.8026;

if(transform.position.x < -331.8026 )
transform.position.x =468.9846;





if(Input.GetKeyDown("space")){
 var tempTiro:Rigidbody;
  tempTiro = Instantiate(tiro,transform.position,transform.rotation);
 
}
if(PontosJogador >= 1000){
Application.LoadLevel(2);
}

if(vidaJogador <=0){
Application.LoadLevel(3);
}
}
}
function zeraValores(){
 vidaJogador = 3;
 PontosJogador = 0;
 inimigo.inimigoVel = 5;
 jogadorVel = 500;
 estrelas.velocidade = 1;
}

function OnGUI() {
   
   
   GUI.Label(Rect(10,10,200,50), "Pontos: " + PontosJogador);
   GUI.Label(Rect(10,30,200,50), "Vidas: " + vidaJogador);
   
}


function OnTriggerEnter(outroObjeto:Collider){
	// var tempExplosao: Transform;
    if(outroObjeto.gameObject.tag == "inimigo"){
	    vidaJogador --;
		outroObjeto.gameObject.transform.position.z =  -5;
		outroObjeto.gameObject.transform.position.x = Random.Range(264, -201);
		tempExplosao = Instantiate(posExplosao,transform.position,transform.rotation);
		DestruirAviao();
		}
		
}
function DestruirAviao(){

  estado = State.Explodindo;
  Instantiate(posExplosao,transform.position, Quaternion.identity);
  gameObject.Find("aviao_Pjogador").renderer.enabled = false;
  transform.position = new Vector3(45, transform.position.y, -960);
  yield WaitForSeconds(2);
  gameObject.Find("aviao_Pjogador").renderer.enabled = true;
  
  if(vidaJogador > 0){
    yield WaitForSeconds(2);
  
  while(transform.position.z <=-760){
  movimento = 5;
  transform.position = new Vector3(45, transform.position.y, transform.position.z + movimento);
  yield 0;
  }
  estado = State.Invencivel;
  
  while(cont <= tempo_espera){
     gameObject.Find("aviao_Pjogador").renderer.enabled = !gameObject.Find("aviao_Pjogador").renderer.enabled;
     
     if(gameObject.Find("aviao_Pjogador").renderer.enabled == true)
      cont ++;
     yield WaitForSeconds(0.1);
     }
     cont = 0;
     estado = State.Jogando;
     }else{
     zeraValores();
      Application.LoadLevel(3);
      }
  }