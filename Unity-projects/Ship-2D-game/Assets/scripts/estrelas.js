static var velocidade = 1;

function Update(){
varMovimento = velocidade;
transform.Translate(Vector3.back * varMovimento);

if(transform.position.z <-1234.027){
	transform.position = new Vector3(transform.position.x, transform.position.y,394.2509);
	}

}