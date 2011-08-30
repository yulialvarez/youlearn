package br.com.youlearn.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

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
		byte[] senhaB;
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.update(usuario.getSenha().getBytes());
			BASE64Encoder encoder = new BASE64Encoder ();
			senha = encoder.encode (digest.digest ());
		} catch (NoSuchAlgorithmException ns) {
			ns.printStackTrace ();
			senha = usuario.getSenha();
		} 
		
		/*try {
		    MessageDigest md = MessageDigest.getInstance("MD5");
		    md.update(usuario.getSenha().getBytes());
		    senhaB = md.digest();
		} catch (NoSuchAlgorithmException e) {
			senha = usuario.getSenha();
		}
		
		String s = new String();
		for (int i = 0; i < senhaB.length; i++)
			s += Integer.toHexString((((senhaB >> 4) & 0xf) << 4) | (senhaB & 0xf));
		senha = s;*/
		
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
