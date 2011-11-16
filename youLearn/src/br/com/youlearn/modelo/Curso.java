package br.com.youlearn.modelo;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.validator.NotNull;

@Entity
public class Curso {

	@Id @GeneratedValue
	private Long id;
	@NotNull
	private String nome;
	@NotNull
	private String descricao;
	@NotNull
	private Date dataCriacao;
	@OneToMany
	private List<Disciplina> disciplina;
	@OneToMany
	private List<Questao> preTeste;
	@OneToMany
	private List<Questao> posTeste;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Date getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public void setDisciplina(List<Disciplina> disciplina) {
		this.disciplina = disciplina;
	}
	public List<Disciplina> getDisciplina() {
		return disciplina;
	}
	public void setPreTeste(List<Questao> preTeste) {
		this.preTeste = preTeste;
	}
	public List<Questao> getPreTeste() {
		return preTeste;
	}
	public void setPosTeste(List<Questao> posTeste) {
		this.posTeste = posTeste;
	}
	public List<Questao> getPosTeste() {
		return posTeste;
	}
}
