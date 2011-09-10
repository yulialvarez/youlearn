<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	* { padding:0; margin:0; }
	.label { font-weight: bold; text-align:right; }
	#userVis { float:right; }
	#userVis td { padding:3px; }
	img.fotoUserVis { float:left; }
	#visualizar { border:1px solid #ccc; }
</style>
<img class="fotoUserVis" src="<c:url value="/imgs/foto.jpg"/>" alt="Usuário" width="280px" height="280px" />
<table id="userVis">
	<tr>
		<td class="label">Login: </td>
		<td>${usuario.login }</td>
	</tr>
	<tr>
		<td class="label">Nome: </td>
		<td>${usuario.nome }</td>
	</tr>
	<tr>
		<td class="label">Perfil: </td>
		<td>
			<c:if test="${usuario.perfil == 'aluno'}">
				Aluno
			</c:if>
			<c:if test="${usuario.perfil == 'administrador'}">
				Administrador
			</c:if>
		</td>
	</tr>
	<tr>
		<td class="label">Email: </td>
		<td>${usuario.email }</td>
	</tr>
	<tr>
		<td class="label">Nascimento: </td>
		<td><fmt:formatDate value="${usuario.aniversario }" type="date" pattern="dd/MM/yyyy"/></td>
	</tr>
	<tr>
		<td class="label">Criado em: </td>
		<td><fmt:formatDate value="${usuario.dataCriacao}" type="date" pattern="dd/MM/yyyy"/></td>
	</tr>
	<tr>
		<td class="label">Endereço: </td>
		<td>${usuario.endereco }</td>
	</tr>
	<tr>
		<td class="label">Telefone / Celular: </td>
		<td>${usuario.telefone } / ${usuario.celular }</td>
	</tr>
	<tr>
		<td class="label">Descrição: </td>
		<td>${usuario.descricao }</td>
	</tr>
</table>