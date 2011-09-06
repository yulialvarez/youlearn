<%@ include file="../commons/headerProfile.jsp" %>
	<h1>Novos usu�rios</h1>
	<p>Fa�a o cadastro de novo usu�rio para ter acesso ao <b>youLearn<u>!</u></b></p>
	<p>Com este cadastro, o usu�rio poder� acessar e realizar qualquer curso disponibilizado no sistema.<br/>
	O acesso administrador dar� op��es para cadastrar/editar/deletar usu�rios e cursos (e respectivas disciplinas), como tamb�m acesso a todas informa��es e configura��es do sistema e status.</p>
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
			<legend>Cadastro de usu�rio</legend>
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
			<legend>Informa��es pessoais</legend>
			<label for="nome">Nome:</label>
			<input type="text" id="nome" name="usuario.nome" />
			<label for="email">Email:</label> 
		 	<input type="text" id="email" name="usuario.email" />
			<label for="aniversario">Data de nascimento:</label> 
			<input type="text" id="aniversario" name="usuario.aniversario" />
			<label for="endereco">Endere�o:</label> 
			<input type="text" id="endereco" name="usuario.endereco" />
			<label for="telefone">Telefone:</label>
			<input type="text" id="telefone" name="usuario.telefone" />
			<label for="celular">Celular:</label>
			<input type="text" id="celular" name="usuario.celular" />
			<label for="descricao">Descri��o:</label>
			<textarea id="descricao" name="usuario.descricao" rows="5" cols="60"></textarea>
		</fieldset>
		<input type="submit" id="cadastrar" value="Cadastrar" style="margin-top:10px;" />
	</form>
	<script type="text/javascript">
		$("#formulario").formToWizard({ submitButton: 'cadastrar' });
	</script>
<%@ include file="../commons/footerProfile.jsp" %>