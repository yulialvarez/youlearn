<%@ include file="../commons/headerProfile.jsp" %>
	<script type="text/javascript" src="<c:url value="/js/jquery.dataTables.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/datatable.css"/>" media="screen" />
	<h1>Lista de usu�rios</h1>
	<p>Nesta lista de usu�rios, pode-se visualizar, editar e excluir os usu�rios que possuem cadastro no sistema youLearn!</p>
	<c:if test="${not empty lista}">
		<table id="tabela" class="dataTable">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Login</th>
					<th>E-mail</th>
					<th>Criado em</th>
					<th>Perfil</th>
				</tr>
			</thead>
			<tbody>
		
				<c:forEach items="${lista }" var="users">
					<tr style="padding:10px">
						<td>${users.id }</td>
						<td>${users.nome }</td>
						<td>${users.login }</td>
						<td>${users.email }</td>
						<td>${users.dataCriacao }</td>
						<td>${users.perfil }</td>
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
					"sZeroRecords":  "N�o foram encontrados resultados",
					"sInfo":         "Mostrando de _START_ at� _END_ de _TOTAL_ registros",
					"sInfoEmpty":    "Mostrando de 0 at� 0 de 0 registros",
					"sInfoFiltered": "(filtrado de _MAX_ registros no total)",
					"sInfoPostFix":  "",
					"sSearch":       "Buscar:",
					"sUrl":          "",
					"oPaginate": {
						"sFirst":    "Primeiro",
						"sPrevious": "Anterior",
						"sNext":     "Seguinte",
						"sLast":     "�ltimo"
					}
				}
			});
		});
	</script>
<%@ include file="../commons/footerProfile.jsp" %>