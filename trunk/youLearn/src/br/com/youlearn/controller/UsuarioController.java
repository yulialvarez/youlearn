package br.com.youlearn.controller;

import java.io.File;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.youlearn.imagens.ImagemUsuario;
import br.com.youlearn.modelo.Usuario;

@Resource
public class UsuarioController {

	private final Result result;
	private final ImagemUsuario imagem;
	
	public UsuarioController(Result result, ImagemUsuario imagem) {
		this.result = result;
		this.imagem = imagem;
	}
	
	@Post @Path("/usuario/{usuario.id}/imagem")
	public void uploadImg(Usuario usuario, final UploadedFile arquivo) {
		System.out.println("usuario id:" + usuario.getId() + " arq:"+arquivo);
		imagem.upload(arquivo, usuario);
		result.redirectTo(this).editar();
	}
	@Get @Path("/usuario/{usuario.id}/imagem")
	public File mostraImg(Usuario usuario) {
		return imagem.mostra(usuario);
	}
	
	@Get @Path("/minhas-infos")
	public void editar() {
	}
	
}
