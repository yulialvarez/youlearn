<%@ include file="../commons/headerProfile.jsp" %>
	<script type="text/javascript" src="<c:url value="/js/jquery.dataTables.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/datatable.css"/>" media="screen" />
	<script type="text/javascript" src="<c:url value="/js/jquery.fancybox-1.3.4.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.fancybox-1.3.4.css"/>" media="screen" />
	
	<h1>Administração</h1>
	<div id="content">
		<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
			<h2 style="text-align:left">Menu</h2>
			<ul class="ca-menu-h">
				<li>
					<a href="<c:url value="/adm/usuarios/lista"/>">
						<span class="ca-icon-h">³</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Listar Usuários</h2>
							<h5 class="ca-sub-h">Ações sobre usuários</h3>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<c:url value="/adm/usuarios/novo"/>">
						<span class="ca-icon-h">U</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Cadastrar Usuários</h2>
							<h5 class="ca-sub-h">Gere novas oportunidades</h3>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<c:url value="/cursos"/>">
						<span class="ca-icon-h">D</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Listar Cursos</h2>
							<h5 class="ca-sub-h">Procurando alguma coisa?</h3>
						</div>
					</a>
				</li>
				
				<li>
					<a href="<c:url value="/adm/cursos/novo"/>">
						<span class="ca-icon-h">F</span>
						<div class="ca-content-h">
							<h4 class="ca-main-h">Cadastrar Cursos</h2>
							<h5 class="ca-sub-h">Novos cursos para todos!</h3>
						</div>
					</a>
				</li>
			</ul>
		</div>
		
		<div class="setenta left">
			<p>Nesta lista de usuários, pode-se visualizar, editar e excluir os usuários que possuem cadastro no sistema youLearn!</p>
		</div>
		<div class="setenta left" style="margin:10px 0px">
			<h2>Lista de Usuários</h2>
			<c:if test="${not empty lista}">
				<table id="tabela" class="dataTable">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Login</th>
							<th>E-mail</th>
							<th>Perfil</th>
							<th>Criado em</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lista }" var="users">
							<tr style="padding:10px">
								<td>${users.id }</td>
								<td>${users.nome }</td>
								<td>${users.login }</td>
								<td>${users.email }</td>
								<td>
									<c:if test="${users.perfil == 'aluno'}">
										Aluno
									</c:if>
									<c:if test="${users.perfil == 'administrador'}">
										Administrador
									</c:if>
								</td>
								<td>
									<fmt:formatDate value="${users.dataCriacao}" type="date" pattern="dd/MM/yyyy"/>
								</td>
								<td style="white-space:nowrap;">
									<a href="<c:url value="/adm/usuarios/${users.id }/visualizar"/>" id="inline"><img src="<c:url value="/imgs/visualizar.gif"/>" alt="Visualizar" /></a>
									<a href="<c:url value="/adm/usuarios/${users.id }/editar"/>"><img src="<c:url value="/imgs/editar.gif"/>" alt="Editar" /></a> 
									<a href="#" onclick="if(window.confirm('Tem certeza da remoção do usuário?')) window.location='<c:url value="/adm/usuarios/${users.id }/excluir"/>'; else return false;"><img src="<c:url value="/imgs/excluir.gif"/>" alt="Excluir" /></a>
								</td>
							</tr>
						</c:forEach>
				
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			$('#tabela').dataTable( {
				"sPaginationType": "full_numbers",
				"oLanguage": {
					"sProcessing":   "Processando...",
					"sLengthMenu":   "Mostrar _MENU_ registros",
					"sZeroRecords":  "Não foram encontrados resultados",
					"sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registros",
					"sInfoEmpty":    "Mostrando de 0 até 0 de 0 registros",
					"sInfoFiltered": "(filtrado de _MAX_ registros no total)",
					"sInfoPostFix":  "",
					"sSearch":       "Buscar usuário:",
					"sUrl":          "",
					"oPaginate": {
						"sFirst":    "Primeiro",
						"sPrevious": "Anterior",
						"sNext":     "Seguinte",
						"sLast":     "Último"
					}
				}
			});
			
			$("a#inline").fancybox({
				'hideOnContentClick': false,
				'transitionIn'	:	'fade',
				'transitionOut'	:	'fade',
				'speedIn'		:	600, 
				'speedOut'		:	200, 
				'overlayShow'	:	true
			});
		});
	</script>
<%@ include file="../commons/footerProfile.jsp" %>