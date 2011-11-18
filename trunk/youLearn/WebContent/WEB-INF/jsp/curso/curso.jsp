<%@ include file="../commons/headerProfile.jsp" %>

	<h1>${curso.nome }</h1>
	
	<div class="setenta left">
		${curso.descricao }
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
			<li>
				<a href="#">
					<span class="ca-icon-h">.</span>
					<div class="ca-content-h">
						<h4 class="ca-main-h">Matrícula</h2>
						<h5 class="ca-sub-h">Comece este curso!</h3>
					</div>
				</a>
			</li>
			
			<li>
				<a href="#">
					<span class="ca-icon-h">j</span>
					<div class="ca-content-h">
						<h4 class="ca-main-h">Realizar pré-teste</h2>
						<h5 class="ca-sub-h">Veja seu desempenho!</h3>
					</div>
				</a>
			</li>
		</ul>
		
	</div>
	
	<div class="setenta left" style="margin:10px 0px">
		<h2>Pré Teste</h2>
		<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
			<a href="#" class="btnLaranja" style="float:right">Adicionar pré-teste</a>
			<div class="clear"></div>
		</c:if>
		<div class="messagebox">
			<p>É necessário se matricular neste curso.</p>
		</div>
		<div class="messageboxinfo">
			<p>Ainda não realizado. <a href="#">Começar pré-teste</a></p>
		</div>
		<p style="color:red">Nota: 5.0</p>
		<p style="color:green">Nota: 7.0</p>
		
		<h2>Conteúdo</h2>
		<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
			<a href="#" class="btnLaranja" style="float:right">Adicionar material</a>
			<div class="clear"></div>
		</c:if>
		<div class="messagebox">
			<p>É necessário se matricular neste curso.</p>
		</div>
		<div class="messageboxerror">
			<p>Bloqueado. Realizar antes o pré-teste.</p>
		</div>
		<p>Conteúdo</p>
		
		
		<h2>Pós Teste</h2>
		<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
			<a href="#" class="btnLaranja" style="float:right">Adicionar pós-teste</a>
			<div class="clear"></div>
		</c:if>
		<div class="messagebox">
			<p>É necessário se matricular neste curso.</p>
		</div>
		<div class="messageboxerror">	
			<p>Bloqueado. Realizar antes o pré-teste.</p>
		</div>
		<div class="messageboxinfo">
			<p>Ainda não realizado. <a href="#">Começar pós-teste</a></p>
		</div>
		<p style="color:red">Nota: 5.0 <b>(reprovado)</b></p>
		<p style="color:green">Nota: 7.0 <b>(aprovado)</b></p>
	</div>
	
<%@ include file="../commons/footerProfile.jsp" %>