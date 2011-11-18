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
	public void upload(Usuario usuario, final UploadedFile arquivo) {
		imagem.upload(arquivo, usuario);
		//result.redirectTo(this).usuario(usuario);
	}
	@Get @Path("/usuario/{usuario.id}/imagem")
	public File download(Usuario usuario) {
		return imagem.mostra(usuario);
	}
}
