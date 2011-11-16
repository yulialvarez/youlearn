package br.com.youlearn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.com.youlearn.modelo.Curso;

@Component
public class CursoDao {

	private final Session session;
	
	public CursoDao(Session session) {
		this.session = session;
	}
	
	public Long adicionar(Curso curso) {
		return (Long) session.save(curso);
	}
	
	public void remover(Curso curso) {
		session.delete(curso);
	}
	
	public Curso carregaPorId(Curso curso) {
		return (Curso) session.createCriteria(Curso.class).add(Restrictions.eq("id", curso.getId())).uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Curso> listarCursos() {
		return session.createCriteria(Curso.class).list();
	}
}
