<%@ include file="../commons/headerProfile.jsp" %>
	<h1>Administra��o</h1>
	<div id="content">
		<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
			<h2 style="text-align:left">Menu</h2>
			<ul class="ca-menu-h">
				<li>
					<a href="<c:url value="/adm/usuarios/lista"/>">
						<span class="ca-icon-h">�</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Listar Usu�rios</h2>
							<h5 class="ca-sub-h">A��es sobre usu�rios</h3>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<c:url value="/adm/usuarios/novo"/>">
						<span class="ca-icon-h">U</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Cadastrar Usu�rios</h2>
							<h5 class="ca-sub-h">Gere novas oportunidades</h3>
						</div>
					</a>
				</li>
				
				<li>
					<a href="#">
						<span class="ca-icon-h">D</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Listar Cursos</h2>
							<h5 class="ca-sub-h">Procurando alguma coisa?</h3>
						</div>
					</a>
				</li>
				
				<li>
					<a href="#">
						<span class="ca-icon-h">F</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Cadastrar Cursos</h2>
							<h5 class="ca-sub-h">Novos cursos para todos!</h3>
						</div>
					</a>
				</li>
			</ul>
		</div>

		<div class="setenta left">
			<p>Fa�a o cadastro de novo usu�rio para ter acesso ao <b>youLearn</b>!</p>
			<p>Com este cadastro, o usu�rio poder�:</p>
			
				<ul>
					<li>Visualizar cursos dispon�vies</li>
					<li>Tirar as certifica��es que quiser</li>
					<li>Estudar conforme o tempo desej�vel</li>
					<li>Se administrador: cadastrar/editar/deletar usu�rios e cursos</li>
				</ul><br/>
		</div>
		
		<div class="setenta left" style="margin:10px 0px">
			<h2>Novos usu�rios</h2>
			<c:if test="${not empty sucesso}">
				<div id="notice" class="messageboxok">
					<p>${sucesso }</p>
				</div>
			</c:if>
			<c:if test="${not empty errors}">
				<div id="errors" class="messageboxerror">
					<c:forEach items="${errors }" var="error">
						${error.message }
					</c:forEach>
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
		</div>
		
	</div>
	
	<script type="text/javascript">
		$("#formulario").formToWizard({ submitButton: 'cadastrar' });
	</script>
	
<%@ include file="../commons/footerProfile.jsp" %>