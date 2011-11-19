<%@ include file="../commons/headerProfile.jsp" %>
	<h1>Meus Cursos</h1>
	
	<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
		<h2 style="text-align:left">Menu</h2>
		<ul class="ca-menu-h">
			<li>
				<a href="<c:url value="/meus-cursos"/>">
					<span class="ca-icon-h">p</span>
					<div class="ca-content-h">
						<h4 class="ca-main-h">Meus Cursos</h2>
						<h5 class="ca-sub-h">O seu aprendizado!</h3>
					</div>
				</a>
			</li>
			
			<li>
				<a href="<c:url value="/minhas-infos"/>">
					<span class="ca-icon-h">S</span>
					<div class="ca-content-h">
						<h4 class="ca-main-h">Editar informa��es</h2>
						<h5 class="ca-sub-h">Altere seus dados</h3>
					</div>
				</a>
			</li>
			
			<li>
				<a href="<c:url value="/inicio"/>">
					<span class="ca-icon-h">h</span>
					<div class="ca-content-h">
						<h4 class="ca-main-h">Voltar</h2>
						<h5 class="ca-sub-h">Voltar a pagina inicial</h3>
					</div>
				</a>
			</li>
		</ul>
	</div>
	
	<div class="setenta left" style="margin:10px 0px">
		<h2>Em andamento</h2>
		<c:choose>
			<c:when test="${empty cursando }">
				<div class="messagebox">
					<p>No momento voc� n�o possui curso em andamento. <a href="">Ver os cursos</a></p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${cursando }" var="cursoC">
					${cursoC.curso.nome } - <a href="<c:url value="/curso/${cursoC.curso.id }"/>">Ir para</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<h2 style="margin-top:10px;">Aprovados</h2>
		<c:choose>
			<c:when test="${empty aprovados }">
				<div class="messagebox">
					<p>Voc� n�o possui nenhuma aprova��o. <a href="">Tire j� seu certificado!</a></p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${aprovados }" var="cursoA">
					${cursoA.curso.nome } - <a href=#">Minha certifica��o</a> - Pr�: ${cursoA.notaPreTeste } - P�s: {$cursoA.notaPosTeste }
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<h2 style="margin-top:10px;">Reprovados</h2>
		<c:choose>
			<c:when test="${empty reprovados }">
				<div class="messageboxinfo">
					<p>Voc� n�o possui nenhuma reprova��o.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reprovados }" var="cursoR">
					${cursoR.curso.nome } - Pr�: ${cursoR.notaPreTeste } - P�s: {$cursoR.notaPosTeste }
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
<%@ include file="../commons/footerProfile.jsp" %>