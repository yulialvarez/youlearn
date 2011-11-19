<%@ include file="../commons/headerProfile.jsp" %>

	<h1>Cursos</h1>
	
	<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
		<h2 style="text-align:left">Menu</h2>
		<ul class="ca-menu-h">
			<li>
				<a href="<c:url value="/cursos"/>">
					<span class="ca-icon-h">S</span>
					<div class="ca-content-h">
						<h4 class="ca-main-h">Cursos</h2>
						<h5 class="ca-sub-h">youLearn - Sharing skills</h3>
					</div>
				</a>
			</li>
			<li>
				<a href="<c:url value="/meus-cursos"/>">
					<span class="ca-icon-h">p</span>
					<div class="ca-content-h">
						<h4 class="ca-main-h">Meus Cursos</h2>
						<h5 class="ca-sub-h">O seu aprendizado!</h3>
					</div>
				</a>
			</li>
		</ul>
	</div>
	
	<div class="setenta left">
		<p> Veja a nossa lista de cursos que oferecemos! Você realizará os seguintes passos:</p>
		<ul>
			<li>Efetuará um pré-teste</li>
			<li>O material será liberado e você poderá estudar</li>
			<li>Um pós teste terá que ser feito, como prova final para aprovação</li>
		</ul>
		<p>Com este método, você pode acompanhar o seu desenvolvimento do conhecimento na respectiva área.</p>
		
		<h2>Cursos Disponíveis</h2>
	</div>

<%@ include file="../commons/footerProfile.jsp" %>