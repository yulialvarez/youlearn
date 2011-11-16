package br.com.youlearn.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.youlearn.dao.CursoDao;
import br.com.youlearn.modelo.Curso;

@Resource
public class CursoController {

	private final Result result;
	private final CursoDao cursoDao;
	
	public CursoController(Result result, CursoDao cursoDao) {
		this.result = result;
		this.cursoDao = cursoDao;
	}
	
	@Get @Path("/curso/{curso.id}")
	public void curso(Curso curso) {
		result.include("curso", cursoDao.carregaPorId(curso));
	}
	
}
