<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>youLearn - Sharing skills</title>
</head>
<body>
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
		Login: <input type="text" id="login" name="usuario.login" />
		<br/>
		Nome:<input type="text" id="nome" name="usuario.nome" />
		<br/>
		Senha: <input type="password" id="senha" name="usuario.senha" />
		<br/>
		Perfil: <select id="perfil" name="usuario.perfil"><option selected value="aluno">Aluno</option><option value="administrador">Administrador</option></select>
		<br/>
		Data de nascimento: <input type="text" id="aniversario" name="usuario.aniversario" />
		<br/>
		Descrição: <textarea id="descricao" name="usuario.descricao" rows="5" cols="30"></textarea>
		<br/>
	 	Email: <input type="text" id="email" name="usuario.email" />
	 	<br/>
		Endereço: <input type="text" id="endereco" name="usuario.endereco" />
		<br/>
		Telefone: <input type="text" id="telefone" name="usuario.telefone" />
		<br/>
		Celular: <input type="text" id="celular" name="usuario.celular" />
		<br/>
		<input type="submit" value="Cadastrar" />
	</form>

</body>
</html>