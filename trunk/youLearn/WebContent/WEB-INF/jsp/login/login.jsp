<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>youLearn - Sharing abilities</title>
<script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/puts.js"/>"></script>
<style type="text/css">
	* { margin:0; padding:0; font-size:12px; font-family:Tahoma, Verdana, sans-serif; color:#004A77; }
	body { background:white url('<c:url value="/imgs/fundo2.jpg"/>') no-repeat right top; }
	#boxLogin {
		width:560px;
		height:230px;
		position:absolute;
		top: 50%;
		left: 50%;
		margin: -115px 0 0 -280px;
		background:url('<c:url value="/imgs/fundoLogin.png"/>') no-repeat;
	}
	#camposLogin, #logoEmpresa { padding:0px 10px; margin:10px 0; width:259px; height:210px; }
	#logoEmpresa { float:right; text-align:center; border-left:1px dotted red; }
	#camposLogin { float:left; }
	#camposLogin input.campo {
		padding:5px;
		margin:5px 0;
		width:239px;
		color:#ccc;
	}
	.esqueciSenha, .submit {
		padding:5px;
		margin:5px 0;
	}
	.submit { float:right; }

	h3 { font-size:24px; margin-bottom:10px; }
	p { margin-bottom:10px; }
	
	.messagebox{
		position:absolute;
		z-index:30;
		width:170px;
		border:1px solid #c93;
		background:#ffc;
		padding:3px;
		margin-top:10px;
		color:#708090;
	}
	.messageboxok{
		position:absolute;
		z-index:40;
		width:170px;
		border:1px solid #349534;
		background:#C9FFCA;
		padding:3px;
		font-weight:bold;
		color:#008000;
		margin-top:10px;
	}
	.messageboxerror{
		position:absolute;
		z-index:50;
		width:170px;
		border:1px solid #CC0000;
		background:#F7CBCA;
		padding:3px;
		font-weight:bold;
		color:#CC0000;
		margin-right: 0px;
		margin-top:10px;
	}
</style>
<script>
	$(document).ready(function() {
		verificaMensagem();
		$("#usuario").puts("Usuário");
		$("#senha").puts("Senha");
	});
	
	function verificaMensagem() { 
		var usuario = document.getElementById("usuario").value;
		var senha = document.getElementById("senha").value;
		if (usuario.length > 2 && usuario != "Usuário" && senha != "Senha" && senha != "") {
			$("#msgbox").css("display","none")
               .addClass('messagebox')
                    .text('Clique para entrar.')
                         .fadeIn(1000);
		} else if (usuario.length < 3 && senha == "Senha") {
			$("#msgbox").css("display","none")
               .addClass('messagebox')
                    .text('Entre com usuário/senha...')
                         .fadeIn(1000);
		} else if (usuario.length > 2 && usuario != "Usuário" && usuario != "" && (senha == "Senha" || senha.length < 3)) {
			$("#msgbox").css("display","none")
               .addClass('messagebox')
                    .text('Aguardando senha...')
                         .fadeIn(1000);
		} else if (senha.length > 2 && senha != "Senha" && senha != "" && (usuario = "Usuário" || usuario.length < 3)) {
			$("#msgbox").css("display","none")
               .addClass('messagebox')
                    .text('Aguardando usuário...')
                         .fadeIn(1000);
		}
	}
</script>
</head>
<body>
	<div id="boxLogin">
		<div id="camposLogin">
			<h3>Bem vindo,</h3>
			<p>Digite seus dados para entrar no seu sistema de <b>aprendizado</b>.</p>
			<form action="#" method="post">
				<input type="text" class="campo" id="usuario" onblur="verificaMensagem()" /><br/>
				<input type="password" class="campo" id="senha" onblur="verificaMensagem()" /><br/>
				<div id="msgs">
					<span id="msgbox" class="messagebox">Entre com usuário/senha...</span>
				</div>
				<input type="submit" class="submit" value="Entrar"/>
			</form>
		</div>
		<div id="logoEmpresa">
			<img src="<c:url value="/imgs/logo.png"/>" width="263px" height="210px"/>
		 </div>
	</div>
</body>
</html>