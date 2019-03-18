<%@ page import="commerce.catalogue.service.InitAmazon"%>
<%@ page contentType="text/plain charset=UTF-8"%>
<%@ page import="commerce.catalogue.service.CatalogueManager"%>
<%
	CatalogueManager catalogueManager = (CatalogueManager) application.getAttribute("catalogueManager");

	// redirection sur l'accueille si le catalogue ou le texte de recherhce est null
	if(request.getParameter("search") == null){
		response.sendRedirect(response.encodeURL("./index.jsp"));
	}else {
		if(catalogueManager == null){
	
			catalogueManager = new CatalogueManager();
		}
	
		catalogueManager.supprimerToutLesArticles();
		String search_text = request.getParameter("search");
		InitAmazon amazon = new InitAmazon(catalogueManager, search_text);
		amazon.init();
		application.setAttribute("catalogueManager", catalogueManager);

		// redirect vers la page de resultat
		response.sendRedirect(response.encodeURL("./afficheRecherche.jsp"));
	}
%>
