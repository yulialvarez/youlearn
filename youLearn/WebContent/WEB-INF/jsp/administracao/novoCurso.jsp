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
					<a href="<c:url value="/adm/cursos/novo"/>">
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
			<p>Fa�a o cadastro de um novo curso no <b>youLearn</b>!</p>
			<p>Com este cadastro, o curso estar� dispon�vel para todos que quiserem acessar.
			Ap�s este cadastro o administrador dever� preencher um pr� e p�s teste, bem como os materiais de estudo.</p>
			<br/>
		</div>
		
		<div class="setenta left" style="margin:10px 0px">
			<h2>Novo curso</h2>
			<c:if test="${not empty errors}">
				<div id="errors" class="messageboxerror">
					<c:forEach items="${errors }" var="error">
						${error.message }
					</c:forEach>
				</div>
			</c:if>
			<form action="<c:url value="/adm/cursos/novo"/>" id="formulario" method="post">
				<fieldset>
					<legend>Informa��es sobre o curso</legend>
					<label for="nome">Nome:</label>
					<input type="text" id="nome" name="curso.nome" />
					<label for="descricao">Descri��o:</label>
					<textarea rows="10" cols="70" id="descricao" name="curso.descricao"></textarea>
				</fieldset>
				<input type="submit" id="cadastrar" value="Cadastrar" style="margin-top:10px;" />
			</form>
		</div>
	</div>
	
<%@ include file="../commons/footerProfile.jsp" %>