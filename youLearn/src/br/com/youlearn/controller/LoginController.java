package br.com.youlearn.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;

@Resource
public class LoginController {

	@Get @Path("/")
	public void login() {
	}
	
	@Get @Path("/novousuario")
	public void novoUsuario() {
	}
}
