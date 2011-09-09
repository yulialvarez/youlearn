package br.com.youlearn.interceptor;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.youlearn.controller.LoginController;
import br.com.youlearn.dao.UsuarioDao;
import br.com.youlearn.modelo.UsuarioWeb;

@Intercepts
public class AutenticacaoInterceptor implements Interceptor {

	private final UsuarioWeb usuarioWeb;
	private final UsuarioDao userDao;
	private final Result result;
	
	public AutenticacaoInterceptor(UsuarioWeb usuarioWeb, UsuarioDao userDao, Result result) {
		this.usuarioWeb = usuarioWeb;
		this.userDao = userDao;
		this.result = result;
	}
	
	public boolean accepts(ResourceMethod method) {
		return !method.containsAnnotation(Publico.class);
	}

	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object resourceInstance) throws InterceptionException {
		
		if (usuarioWeb.isLogado()) {
			userDao.refresh(usuarioWeb.getUsuario());
			stack.next(method, resourceInstance);
		} else {
			result.redirectTo(LoginController.class).login();
		}
	
	}

	
	
}
