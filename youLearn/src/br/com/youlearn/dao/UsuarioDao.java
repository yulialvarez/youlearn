package br.com.youlearn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.com.youlearn.modelo.Usuario;

@Component
public class UsuarioDao {

	private final Session session;
	
	public UsuarioDao(Session session) {
		this.session = session;
	}
	
	public void adiciona(Usuario usuario) {
		session.save(usuario);
	}
	
	public boolean existeUsuario(Usuario usuario) {
		Usuario encontrado = (Usuario) session.createCriteria(Usuario.class)
									.add(Restrictions.eq("login", usuario.getLogin()))
									.uniqueResult();
		return encontrado != null;
	}
	
	public Usuario carrega(Usuario usuario) {
		return (Usuario) session.createCriteria(Usuario.class).add(Restrictions.eq("login", usuario.getLogin()))
															  .add(Restrictions.eq("senha", usuario.getSenha()))
															  .uniqueResult();
	}
	
	public Usuario carregaPorId(Usuario usuario) {
		return (Usuario) session.createCriteria(Usuario.class).add(Restrictions.eq("id", usuario.getId())).uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> listaTodos() {
		return session.createCriteria(Usuario.class).list();
	}

	public void refresh(Usuario usuario) {
		session.refresh(usuario);
	}
}
