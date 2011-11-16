package br.com.youlearn.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class CursosUsuario {

	@Id @GeneratedValue
	private Long id;
	private String status; //cursando, aprovado, reprovado
	private Float notaPreTeste;
	private Float notaPosTeste;
	@OneToOne
	private Curso curso;
	
	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Float getNotaPreTeste() {
		return notaPreTeste;
	}
	public void setNotaPreTeste(Float notaPreTeste) {
		this.notaPreTeste = notaPreTeste;
	}
	public Float getNotaPosTeste() {
		return notaPosTeste;
	}
	public void setNotaPosTeste(Float notaPosTeste) {
		this.notaPosTeste = notaPosTeste;
	}
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
}
