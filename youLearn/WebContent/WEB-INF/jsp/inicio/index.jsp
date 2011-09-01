<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>youLearn - Sharing skills</title>
<script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/puts.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>" media="screen" />
</head>
<body onload="fazMenu()">
	<div id="wrapper">
		<div id="topo">
			<img src="<c:url value="/imgs/logo2.png"/>" alt="ChingLing!" style="margin-top:5px" />
			<input type="text" name="pesquisaCurso" id="pesquisaCurso" value="Pesquisar cursos..." style="float:right; margin-top:20px" />
		</div>
		<div style="clear:both"></div>
		<div id="principal-meio">
			<div id="sobre-atual">
				<img src="<c:url value="/imgs/foto.jpg"/>" alt="Usuário" width="280px" height="280px" />
				<h2 class="nome">Vinícius Marcus Michelutti</h2>
				<p><b>De<u>:</u></b> Joinville</p>
				<p><b>Idade<u>:</u></b> 18 anos</p>
				<p><b>Cursos completos<u>:</u></b> 5</p>
			</div>
			
			<ul id="nav">
				<li class="submenu">
					<a href="#">Administração</a>
					<ul>
						<li class="subs">
							<a href="#" >Cursos</a>
							<ul>
								<li><a href="#">Adicionar curso</a></li>
								<li><a href="#">Editar curso</a></li>
							</ul>
						</li>
						<li class="subs">
							<a href="#">Usuários</a>
							<ul>
								<li><a href="#">Adicionar usuário</a></li>
								<li><a href="#">Listar usuários</a></li>
							</ul>
						</li>
						<li><a href="#">Status</a></li>
					</ul>
				</li>
				<li><a href="#">Início</a></li>
				<li class="submenu">
					<a href="#">Minha central</a>
					<ul>
						<li class="subs">
							<a href="#">Meus Cursos</a>
							<ul>
								<li><a href="#">Em andamento</a></li>
								<li><a href="#">Certificações</a></li>
							</ul>
						</li>
						<li><a href="#">Editar informações</a></li>
					</ul>
				</li>
				<li><a href="#">Cursos</a></li>
			</ul>
			
			<script type="text/javascript">
				function fazMenu() {
					var sfEls = document.getElementById("nav").getElementsByTagName("LI");
					for (var i=0; i<sfEls.length; i++) {
						sfEls[i].onmouseover=function() {
							this.className+=" sfhover";
						}
						sfEls[i].onmouseout=function() {
							this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
						}
					}
				}
			</script>
			
			<div style="margin-left:320px;">		
				<h1>Meu Treinamento</h1>
				<p>Aqui você pode realizar todos os seu treinamentos, verificar quais estão em curso ou qualquer outro text, só para marcar muito mais espaço e verificar como que esta página fica. Sera que vvai ficar legal?.<br/><b>Nenhum curso aberto!</b></p>
				<p><a href="#">Teste cor de link</a></p>
			</div>
			<br />
		</div>
	</div>
	<div id="rodape">
		TESTE NOME DE USUÁRIO - YOULEARN - O SEU SISTEMA DE ENSINO!
	</div>
</body>
</html>