<%@page import="java.awt.print.Printable"%>
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
<link rel='stylesheet' href='http://www.adobewordpress.com/wp-content/themes/sparkling/inc/css/font-awesome.min.css' type='text/css' media='all' />
</head>


<div class="cart-totals">

	</br>
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
						
					

<script>
function $_GET(param) {
	var vars = {};
	window.location.href.replace( location.hash, '' ).replace( 
		/[?&]+([^=&]+)=?([^&]*)?/gi, // regexp
		function( m, key, value ) { // callback
			vars[key] = value !== undefined ? value : '';
		}
	);

	if ( param ) {
		return vars[param] ? vars[param] : null;	
	}
	return vars;
}

var name = $_GET('user1');
var pre = $_GET('pre');
var email = $_GET('email');
var adr = $_GET('adr');
var cp = $_GET('cp');
</script>

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
                            value: '<%=lePanier.getTotal()%>'
							

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

						<div class="wrapperButtonControl">
  							<button class='buton buton-saga'>
    						<span><i class="fa fa-chevron-right"></i> Imprimer le récapitulatif </span>
  							</button>
						</div>

						<script>
							$('.wrapperButtonControl').on('click', function() {
								window.print();
								return false; // why false?
							});
						</script>
						
					</div>
					
					<div class="affinfo" style="margin:20px;padding:10px;">
						<label for="user">Username</label>
						<span id="user"><h3><script>document.write(decodeURI(name));</script></h3></span>
						
						<label for="pre">Prenom</label>
						<span id="pre"><h3><script>document.write(decodeURI(pre));</script></h3></span>
						
						<label for="email">Email</label>
						<span id="email"><h3><script>document.write(decodeURI(email));</script></h3></span>
						
						<label for="adr">Adress</label>
						<span id="adr"><h3><script>document.write(decodeURIComponent(adr));</script></h3></span>
						
						<label for="cp">Code postal</label>
						<span id="cp"><h3><script>document.write(decodeURI(cp));</script></h3></span>
						
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


