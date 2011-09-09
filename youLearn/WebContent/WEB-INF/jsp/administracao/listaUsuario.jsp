<%@ include file="../commons/headerProfile.jsp" %>
	<script type="text/javascript" src="<c:url value="/js/jquery.dataTables.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/datatable.css"/>" media="screen" />
	<h1>Lista de usuários</h1>
	<p>Nesta lista de usuários, pode-se visualizar, editar e excluir os usuários que possuem cadastro no sistema youLearn!</p>
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
					<tr style="padding:10px" onClick="alert('teste ${users.id }')">
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
						<td style="white-space:nowrap;"><a href="<c:url value="/adm/usuarios/${users.id }/editar"/>"><img src="<c:url value="/imgs/editar.gif"/>" alt="Editar" /></a> <a href="<c:url value="/adm/usuarios/${users.id }/excluir"/>"><img src="<c:url value="/imgs/excluir.gif"/>" alt="Excluir" /></a></td>
					</tr>
				</c:forEach>
		
			</tbody>
		</table>
	</c:if>
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
		});
	</script>
<%@ include file="../commons/footerProfile.jsp" %>