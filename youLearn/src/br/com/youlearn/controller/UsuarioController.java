package br.com.youlearn.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.youlearn.imagens.ImagemUsuario;
import br.com.youlearn.modelo.CursosUsuario;
import br.com.youlearn.modelo.Usuario;
import br.com.youlearn.modelo.UsuarioWeb;

@Resource
public class UsuarioController {

	private final Result result;
	private final ImagemUsuario imagem;
	private final UsuarioWeb usuarioWeb;
	
	public UsuarioController(Result result, ImagemUsuario imagem, UsuarioWeb usuarioWeb) {
		this.result = result;
		this.imagem = imagem;
		this.usuarioWeb = usuarioWeb;
	}
	
	@Get @Path("/minhas-infos")
	public void editar() {
	}
	
	@Get @Path("/meus-cursos")
	public void meusCursos() {
		List<CursosUsuario> aprovados = new ArrayList<CursosUsuario>();
		List<CursosUsuario> reprovados = new ArrayList<CursosUsuario>();
		List<CursosUsuario> cursando = new ArrayList<CursosUsuario>();
		
		for (CursosUsuario curso : usuarioWeb.getUsuario().getCursos()) {
			if (curso.getStatus().equals("Aprovado")) aprovados.add(curso);
			else if (curso.getStatus().equals("Reprovado")) reprovados.add(curso);
			else cursando.add(curso);
		}
		
		result.include("aprovados",aprovados);
		result.include("reprovados",reprovados);
		result.include("cursando",cursando);
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
}
