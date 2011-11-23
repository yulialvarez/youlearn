package br.com.youlearn.controller;

import java.io.File;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.youlearn.dao.CursoDao;
import br.com.youlearn.dao.CursosUsuarioDao;
import br.com.youlearn.dao.QuestaoDao;
import br.com.youlearn.dao.UsuarioDao;
import br.com.youlearn.imagens.ImagemCurso;
import br.com.youlearn.interceptor.Administrador;
import br.com.youlearn.modelo.Curso;
import br.com.youlearn.modelo.CursosUsuario;
import br.com.youlearn.modelo.Questao;
import br.com.youlearn.modelo.Usuario;
import br.com.youlearn.modelo.UsuarioWeb;

@Resource
public class CursoController {

	private final Result result;
	
	private final CursoDao cursoDao;
	private final UsuarioDao userDao;
	private final CursosUsuarioDao cursosDao;
	private final QuestaoDao questaoDao;
	
	private final ImagemCurso imagem;
	private final UsuarioWeb usuarioWeb;
	
	private final Validator validator;
	
	public CursoController(Result result, 
						   CursoDao cursoDao, 
						   UsuarioDao userDao,
						   CursosUsuarioDao cursosDao,
						   QuestaoDao questaoDao,
						   ImagemCurso imagem, 
						   UsuarioWeb usuarioWeb,
						   Validator validator) {
		this.result = result;
		
		this.cursoDao = cursoDao;
		this.userDao = userDao;
		this.cursosDao = cursosDao;
		this.questaoDao = questaoDao;
		
		this.imagem = imagem;
		this.usuarioWeb = usuarioWeb;
		
		this.validator = validator;
	}
	
	@Get @Path("/curso/{curso.id}")
	public void curso(Curso curso) {
		result.include("curso", cursoDao.carregaPorId(curso));
		
		Boolean jaMatriculado = false;
		CursosUsuario cursoFeito = null;
		for (CursosUsuario cursoExistente : usuarioWeb.getUsuario().getCursos()) {
			if (cursoExistente.getCurso().getId().equals(curso.getId())) {
				jaMatriculado = true;
				cursoFeito = cursoExistente;
				break;
			}
		}
		result.include("jaMatriculado", jaMatriculado);
		result.include("cursoFeito", cursoFeito);
	}
	
	@Get @Path("/cursos")
	public void lista() {
		result.include("cursos", cursoDao.listarCursos());
	}
	
	@Get @Path("/curso/{curso.id}/matricula")
	public void matricula(Curso curso) {
		/* Verificar se já esta matriculado ou se ja fez o curso */
		for (CursosUsuario cursoExistente : usuarioWeb.getUsuario().getCursos()) {
			if (cursoExistente.getCurso().getId().equals(curso.getId())) {
				validator.add(new ValidationMessage("Você já realizou ou já está matriculado neste curso.", "esta.matriculado"));
				validator.onErrorUsePageOf(this).curso(curso);
			}
		}
		
		/* Faz a matricula */
		CursosUsuario cursoAMatricular = new CursosUsuario();
		cursoAMatricular.setCurso(curso);
		cursoAMatricular.setStatus("Cursando");
		cursosDao.salvar(cursoAMatricular);
		
		List<CursosUsuario> cursos = usuarioWeb.getUsuario().getCursos();
		cursos.add(cursoAMatricular);
		
		Usuario user = userDao.carregaPorId(usuarioWeb.getUsuario());
		user.setCursos(cursos);
		
		userDao.atualiza(user);
		
		result.redirectTo(this).curso(curso);
	}
	
	@Get @Path("/{curso.id}/pre-teste")
	public void preTeste(Curso curso) {
		Curso cursoC = cursoDao.carregaPorId(curso);
		result.include("curso", cursoC);
	}
	@Post @Path("/{curso.id}/pre-teste")
	public void cadastroPreTeste(Questao questao, Curso curso) {
		Questao question = new Questao();
		question.setResposta1(questao.getResposta1());
		question.setResposta2(questao.getResposta2());
		question.setResposta3(questao.getResposta3());
		question.setResposta4(questao.getResposta4());
		question.setCorreta(questao.getCorreta());
		question.setPergunta(questao.getPergunta());
		
		questaoDao.adicionar(question);
		
		Curso cursoC = cursoDao.carregaPorId(curso);
		List<Questao> questoes = cursoC.getPreTeste();
		questoes.add(question);
		
		cursoC.setPreTeste(questoes);
		
		cursoDao.atualiza(cursoC);
		
		result.redirectTo(this).curso(curso);
	}
	
	@Administrador
	@Post @Path("/curso/{curso.id}/imagem")
	public void uploadImg(Curso curso, final UploadedFile arquivo) {
		imagem.upload(arquivo, curso);
		result.redirectTo(this).curso(curso);
	}
	@Get @Path("/curso/{curso.id}/imagem")
	public File mostraImg(Curso curso) {
		return imagem.mostra(curso);
	}
	
}
