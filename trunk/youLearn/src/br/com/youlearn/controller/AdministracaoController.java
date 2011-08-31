package br.com.youlearn.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.youlearn.dao.UsuarioDao;
import br.com.youlearn.modelo.Usuario;

@Resource
public class AdministracaoController {

	private final UsuarioDao userDao;
	private final Validator validator;
	private final Result result;
	
	public AdministracaoController(UsuarioDao userDao, Validator validator, Result result) {
		this.userDao = userDao;
		this.validator = validator;
		this.result = result;
	}
	
	@Get @Path("/adm/usuarios/novo")
	public void novoUsuario() {
	}
	
	@Post @Path("/adm/usuarios/novo")
	public void novoUser(Usuario usuario) {
		
		if (userDao.existeUsuario(usuario)) {
			validator.add(new ValidationMessage("Já existe usuário com este login!", "usuario.login"));
		}
		validator.onErrorUsePageOf(this).novoUsuario();
		
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
		
		/* ADICIONA USUÁRIO E REDIRECIONA PARA OUTRO CADASTRO */
		usuario.setSenha(senha);
		usuario.setDataCriacao(new Date());
		userDao.adiciona(usuario);
		result.include("sucesso", "Usuario " + usuario.getNome() + " cadastrado com sucesso!");
		result.redirectTo(this).novoUsuario();
	}
}
