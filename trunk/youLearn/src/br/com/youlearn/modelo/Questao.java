package br.com.youlearn.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Questao {

	@Id @GeneratedValue
	private Long id;
	private String pergunta;
	private String respostas;
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
	public String getRespostas() {
		return respostas;
	}
	public void setRespostas(String respostas) {
		this.respostas = respostas;
	}
	public String getCorreta() {
		return correta;
	}
	public void setCorreta(String correta) {
		this.correta = correta;
	}
	
}
