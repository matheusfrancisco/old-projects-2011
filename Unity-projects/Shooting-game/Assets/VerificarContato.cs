using UnityEngine;
using System.Collections;

public class VerificarContato : MonoBehaviour {
	
	public Texture2D [] miras;
	private int miraAtual = 0;
	public GameObject  particulas;
	public int qtdPontos = 00;
	public int qtdErros = 00;
	public GUIText pontos;
	public GUIText erros;
	
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update(){
		if(Input.GetButtonDown("Fire1")){
			RaycastHit contato ;
			Vector3 direcao = transform.TransformDirection(Vector3.forward);
			if(Physics.Raycast(transform.position,direcao, out contato)){
				Quaternion rotacao = Quaternion.FromToRotation(Vector3.up,contato.normal);
				Instantiate(particulas, contato.point, rotacao);
				if(contato.rigidbody){
					contato.rigidbody.gameObject.SendMessage("Estrago");
					if(contato.rigidbody.gameObject.tag == "Alvo"){
						qtdPontos++;
						pontos.text = "Pontos:" +qtdPontos.ToString();
					}
					if(contato.rigidbody.gameObject.tag == "Erro"){
						qtdErros++;
						erros.text = "Erros: " +qtdErros.ToString();
					}
				}
			}
		}
	}
	
        public void OnGui(){
		int coluna = (Screen.width -
		miras[miraAtual].width) / 2;
		int linha = (Screen.height -
		miras[miraAtual].height) / 2;
		Rect regiao = new Rect(coluna, linha,
		miras[miraAtual].width,
	    miras[miraAtual].height);
		GUI.DrawTexture(regiao, miras [miraAtual]);
}
}
