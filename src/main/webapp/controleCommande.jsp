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
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
</head>

<nav id="navigation" class="col-full" role="navigation">
	<ul id="main-nav" class="nav fl">
		<li id="menu-item-290"
			class="menu-item menu-item-type-custom menu-item-object-custom">
			<a href="<%=response.encodeURL("./afficheRecherche.jsp")%>">Rechercher
				un article</a>
		</li>
		<li id="menu-item-290"
			class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item">
			<a href="<%=response.encodeURL("./controlePanier.jsp")%>">Panier</a>
		</li>
	</ul>
</nav>
<div class="cart-totals">
	<h2>Recapitulatif de votre commande</h2>
</div>
<div id="content" class="col-full">
	<div id="main-sidebar-container">
		<section class="entry">
			<div class="woocommerce">
				<form
					action="<%=response.encodeURL("controlePanier.jsp?commande=recalculerPanier")%>"
					name="panier" method="post">
					<table class="shop_table cart" cellspacing="0">
						<thead>
							<tr>
								<th class="product-thumbnail"></th>
								<th class="product-name">Produit</th>
								<th class="product-price">Prix</th>
								<th class="product-quantity">Quantité</th>
								<th class="product-subtotal">Total</th>
							</tr>
						</thead>
						<%
							Iterator it;
								Article unArticle;
								it = lePanier.getLignesPanier().iterator();
								LignePanier uneLignePanier;
								while (it.hasNext()) {
									uneLignePanier = (LignePanier) it.next();
									unArticle = uneLignePanier.getArticle();
						%>
						<tbody>
							<tr class="cart_item">

								<td class="product-thumbnail"><img
									class="attachment-shop_thumbnail wp-post-image" width="145"
									height="145" alt="hoodie_4_front"
									src="<%if (unArticle.getImage().startsWith("http"))
						out.print(unArticle.getImage());
					else
						out.print("./images/" + unArticle.getImage());%>" /></td>
								<td class="product-name"><%=unArticle.getTitre()%></td>
								<td class="product-price"><span class="amount"><%=uneLignePanier.getPrixUnitaire()%>€</span></td>
								<td class="product-quantity">
									<div class="quantity">
										<p class="text qty text">
											<%=uneLignePanier.getQuantite()%>
										</p>
									</div>
								</td>
								<td class="product-subtotal"><span class="amount"><%=uneLignePanier.getPrixTotal()%>€</span></td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</form>
				<div class="cart-collaterals">
					<div class="cross-sells"></div>
					<div class="cart_totals ">
						<h2>Total de la commande</h2>
						<table cellspacing="0">
							<tbody>
								<tr class="cart-subtotal">
									<th>Sous-total</th>
									<td><span class="amount"><%=lePanier.getTotal()%>€</span></td>
								</tr>
								<tr class="shipping">
									<th>Frais de port</th>
									<td>Gratuit</td>
								</tr>
								<tr class="order-total">
									<th>Total</th>
									<td><strong> <span class="amount"><%=lePanier.getTotal()%>€</span>
									</strong></td>
								</tr>
							</tbody>
						</table>

						
						
						<div id="paypal-button-container"></div>

						<!-- Include the PayPal JavaScript SDK -->
						<script
							src="https://www.paypal.com/sdk/js?client-id=sb&currency=EUR"></script>
						<script>
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%=lePanier.getTotal()%>
							'
																	}
																} ]
															});
												},

												// Finalize the transaction
												onApprove : function(data,
														actions) {
													return actions.order
															.capture()
															.then(
																	function(
																			details) {
																		// Show a success message to the buyer
																		alert('Transaction completed by '
																				+ details.payer.name.given_name
																				+ '!');
																	});
												}

											}).render(
											'#paypal-button-container');
						</script>




					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<%
	}
%>
<%@ include file="piedDePage.html"%>


