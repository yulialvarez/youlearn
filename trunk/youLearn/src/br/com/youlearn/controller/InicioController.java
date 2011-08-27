package br.com.youlearn.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;

@Resource
public class InicioController {

	@Get @Path("/inicio")
	public void index() {
	}
	
}
