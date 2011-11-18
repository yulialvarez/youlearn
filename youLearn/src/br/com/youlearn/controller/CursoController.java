package br.com.youlearn.controller;

import java.io.File;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.youlearn.dao.CursoDao;
import br.com.youlearn.imagens.ImagemCurso;
import br.com.youlearn.interceptor.Administrador;
import br.com.youlearn.modelo.Curso;

@Resource
public class CursoController {

	private final Result result;
	private final CursoDao cursoDao;
	private final ImagemCurso imagem;
	
	public CursoController(Result result, CursoDao cursoDao, ImagemCurso imagem) {
		this.result = result;
		this.cursoDao = cursoDao;
		this.imagem = imagem;
	}
	
	@Get @Path("/curso/{curso.id}")
	public void curso(Curso curso) {
		result.include("curso", cursoDao.carregaPorId(curso));
	}
	
	@Administrador
	@Post @Path("/curso/{curso.id}/imagem")
	public void upload(Curso curso, final UploadedFile arquivo) {
		imagem.upload(arquivo, curso);
		result.redirectTo(this).curso(curso);
	}
	@Get @Path("/curso/{curso.id}/imagem")
	public File download(Curso curso) {
		return imagem.mostra(curso);
	}
	
}
