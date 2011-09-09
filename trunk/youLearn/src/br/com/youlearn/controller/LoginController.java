package br.com.youlearn.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.youlearn.dao.UsuarioDao;
import br.com.youlearn.interceptor.Publico;
import br.com.youlearn.modelo.Usuario;
import br.com.youlearn.modelo.UsuarioWeb;

@Resource
public class LoginController {
	
	private final UsuarioDao userDao;
	private final Result result;
	private final UsuarioWeb usuarioWeb;
	
	public LoginController(UsuarioDao userDao, Result result, UsuarioWeb usuarioWeb) {
		this.userDao = userDao;
		this.result = result;
		this.usuarioWeb = usuarioWeb;
	}

	@Publico
	@Get @Path("/")
	public void login() {
	}
	
	@Publico
	@Post @Path("/login")
	public void login(Usuario usuario) {
		
		/* GERA MD5 DA SENHA */
		String senha;
		MessageDigest md = null; 
		try { 
			md = MessageDigest.getInstance("MD5"); 
		} catch (NoSuchAlgorithmException e) { 
			e.printStackTrace(); 
		} 
		BigInteger hash = new BigInteger(1, md.digest(usuario.getSenha().getBytes())); 
		senha = hash.toString(16);
		
		usuario.setSenha(senha); /* CARREGA A MD5 */
		
		Usuario carregado = userDao.carrega(usuario);
		String retorno = "false";
		if (carregado != null) {
			retorno="true";
			usuarioWeb.login(carregado);
		}
		result.use(Results.json()).from(retorno).serialize();
	}
}
