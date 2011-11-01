<%@ include file="../commons/headerProfile.jsp" %>	
	<h1>In�cio</h1>
	<div id="content">
		<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
			<h2 style="text-align:left">Perfil</h2>
			<img src="<c:url value="/imgs/foto.jpg"/>" alt="Minha imagem" class="fotoProfile"/>
			<br/><a href="#" style="text-align:center">Editar Informa��es</a><br/>
			<p style="text-align:left">
				<b>Nome: </b>${usuarioWeb.usuario.nome }<br />
				<b>Perfil: </b>${usuarioWeb.usuario.perfil }<br />
				<b>Email: </b>${usuarioWeb.usuario.email }<br />
				<b>Nascimento: </b><fmt:formatDate value="${usuarioWeb.usuario.aniversario }" type="both"   
	    pattern="dd/MM/yyyy" />
    		</p>
		</div>
		<div class="setenta left">
			<p>Seja bem vindo ao seu sistema de eLearning, <b>youLearn</b>! Aqui voc� junta seu conhecimento na sua medida.<br/>
			Com este sistema voc� ter� maior vantagens como:
			
			<ul>
				<li>Estudar e aprender diferentes assuntos</li>
				<li>Estude conforme o seu tempo, na sua medida, quando quiser</li>
				<li>Receba certifica��es</li>
				<li>Fa�a testes, seja aprovado, se diferencie dos demais</li>
			</ul>
			
			Al�m de outras vantagens e funcionalidades que voc� pode usufruir!<br/>
			Para verificar nossas funcionalidades ou sanar as suas d�vidas, acesse o nosso <a href="#">help</a> feito para voc�!
		</div>
		<div class="setenta left" id="featured" style="margin:10px 0px; text-align:center">
			<h2 style="text-align:left">Painel de controle</h2>
		</div>
	</div>
<%@ include file="../commons/footerProfile.jsp" %>