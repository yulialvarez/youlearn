<%@ include file="../commons/headerProfile.jsp" %>	
	<h1>Início</h1>
	<div id="content">
		<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
			<h2 style="text-align:left">Perfil</h2>
			<img src="<c:url value="/usuario/${usuarioWeb.usuario.id }/imagem"/>" alt="Minha imagem" class="fotoProfile"/>
			<br/><a href="<c:url value="/minhas-infos"/>" style="text-align:center">Editar Informações</a><br/>
			<p style="text-align:left">
				<b>Nome: </b>${usuarioWeb.usuario.nome }<br />
				<b>Perfil: </b>
					<c:if test="${usuarioWeb.usuario.perfil == 'aluno'}">
						Aluno
					</c:if>
					<c:if test="${usuarioWeb.usuario.perfil == 'administrador'}">
						Administrador
					</c:if>
				<br />
				<b>Email: </b>${usuarioWeb.usuario.email }<br />
				<b>Nascimento: </b><fmt:formatDate value="${usuarioWeb.usuario.aniversario }" type="both"   
	    pattern="dd/MM/yyyy" />
    		</p>
		</div>
		<div class="setenta left">
			<p>Seja bem vindo ao seu sistema de eLearning, <b>youLearn</b>! Aqui você junta seu conhecimento na sua medida.<br/>
			Com este sistema você terá maior vantagens como:</p>
			
			<ul>
				<li>Estudar e aprender diferentes assuntos</li>
				<li>Estude conforme o seu tempo, na sua medida, quando quiser</li>
				<li>Receba certificações</li>
				<li>Faça testes, seja aprovado, se diferencie dos demais</li>
			</ul>
			
			<p>Além de outras vantagens e funcionalidades que você pode usufruir!</p>
			Para verificar nossas funcionalidades ou sanar as suas dúvidas, acesse o nosso <a href="#">help</a> feito para você!
		</div>
		<div class="setenta left" id="featured" style="margin:10px 0px; text-align:center">
			<h2 style="text-align:left">Painel de controle</h2>
			
			<ul class="ca-menu">
            	<li>
                       <a href="<c:url value="/meus-cursos"/>">
                           <span class="ca-icon" id="courses">p</span>
                           <div class="ca-content">
                               <h4 class="ca-main">Meus Cursos</h4>
                               <h5 class="ca-sub">Cursos em andamento</h5>
                           </div>
                       </a>
                   </li>
                   <li>
                       <a href="<c:url value="/minhas-infos"/>">
                           <span class="ca-icon" id="myinfos">S</span>
                           <div class="ca-content">
                               <h4 class="ca-main">Editar informações</h4>
                               <h5 class="ca-sub">Minhas informações</h5>
                           </div>
                       </a>
                   </li>
                   <li>
                       <a href="#">
                           <span class="ca-icon" id="suggestions">R</span>
                           <div class="ca-content">
                               <h4 class="ca-main">Melhorias</h4>
                               <h5 class="ca-sub">Sugerir/visualizar melhorias</h5>
                           </div>
                       </a>
                   </li>
               </ul>


		</div>
	</div>
<%@ include file="../commons/footerProfile.jsp" %>