<%@ include file="../commons/headerProfile.jsp" %>

	<h1>${curso.nome }</h1>
	
	<div class="setenta left">
		${curso.descricao }
		<br /> <br />
		<c:if test="${not empty errors}">
			<div id="errors" class="messageboxerror">
				<c:forEach items="${errors }" var="error">
					${error.message }
				</c:forEach>
			</div>
		</c:if>
	</div>
	
	<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
		<h2 style="text-align:left">Curso</h2>
		<img src="<c:url value="/curso/${curso.id }/imagem"/>" alt="Curso" class="fotoProfile"/>
		<br/>
		<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
			<a href="#" style="text-align:center">Editar Curso</a> <b>|</b> 
		</c:if>
		${curso.nome }
		<br/>
		<p>Reallizado por <b>3</b> usuários</p>
		
		<ul class="ca-menu-h">
			<c:if test="${!jaMatriculado }">
				<li>
					<a href="<c:url value="/curso/${curso.id }/matricula"/>">
						<span class="ca-icon-h">.</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Matrícula</h2>
							<h5 class="ca-sub-h">Comece este curso!</h3>
						</div>
					</a>
				</li>
			</c:if>
			
			<c:if test="${jaMatriculado }">
				<c:if test="${empty cursoFeito.notaPreTeste}">
					<li>
						<a href="#">
							<span class="ca-icon-h">j</span>
							<div class="ca-content-h">
								<h4 class="ca-main-h">Realizar pré-teste</h2>
								<h5 class="ca-sub-h">Veja seu desempenho!</h3>
							</div>
						</a>
					</li>
				</c:if>
				
				<c:if test="${empty cursoFeito.notaPosTeste && not empty cursoFeito.notaPreTeste }">
					<li>
						<a href="#">
							<span class="ca-icon-h">j</span>
							<div class="ca-content-h">
								<h4 class="ca-main-h">Realizar pós-teste</h2>
								<h5 class="ca-sub-h">Veja seu desempenho!</h3>
							</div>
						</a>
					</li>
				</c:if>
			</c:if>
		</ul>
		
	</div>
	
	<div class="setenta left" style="margin:10px 0px">
		<h2>Pré Teste</h2>
		<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
			<a href="#" class="btnLaranja" style="float:right">Adicionar pré-teste</a>
			<div class="clear"></div>
		</c:if>
		
		<c:if test="${!jaMatriculado }">
			<div class="messagebox">
				<p>É necessário se matricular neste curso.</p>
			</div>
		</c:if>
		<c:if test="${jaMatriculado && empty cursoFeito.notaPreTeste }">
			<div class="messageboxinfo">
				<p>Ainda não realizado. <a href="#">Começar pré-teste</a></p>
			</div>
		</c:if>
		<c:if test="${jaMatriculado && not empty cursoFeito.notaPreTeste }">
			<p style="color:red">Nota: 5.0</p>
			<p style="color:green">Nota: 7.0</p>
		</c:if>
		
		<h2 style="margin-top:10px;">Conteúdo</h2>
		<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
			<a href="#" class="btnLaranja" style="float:right">Adicionar material</a>
			<div class="clear"></div>
		</c:if>
		
		<c:if test="${!jaMatriculado }">
			<div class="messagebox">
				<p>É necessário se matricular neste curso.</p>
			</div>
		</c:if>
		<c:if test="${jaMatriculado && empty cursoFeito.notaPreTeste }">
			<div class="messageboxerror">
				<p>Bloqueado. Realizar antes o pré-teste.</p>
			</div>
		</c:if>
		<c:if test="${jaMatriculado && not empty cursoFeito.notaPreTeste }">
			<p>Conteúdo</p>
		</c:if>
		
		<h2 style="margin-top:10px;">Pós Teste</h2>
		<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
			<a href="#" class="btnLaranja" style="float:right">Adicionar pós-teste</a>
			<div class="clear"></div>
		</c:if>
		
		<c:if test="${!jaMatriculado }">
			<div class="messagebox">
				<p>É necessário se matricular neste curso.</p>
			</div>
		</c:if>
		<c:if test="${jaMatriculado && empty cursoFeito.notaPreTeste }">
			<div class="messageboxerror">	
				<p>Bloqueado. Realizar antes o pré-teste.</p>
			</div>
		</c:if>
		<c:if test="${jaMatriculado && not empty cursoFeito.notaPreTeste }">
			<div class="messageboxinfo">
				<p>Ainda não realizado. <a href="#">Começar pós-teste</a></p>
			</div>
		</c:if>
		<c:if test="${jaMatriculado && not empty cursoFeito.notaPosTeste }">
			<p style="color:red">Nota: 5.0 <b>(reprovado)</b></p>
			<p style="color:green">Nota: 7.0 <b>(aprovado)</b></p>
		</c:if>
	</div>
	
<%@ include file="../commons/footerProfile.jsp" %>