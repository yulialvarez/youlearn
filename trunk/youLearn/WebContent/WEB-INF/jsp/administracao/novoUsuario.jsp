<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>youLearn - Sharing skills</title>
<script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/formToWizard.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>" media="screen" />
</head>
<body>
	<div id="wrapper">
		<div id="topo">
			<img src="<c:url value="/imgs/logo2.png"/>" alt="ChingLing!" style="margin-top:5px" />
			<input type="text" name="pesquisaCurso" id="pesquisaCurso" value="Pesquisar cursos..." style="float:right; margin-top:20px" />
		</div>
		<div style="clear:both"></div>
		<div id="principal-meio">
			<div id="sobre-atual">
				<img src="<c:url value="/imgs/foto.jpg"/>" alt="Usuário" width="280px" height="280px" />
				<h2 class="nome">Vinícius Marcus Michelutti</h2>
				<p><b>De<u>:</u></b> Joinville</p>
				<p><b>Idade<u>:</u></b> 18 anos</p>
				<p><b>Cursos completos<u>:</u></b> 5</p>
			</div>
			
			<ul id="nav">
				<li class="submenu">
					<a href="#">Administração</a>
					<ul>
						<li class="subs">
							<a href="#" >Cursos</a>
							<ul>
								<li><a href="#">Adicionar curso</a></li>
								<li><a href="#">Editar curso</a></li>
							</ul>
						</li>
						<li class="subs">
							<a href="#">Usuários</a>
							<ul>
								<li><a href="#">Adicionar usuário</a></li>
								<li><a href="#">Listar usuários</a></li>
							</ul>
						</li>
						<li><a href="#">Status</a></li>
					</ul>
				</li>
				<li><a href="#">Início</a></li>
				<li class="submenu">
					<a href="#">Minha central</a>
					<ul>
						<li class="subs">
							<a href="#">Meus Cursos</a>
							<ul>
								<li><a href="#">Em andamento</a></li>
								<li><a href="#">Certificações</a></li>
							</ul>
						</li>
						<li><a href="#">Editar informações</a></li>
					</ul>
				</li>
				<li><a href="#">Cursos</a></li>
			</ul>
			
			<script type="text/javascript">
				function fazMenu() {
					var sfEls = document.getElementById("nav").getElementsByTagName("LI");
					for (var i=0; i<sfEls.length; i++) {
						sfEls[i].onmouseover=function() {
							this.className+=" sfhover";
						}
						sfEls[i].onmouseout=function() {
							this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
						}
					}
				}
			</script>
			<h1>Novos usuários</h1>
			<p>Faça o cadastro de novo usuário para ter acesso ao <b>youLearn<u>!</u></b></p>
			<div style="margin-top:20px;">
				<c:if test="${not empty sucesso}">
					<div id="notice">
						<p>${sucesso }</p>
					</div>
				</c:if>
				<c:if test="${not empty errors}">
					<div id="errors">
						<ul>
							<c:forEach items="${errors }" var="error">
								<li>${error.category } - ${error.message }</li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				<form action="<c:url value="/adm/usuarios/novo"/>" id="formulario" method="POST">
					<fieldset>
						<legend>Cadastro de usuário</legend>
						<label for="login">Login:</label>
						<input type="text" id="login" name="usuario.login" />
						<label for="nome">Nome:</label>
						<input type="text" id="nome" name="usuario.nome" />
						<label for="senha">Senha:</label>
						<input type="password" id="senha" name="usuario.senha" />
						<label for="perfil">Perfil:</label>
						<select id="perfil" name="usuario.perfil">
							<option selected value="aluno">Aluno</option>
							<option value="administrador">Administrador</option>
						</select>
					</fieldset>
					<fieldset>
						<legend>Informações pessoais</legend>
						<label for="aniversario">Data de nascimento:</label> 
						<input type="text" id="aniversario" name="usuario.aniversario" />
						<label for="descricao">Descrição:</label>
						<textarea id="descricao" name="usuario.descricao" rows="5" cols="30"></textarea>
					 	<label for="email">Email:</label> 
					 	<input type="text" id="email" name="usuario.email" />
						<label for="endereco">Endereço:</label> 
						<input type="text" id="endereco" name="usuario.endereco" />
						<label for="telefone">Telefone:</label>
						<input type="text" id="telefone" name="usuario.telefone" />
						<label for="celular">Celular:</label>
						<input type="text" id="celular" name="usuario.celular" />
						<input type="submit" id="cadastrar" value="Cadastrar" />
					</fieldset>
				</form>
				<script type="text/javascript">
					$("#formulario").formToWizard({ submitButton: 'cadastrar' });
				</script>
			</div>
			<br/>
		</div>
	</div>
	<div id="rodape">
		TESTE NOME DE USUÁRIO - YOULEARN - O SEU SISTEMA DE ENSINO!
	</div>
</body>
</html>