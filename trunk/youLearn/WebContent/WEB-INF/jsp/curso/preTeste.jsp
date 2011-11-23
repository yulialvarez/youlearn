<%@ include file="../commons/headerProfile.jsp" %>

	<h1>Pré-teste</h1>
	
	<div class="trinta right" id="featured" style="margin-bottom:10px; text-align:center">
		<h2 style="text-align:left">${curso.nome }</h2>
	</div>
	
	<div class="setenta left">
		<form action="<c:url value="/${curso.id }/pre-teste"/>" method="POST" style="margin-bottom:15px">
			<div id="featured" style="margin-bottom:15px;" class="divQuestao">
				<h2 style="font-size:12px">Pergunta</h2>
				<input type="text" name="questao.pergunta" id="pergunta" style="width:98%" maxlength="95"/>
				<h2 style="margin-top:10px; font-size:12px">Respostas</h2>
				<div class="respostas">
					<p class="campoResposta">
						<input type="text" name="questao.resposta1" />
						<a href="#" class="removerCampo">Remover Campo</a>
					</p>
					<input type="text" name="questao.correta" id="resp5" />
					<b>Resposta correta!</b>
				</div>
				<a href="#" class="adicionarCampo">Adicionar Resposta</a>
			</div>
			<input type="submit" value="Adicionar questão" id="btnAzul" />
		</form>
	</div>
	<script>
		$(function () {
			function reordenaNomes() {
				z = 0;
				$(".respostas p.campoResposta input[type=text]").each(function() {
					z++;
					$(this).attr("name", "questao.resposta"+z);
				});
				
			}
			function removeCampo() {
				$(".removerCampo").unbind("click");
				$(".removerCampo").bind("click", function () {
					i=0;
					$(".respostas p.campoResposta").each(function () {
						i++;
					});
					if (i>1) {
						$(this).parent().remove();
						reordenaNomes();
					}
				});
			}
			removeCampo();
			$(".adicionarCampo").click(function () {
				novoCampo = $(".respostas p.campoResposta:first").clone();
				novoCampo.find("input").val("");
				x = 1;
				$(".respostas p.campoResposta").each(function() {
					x++;
				});
				if (x==5) {
					alert("Número máximo de respostas permitidas são 5.");
					return false;
				} else {
					novoCampo.insertAfter(".respostas p.campoResposta:last");
					reordenaNomes();
					removeCampo();					
				}
			});
		});
	</script>
	<style>
		#btnAzul {
			padding: 5px;
			text-transform: uppercase;
			height: 28px;
			color: #fff;
			font-weight: bold;
			cursor: pointer;
			-moz-border-radius: 3px;
			-webkit-border-radius: 3px;
		    cursor: pointer;
		    background: none repeat scroll 0 0 #3B6B9C;
		   	border: 1px solid #3A6897;
		   	border-radius: 3px 3px 3px 3px;
		}
		#btnAzul:hover { text-decoration:none; }
	</style>
<%@ include file="../commons/footerProfile.jsp" %>