<%@ page pageEncoding="UTF-8"%>
<%@ include file="enTetePage.html"%>
<%@ page import="commerce.catalogue.service.CatalogueManager"%>
<%@ page import="commerce.catalogue.domaine.modele.Article"%>
<%@ page import="commerce.gestion.Panier"%>
<%@ page import="commerce.gestion.LignePanier"%>
<%@ page import="java.util.Iterator"%>

<div class="all-wrapper">
<div class="ktba">
<h1>Planet Good Deal</h1>
<p>La plus grande médiathèque en ligne au monde, rechercher un article pour connaître sa puissance et découvrir une nouvelle façon d'acheter. </p>
</div>

<div class="mysearch">

	 <form id="form_id" action="<%=response.encodeURL("./search.jsp")%>" method="get"> 
			 <input id="text_id" type="text" name="search" placeholder="votre article " size="30" maxlength="10" />
			 <input id="_submit_id" type="submit" value="Rechercher" /></form>

</div>
		
		


</div>

<%@ include file="piedDePage.html"%>