<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>youLearn - Sharing skills</title>
<script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/formToWizard.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/puts.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>" media="screen" />

<script>
$(function() {
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		if(scrollTop != 0)
			$('#nav').stop().animate({'opacity':'0.6'},600);
		else
			$('#nav').stop().animate({'opacity':'1'},600);
	});

	$('#nav').hover(
		function (e) {
			var scrollTop = $(window).scrollTop();
			if(scrollTop != 0){
				$('#nav').stop().animate({'opacity':'1'},600);
			}
		},
		function (e) {
			var scrollTop = $(window).scrollTop();
			if(scrollTop != 0){
				$('#nav').stop().animate({'opacity':'0.6'},600);
			}
		}
	);
});
</script>

</head>

<body>

	<div id="nav">
		<ul style="float:left;">
			<li><a class="top" href="#top"><span></span></a></li>
			<li><a class="bottom" href="#bottom"><span></span></a></li>
			<li><a href="<c:url value="/inicio"/>">Início</a></li>
			<li><a>Cursos</a></li>
			<li><a>Meu Perfil</a></li>
			<li><a>Administração</a></li>
		</ul>
		<ul style="float:right; margin-right:25px;">
			<li><a class="linkBlue">Ajuda</a></li>
			<li><a class="linkRed" href="<c:url value="/doLogout"/>">Sair</a></li>
		</ul>
	</div>
	<div id="middle">
