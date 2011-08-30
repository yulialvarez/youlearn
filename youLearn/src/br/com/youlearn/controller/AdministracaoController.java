package br.com.youlearn.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.youlearn.modelo.Usuario;

@Resource
public class AdministracaoController {

	@Get @Path("/adm/usuarios/novo")
	public void novoUsuario() {
	}
	
	@Post @Path("/adm/usuarios/novo")
	public void novoUser(Usuario usuario) {
		
		String senha;
		MessageDigest md = null; 
		try { 
			md = MessageDigest.getInstance("MD5"); 
		} catch (NoSuchAlgorithmException e) { 
			e.printStackTrace(); 
		} 
		BigInteger hash = new BigInteger(1, md.digest(usuario.getSenha().getBytes())); 
		senha = hash.toString(16);    
		
		System.out.println("Login: " + usuario.getLogin());
		System.out.println("Nome: " + usuario.getNome());
		System.out.println("Senha: " + usuario.getSenha() + " md5:" + senha);
		System.out.println("Perfil: " + usuario.getPerfil());
		System.out.println("Data de aniversario: " + usuario.getAniversario());
		System.out.println("Descricao: " + usuario.getDescricao());
		System.out.println("Celular: " + usuario.getCelular());
		System.out.println("Telefone: " + usuario.getTelefone());
		System.out.println("Endereco: " + usuario.getEndereco());
		System.out.println("Email: " + usuario.getEmail());
	}
}
