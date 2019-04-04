<%@ page pageEncoding="UTF-8"%>
<%@ include file="enTetePage.html"%>
<%@ page import="commerce.catalogue.service.CatalogueManager"%>
<%@ page import="commerce.catalogue.domaine.modele.Article"%>
<%@ page import="commerce.gestion.Panier"%>
<%@ page import="commerce.gestion.LignePanier"%>
<%@ page import="java.util.Iterator"%>
<%
	if (session.getAttribute("panier") == null) {
		response.sendRedirect("./index.jsp");
	} else {
		Panier lePanier = (Panier) session.getAttribute("panier");
		CatalogueManager catalogueManager = (CatalogueManager) application.getAttribute("catalogueManager");
%>
<div class="all-wrapper">
	<div class="ktba">
		<h1>Votre panier est vide :(</h1>
		<p>Retourner dans la boutique et rechercher l'article qui vous plaît afin de le commander</p>
		
		<div class="wrapperButtonControl">
  							<button class='buton buton-saga'>
    						<span><i class="fa fa-chevron-right"></i> retourner a la boutique </span>
  							</button>
						</div>
						
							<script>
							$('.wrapperButtonControl').on('click', function() {
								window.location.href = 'afficheRecherche.jsp';
								
							});
						</script>
	</div>
	<div class="mysearch">
		<form id="form_id" action="<%=response.encodeURL("./search.jsp")%>"
			method="get">
			<input id="text_id" type="text" name="search"
				placeholder="votre article " size="30" maxlength="10" /> <input
				id="_submit_id" type="submit" value="Rechercher" />
		</form>
	</div>
</div>
<%
	}
%>
<%@ include file="piedDePage.html"%>
