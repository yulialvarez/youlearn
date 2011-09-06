<%@ include file="../commons/headerProfile.jsp" %>
	<script type="text/javascript" src="<c:url value="/js/jquery.dataTables.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/demo_table.css"/>" media="screen" />
	<c:if test="${not empty lista}">
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
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
			$('#example').dataTable( {
				"sPaginationType": "full_numbers",
				"oLanguage": {
					"sProcessing":   "Processando...",
					"sLengthMenu":   "Mostrar _MENU_ registros",
					"sZeroRecords":  "Não foram encontrados resultados",
					"sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registros",
					"sInfoEmpty":    "Mostrando de 0 até 0 de 0 registros",
					"sInfoFiltered": "(filtrado de _MAX_ registros no total)",
					"sInfoPostFix":  "",
					"sSearch":       "Buscar:",
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