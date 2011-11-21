<%@ include file="../commons/headerProfile.jsp" %>
	<script type="text/javascript" src="<c:url value="/js/jquery.dataTables.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/datatable.css"/>" media="screen" />
	
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
		<p> Veja a nossa lista de cursos que oferecemos! Voc� realizar� os seguintes passos:</p>
		<ul>
			<li>Efetuar� um pr�-teste</li>
			<li>O material ser� liberado e voc� poder� estudar</li>
			<li>Um p�s teste ter� que ser feito, como prova final para aprova��o</li>
		</ul>
		<p>Com este m�todo, voc� pode acompanhar o seu desenvolvimento do conhecimento na respectiva �rea.</p>
		
		<h2>Cursos Dispon�veis</h2>
		<table id="tabela" class="dataTable">
			<thead>
				<tr>
					<th>Curso</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cursos }" var="curso">
					<tr style="padding:30px">
						<td style="text-align:left">${curso.nome }</td>
						<td style="width:130px"><a href="<c:url value="/curso/${curso.id }"/>" class="btnVerde">Ir para o curso</a></td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="clear" style="margin-bottom:5px"></div>
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
					"sSearch":       "Buscar curso:",
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
	
	<style>
		table.dataTable tr.odd {
			background-color:#fff;
		}
		
		table.dataTable tr.even {
			background-color:#fff;
		}
	</style>

<%@ include file="../commons/footerProfile.jsp" %>