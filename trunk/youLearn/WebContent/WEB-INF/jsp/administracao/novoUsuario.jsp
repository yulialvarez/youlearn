<%@ include file="../commons/headerProfile.jsp" %>
	<h1>Novos usuários</h1>
	<p>Faça o cadastro de novo usuário para ter acesso ao <b>youLearn<u>!</u></b></p>
	<p>Com este cadastro, o usuário poderá acessar e realizar qualquer curso disponibilizado no sistema.<br/>
	O acesso administrador dará opções para cadastrar/editar/deletar usuários e cursos (e respectivas disciplinas), como também acesso a todas informações e configurações do sistema e status.</p>
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
			<label for="nome">Nome:</label>
			<input type="text" id="nome" name="usuario.nome" />
			<label for="email">Email:</label> 
		 	<input type="text" id="email" name="usuario.email" />
			<label for="aniversario">Data de nascimento:</label> 
			<input type="text" id="aniversario" name="usuario.aniversario" />
			<label for="endereco">Endereço:</label> 
			<input type="text" id="endereco" name="usuario.endereco" />
			<label for="telefone">Telefone:</label>
			<input type="text" id="telefone" name="usuario.telefone" />
			<label for="celular">Celular:</label>
			<input type="text" id="celular" name="usuario.celular" />
			<label for="descricao">Descrição:</label>
			<textarea id="descricao" name="usuario.descricao" rows="5" cols="60"></textarea>
		</fieldset>
		<input type="submit" id="cadastrar" value="Cadastrar" style="margin-top:10px;" />
	</form>
	<script type="text/javascript">
		$("#formulario").formToWizard({ submitButton: 'cadastrar' });
	</script>
<%@ include file="../commons/footerProfile.jsp" %>