<%@ include file="../commons/headerProfile.jsp" %>
	<h1>Administração</h1>
	<div id="content">
	
		<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
			<h2 style="text-align:left">Menu</h2>
			<ul class="ca-menu-h">
				<li>
					<a href="<c:url value="/adm/usuarios/lista"/>">
						<span class="ca-icon-h">³</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Listar Usuários</h2>
							<h5 class="ca-sub-h">Ações sobre usuários</h3>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<c:url value="/adm/usuarios/novo"/>">
						<span class="ca-icon-h">U</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Cadastrar Usuários</h2>
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
			<p>Faça o cadastro de um novo curso no <b>youLearn</b>!</p>
			<p>Com este cadastro, o curso estará disponível para todos que quiserem acessar.
			Após este cadastro o administrador deverá preencher um pré e pós teste, bem como os materiais de estudo.</p>
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
					<legend>Informações sobre o curso</legend>
					<label for="nome">Nome:</label>
					<input type="text" id="nome" name="curso.nome" />
					<label for="descricao">Descrição:</label>
					<textarea rows="10" cols="70" id="descricao" name="curso.descricao"></textarea>
				</fieldset>
				<input type="submit" id="cadastrar" value="Cadastrar" style="margin-top:10px;" />
			</form>
		</div>
	</div>
	
<%@ include file="../commons/footerProfile.jsp" %>