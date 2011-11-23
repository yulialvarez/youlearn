package br.com.youlearn.dao;

import org.hibernate.Session;

import br.com.caelum.vraptor.ioc.Component;
import br.com.youlearn.modelo.Questao;

@Component
public class QuestaoDao {

	private final Session session;
	
	public QuestaoDao(Session session) {
		this.session = session;
	}
	
	public void adicionar(Questao questao) {
		session.save(questao);
	}
	
}
