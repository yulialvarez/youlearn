package br.com.youlearn.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Questao {

	@Id @GeneratedValue
	private Long id;
	private String pergunta;
	private String resposta1;
	private String resposta2;
	private String resposta3;
	private String resposta4;
	private String correta;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPergunta() {
		return pergunta;
	}
	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}
	public String getCorreta() {
		return correta;
	}
	public void setCorreta(String correta) {
		this.correta = correta;
	}
	public void setResposta1(String resposta1) {
		this.resposta1 = resposta1;
	}
	public String getResposta1() {
		return resposta1;
	}
	public void setResposta2(String resposta2) {
		this.resposta2 = resposta2;
	}
	public String getResposta2() {
		return resposta2;
	}
	public void setResposta4(String resposta4) {
		this.resposta4 = resposta4;
	}
	public String getResposta4() {
		return resposta4;
	}
	public void setResposta3(String resposta3) {
		this.resposta3 = resposta3;
	}
	public String getResposta3() {
		return resposta3;
	}
	
}
