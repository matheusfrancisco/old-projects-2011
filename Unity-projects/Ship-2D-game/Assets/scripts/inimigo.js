static var inimigoVel = 5;

function Update () {
	var_Velpedra = inimigoVel;
	velRotacao = 30 * Time.deltaTime;
	transform.Rotate(new Vector3(1,2,0)* velRotacao);
	
	
	//
	transform.Translate(Vector3.back * var_Velpedra, Space.World);
	
	if(transform.position.z <= -929) {
	     transform.position.z = 58;
		 
		 transform.position.x = Random.Range(264, -201);
		 
	}

}