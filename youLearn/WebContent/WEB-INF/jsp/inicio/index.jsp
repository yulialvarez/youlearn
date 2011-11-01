<%@ include file="../commons/headerProfile.jsp" %>	
	<h1>Início</h1>
	<div id="content">
		<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
			<h2 style="text-align:left">Perfil</h2>
			<img src="<c:url value="/imgs/foto.jpg"/>" alt="Minha imagem" class="fotoProfile"/>
			<br/><a href="#" style="text-align:center">Editar Informações</a><br/>
			<p style="text-align:left">
				<b>Nome: </b>${usuarioWeb.usuario.nome }<br />
				<b>Perfil: </b>${usuarioWeb.usuario.perfil }<br />
				<b>Email: </b>${usuarioWeb.usuario.email }<br />
				<b>Nascimento: </b><fmt:formatDate value="${usuarioWeb.usuario.aniversario }" type="both"   
	    pattern="dd/MM/yyyy" />
    		</p>
		</div>
		<div class="setenta left">
			<p>Seja bem vindo ao seu sistema de eLearning, <b>youLearn</b>! Aqui você junta seu conhecimento na sua medida.<br/>
			Com este sistema você terá maior vantagens como:
			
			<ul>
				<li>Estudar e aprender diferentes assuntos</li>
				<li>Estude conforme o seu tempo, na sua medida, quando quiser</li>
				<li>Receba certificações</li>
				<li>Faça testes, seja aprovado, se diferencie dos demais</li>
			</ul>
			
			Além de outras vantagens e funcionalidades que você pode usufruir!<br/>
			Para verificar nossas funcionalidades ou sanar as suas dúvidas, acesse o nosso <a href="#">help</a> feito para você!
		</div>
		<div class="setenta left" id="featured" style="margin:10px 0px; text-align:center">
			<h2 style="text-align:left">Painel de controle</h2>
		</div>
	</div>
<%@ include file="../commons/footerProfile.jsp" %>