<%@ include file="../commons/headerProfile.jsp" %>	
	<h1>Minhas informações</h1>
	
	<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
		<h2 style="text-align:left">Menu</h2>
		<ul class="ca-menu-h">
			<li>
				<a href="#">
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
						<h4 class="ca-main-h">Editar informações</h2>
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
	
	<div class="right" id="featured" style="text-align:center; margin-right:10px">
		<img src="<c:url value="/usuario/${usuarioWeb.usuario.id }/imagem"/>" alt="Minha imagem" class="fotoProfile"/>
		<form action="<c:url value="/usuario/${usuarioWeb.usuario.id }/imagem"/>" method="POST" enctype="multipart/form-data">
			<input type="file" name="arquivo" /><br/>
			<input type="submit" value="Enviar" style="float:right" />
		</form>
	</div>
	<div class="left">
		Com os seus dados alterados aqui, você pode: 
		
		<ul>
			<li>Alterar a sua foto de exibição</li>
			<li>Alterar seu nome/email/endereço</li>
			<li>Alterar a sua senha</li>
			<li>O campo de login será fixo, caso queira um novo solicite ao administrador</li>
		</ul>
	</div>
	<div class="setenta left" style="margin:10px 0px">
		<h2>Meus dados</h2>
	</div>

<%@ include file="../commons/footerProfile.jsp" %>