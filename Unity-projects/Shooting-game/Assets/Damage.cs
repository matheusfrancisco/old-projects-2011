using UnityEngine;
using System.Collections;

public class Damage : MonoBehaviour {

public void Estrago(){
	particleEmitter.emit = true;
    Destroy(gameObject, 1);
	}
	
	// Update is called once per frame
	void Update () {
		if(transform.position.y > 70)
		{Destroy(gameObject);}
	
	}
}
