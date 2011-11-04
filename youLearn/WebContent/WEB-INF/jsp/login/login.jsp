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

<style type="text/css">
body {
	margin: 0 auto;
	width: 1000px;
	background: #eaeaea;
	color: #282828;
	font: 12px/20px Arial, Helvetica Neue, Helvetica, sans-serif;
}
label {	cursor: pointer; }
img { border:none; }

.clear {
	display: block;
	clear: both;
	width: 0px;
	height: 0px;
	overflow: hidden;
	font-size: 1px;
}

input[type=text], input[type=password] {
	padding: 7px;
	width: 732px;
	background: #eaeaea;
	border: 1px solid #8c8c8c;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
}
input[type=text]:hover, input[type=text]:focus, input[type=password]:hover, input[type=password]:focus {
	background: #efefef;
}
input[type=button], input[type=submit], input[type=reset] {
	margin: 8px 2px 0 0;
	padding: 0 15px;
	text-transform: uppercase;
	height: 28px;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
}
.messageboxinfo{
	position:absolute;
	z-index:40;
	width:229px;
	border:1px solid #1E5395;
	background:url("<c:url value="/imgs/info.png"/>") no-repeat 4px 50%;
	background-color:#B0C4DE;
	padding:3px 3px 3px 22px;
	color:#1E5395;
	margin-top:10px;
}
.messagebox{
	position:absolute;
	z-index:30;
	width:229px;
	border:1px solid #c93;
	background:url("<c:url value="/imgs/alerta.png"/>") no-repeat 4px 50%;
	background-color:#ffc;
	padding:3px 3px 3px 22px;
	margin-top:10px;
	color:#708090;
}
.messageboxok{
	position:absolute;
	z-index:40;
	width:229px;
	border:1px solid #349534;
	background:url("<c:url value="/imgs/certo.gif"/>") no-repeat 4px 50%;
	background-color:#C9FFCA;
	padding:3px 3px 3px 22px;
	color:#008000;
	margin-top:10px;
}
.messageboxerror{
	position:absolute;
	z-index:50;
	width:229px;
	border:1px solid #CC0000;
	background:url("<c:url value="/imgs/erro.png"/>") no-repeat 4px 50%;
	background-color:#F7CBCA;
	padding:3px 3px 3px 22px;
	color:#CC0000;
	margin-right: 0px;
	margin-top:10px;
}
#logo { text-align:center; }
#footer {
	margin: 25px 0;
	padding-top: 20px;
	text-align: right;
	border-top: 1px solid #ddd;
}
	
#login {
	margin: 20px auto;
	padding: 25px;
	width: 255px;
	background: #fff;
	border: 7px solid #ccc;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}
#login h2 {
	padding-bottom: 5px;
	margin-bottom: 20px;
	font-size: 18px;
	font-weight: normal;
	border-bottom: 1px solid #ddd;
}
#login label {
	color: #7a7a7a;
	font-weight: bold;
}
#login input[type=text], #login input[type=password] {
	margin: 5px 0 10px;
	width: 241px;
	background: #f8f8f8;
	border: 1px solid #aaa;
}
#login p {
	margin: 10px 0 5px;
}
#login input[type=submit] {
	float: right;
    color: #fff;
    cursor: pointer;
    font-weight: bold;
    font: 12px/20px Arial,Helvetica Neue,Helvetica,sans-serif;
    height: 28px;
    margin: 25px 2px 0 0;
    padding: 0 15px;
    text-transform: uppercase;
    background: none repeat scroll 0 0 #3B6B9C;
   	border: 1px solid #3A6897;
   	border-radius: 3px 3px 3px 3px;
}
</style>
</head>
<body>
	<div id="header">
		<h1 id="logo"><a href="#" title="youLearn! Sharing skills"><img src="<c:url value="/imgs/logo.png"/>" title="youLearn! Sharing skills" alt="youLearn! Sharing skills" /></a></h1>
	</div>
	<form action="#" method="post" id="loginForm">
	<div id="login">
		<h2>Login</h2>
		<label for="usuario">Usuário:</label>
		<input type="text" id="usuario" name="usuario.login" />
		<label for="senha">Senha:</label>
		<input type="password" id="senha" name="usuario.senha" />
		<div id="msgs">
			<span id="msgbox" class="messageboxinfo">Entre com usuário/senha...</span>
		</div>
		<br />
		<input type="submit" value="Login" />
		<div class="clear"></div>
	</div>
	</form>
	<div id="footer" class="login-f">&copy; <strong>youLearn</strong> 2011. Vinícius Marcus Michelutti - ECP 341</div>
	
	<script type="text/javascript">
		jQuery(function($){
		     $("#loginForm").submit(function() {
		          $("#msgbox").removeClass()
		               .addClass('messageboxinfo')
		                    .text('Validando dados...')
		                         .fadeIn(2000);
		 
		          $.post("/youLearn/login",
		                    {'usuario.login': $('#usuario').val(), 'usuario.senha': $('#senha').val()},
		                         function(data) {
		               if(data.string=='true') {
		               $("#msgbox").fadeTo(200,0.1,function() {
		                 $(this).html('Redirecionando...')
		                    .addClass('messageboxok')
		                         .fadeTo(1900,1,
		                  function() {
		                     $(this).removeClass().html('');
		                     document.location='/youLearn/inicio';
		                 });
		               });
		               } else {
		               $("#msgbox").fadeTo(200,0.1,function() {
		                 $(this).html('Dados inválidos')
		                    .addClass('messageboxerror')
		                         .fadeTo(1900,1);
		               });
		               }
		        });
		        return false;
		     });
		});
	</script>
	
</body>
</html>