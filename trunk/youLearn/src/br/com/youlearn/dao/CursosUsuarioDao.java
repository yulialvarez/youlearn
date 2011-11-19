package br.com.youlearn.dao;

import org.hibernate.Session;

import br.com.caelum.vraptor.ioc.Component;
import br.com.youlearn.modelo.CursosUsuario;


@Component
public class CursosUsuarioDao {

	private final Session session;
	
	public CursosUsuarioDao(Session session) {
		this.session = session;
	}
	
	public void salvar(CursosUsuario curso) {
		session.save(curso);
	}
	
}
