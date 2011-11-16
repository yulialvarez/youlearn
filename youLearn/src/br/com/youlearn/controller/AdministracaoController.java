package br.com.youlearn.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.youlearn.dao.CursoDao;
import br.com.youlearn.dao.UsuarioDao;
import br.com.youlearn.interceptor.Administrador;
import br.com.youlearn.modelo.Curso;
import br.com.youlearn.modelo.Usuario;

@Resource
public class AdministracaoController {

	private final UsuarioDao userDao;
	private final CursoDao cursoDao;
	private final Validator validator;
	private final Result result;
	
	public AdministracaoController(UsuarioDao userDao, CursoDao cursoDao, Validator validator, Result result) {
		this.userDao = userDao;
		this.cursoDao = cursoDao;
		this.validator = validator;
		this.result = result;
	}
	
	@Administrador
	@Get @Path("/adm/usuarios/novo")
	public void novoUsuario() {
	}
	@Administrador
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
		result.include("sucesso", "Usuário " + usuario.getNome() + " cadastrado com sucesso!");
		result.redirectTo(this).novoUsuario();
	}
	
	@Administrador
	@Get @Path("/adm/usuarios/lista")
	public void listaUsuario() {
		List<Usuario> usuarios = new ArrayList<Usuario>();
		List<Usuario> lista = userDao.listaTodos();
		for (Usuario users : lista) {
			Usuario novoUser = new Usuario();
			novoUser.setId(users.getId());
			novoUser.setLogin(users.getLogin());
			novoUser.setNome(users.getNome());
			novoUser.setEmail(users.getEmail());
			novoUser.setDataCriacao(users.getDataCriacao());
			novoUser.setPerfil(users.getPerfil());
			
			usuarios.add(novoUser);
		}
		
		result.include("lista", usuarios);
	}
	
	@Administrador
	@Get @Path("/adm/usuarios/{usuario.id}/visualizar")
	public void visualizaUsuario(Usuario usuario) {
		result.include("usuario", userDao.carregaPorId(usuario));
	}
	
	@Administrador
	@Get @Path("/adm/usuarios/{usuario.id}/editar")
	public void editaUsuario(Usuario usuario) {
		result.include("usuario", userDao.carregaPorId(usuario));
	}
	
	@Administrador
	@Get @Path("/adm/usuarios/{usuario.id}/excluir")
	public void deletaUsuario(Usuario usuario) {
		Usuario user = userDao.carregaPorId(usuario);
		userDao.remover(user);
		
		result.redirectTo(this).listaUsuario();
	}
	
	@Administrador
	@Get @Path("/adm/cursos/novo")
	public void novoCurso() {
	}
	@Administrador
	@Post @Path("/adm/cursos/novo")
	public void novoCourse(Curso curso) {
		if ("".equals(curso.getNome().trim()) || "".equals(curso.getDescricao().trim())) {
			validator.add(new ValidationMessage("Preencha todos os campos!", "curso.preenchacampos"));
		}
		validator.onErrorUsePageOf(this).novoCurso();
		
		curso.setDataCriacao(new Date());
		
		Long id = cursoDao.adicionar(curso);
		
		Curso novo = new Curso();
		novo.setId(id);
		
		result.redirectTo(CursoController.class).curso(novo);
	}
}
