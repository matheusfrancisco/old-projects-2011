using UnityEngine;
using System.Collections;

public class GeradorDeBolas : MonoBehaviour {
	public GameObject bola;
	public GameObject erro;
	public float intervaloDeTempoParaGerarBola = 1.0f;
	public float intervaloDeTempoParaGerarErro = 1.0f;
	private Vector3 posicao;
	

	public void GerarBolas(){
		if((Time.fixedTime % intervaloDeTempoParaGerarBola) == 0){
			posicao = Random.insideUnitSphere * 100;
			
			posicao.x += transform.position.x;
			posicao.y = transform.position.y;
			posicao.z += transform.position.z;
			
				GameObject instanciaBola = (GameObject)
				Instantiate (bola,posicao,Random.rotation);
			
			instanciaBola.rigidbody.velocity = Vector3.up*3;
			
		}
	}
	
	public void GerarErro(){
		if((Time.fixedTime % intervaloDeTempoParaGerarBola) == 0){
			posicao = Random.insideUnitSphere * 100;
			
			posicao.x += transform.position.x;
			posicao.y = transform.position.y;
			posicao.z += transform.position.z;
			
			GameObject instanciaErro = (GameObject)
			Instantiate(erro,posicao,Random.rotation);
			
			instanciaErro.rigidbody.velocity = Vector3.up*4;
		}
	}
	public void FixedUpdate(){
		GerarBolas();
		GerarErro();
	}
}

