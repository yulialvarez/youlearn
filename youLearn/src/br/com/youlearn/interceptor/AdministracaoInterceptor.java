package br.com.youlearn.interceptor;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.youlearn.controller.InicioController;
import br.com.youlearn.modelo.UsuarioWeb;

@Intercepts
public class AdministracaoInterceptor implements Interceptor {

	private final UsuarioWeb usuarioWeb;
	private final Result result;
	
	public AdministracaoInterceptor(UsuarioWeb usuarioWeb, Result result) {
		this.usuarioWeb = usuarioWeb;
		this.result = result;
	}
	
	public boolean accepts(ResourceMethod method) {
		return method.containsAnnotation(Administrador.class);
	}
	
	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object resourceInstance) throws InterceptionException {
		
		if(usuarioWeb.getUsuario() != null && usuarioWeb.getUsuario().getPerfil().equals("administrador")) {
			stack.next(method, resourceInstance);
		} else {
			result.redirectTo(InicioController.class).index();
		}
	}
	
}
