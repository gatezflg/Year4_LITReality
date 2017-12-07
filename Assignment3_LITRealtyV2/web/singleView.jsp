<%-- 
    Document   : index
    Created on : 28-Nov-2017, 12:42:08
    Author     : gatez1511
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zxx">

<head>
	<title>Luxury Homes a Real Estates Category Bootstrap Responsive Web Template | ${property}</title>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Luxury Homes Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //for-mobile-apps -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/gallery.css" />
	<!-- stylesheet for gallery section -->
	<!-- css files -->
	<link href="//fonts.googleapis.com/css?family=Exo+2:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=cyrillic,latin-ext"
	    rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
	<!-- //css files -->
</head>

<body>
	<!-- banner -->
	<div class="banner-main">
            <div class="banner-2" style="padding-bottom: 300px;">
			<!--header-->
			<div class="header">
				<div class="container">
					<nav class="navbar navbar-default">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
							<a href="index.jsp"><img src="images/site/lit_logo.jpg" alt=""/></a>
						</div>
						<!--navbar-header-->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="index.jsp">Home</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="PropertiesServlet" class="active">Gallery</a></li>
								<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="icons.jsp">Web Icons</a></li>
										<li><a href="codes.jsp">Short Codes</a></li>
									</ul>
								</li>
								<li><a href="contact.jsp">Mail Us</a></li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="cd-main-header">
					<ul class="cd-header-buttons">
						<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
					</ul>
					<!-- cd-header-buttons -->
				</div>
				<div id="cd-search" class="cd-search">
					<form action="#" method="post">
						<input name="Search" type="search" placeholder="Click enter after typing...">
					</form>
				</div>
			</div>
			<!--//header-->
		</div>
	</div>
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			
		</div>
	</div>
	<!-- //banner -->
	<!-- gallery -->
	<section class="agileits-gallery" id="gallery">
		<h3 class="w3l-titles">${property.street}, ${property.city} - <img src="images/BER/${property.berRating}.png" alt=""/></h3>
                
		<div class="container-fluid">
    <div class="content-wrapper">	
		<div class="item-container">	
			<div class="container">	
				<div class="col-md-12">
					<div class="product col-md-3 service-image-left">
                    
						<center>
                                                    <img id="item-display" src="images/properties/large/${property.photo}/${property.photo}.JPG" alt=""/>
						</center>
					</div>
					
					<div class="container service1-items col-sm-2 col-md-2 pull-left">
						<center>
                                                    <c:set var="count" value="0" scope="page" />
                                                    <c:forEach items="${imageList}" var="image">
                                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                                        <a id="item-${count}" class="service1-item">
                                                            <img src="<c:url value="/images/properties/large/${property.photo}/${image}"/>" alt=""></img>
                                                       
							</a>
                                                    </c:forEach>
<!--							<a id="item-1" class="service1-item">
								<img src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png" alt=""></img>
							</a>
							<a id="item-2" class="service1-item">
								<img src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png" alt=""></img>
							</a>
							<a id="item-3" class="service1-item">
								<img src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png" alt=""></img>
							</a>-->
						</center>
					</div>
				</div>
					
				<div class="col-md-7">
					<div class="product-title">Corsair GS600 600 Watt PSU</div>
					<div class="product-desc">The Corsair Gaming Series GS600 is the ideal price/performance choice for mid-spec gaming PC</div>
					<div class="product-rating"><i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i> <i class="fa fa-star-o"></i> </div>
					<hr>
					<div class="product-price"><h3><fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></h3></div>
					<div class="product-stock">In Stock</div>
					<hr>
					<div class="btn-group cart">
						<button type="button" class="btn btn-success">
							Add to cart 
						</button>
					</div>
					<div class="btn-group wishlist">
						<button type="button" class="btn btn-danger">
							Add to wishlist 
						</button>
					</div>
				</div>
			</div> 
		</div>
		<div class="container-fluid">		
			<div class="col-md-12 product-info">
					<ul id="myTab" class="nav nav-tabs nav_tabs">
						
						<li class="active"><a href="#service-one" data-toggle="tab">DESCRIPTION</a></li>
						<li><a href="#service-two" data-toggle="tab">PRODUCT INFO</a></li>
						<li><a href="#service-three" data-toggle="tab">REVIEWS</a></li>
						
					</ul>
				<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="service-one">
						 
							<section class="container product-info">
								The Corsair Gaming Series GS600 power supply is the ideal price-performance solution for building or upgrading a Gaming PC. A single +12V rail provides up to 48A of reliable, continuous power for multi-core gaming PCs with multiple graphics cards. The ultra-quiet, dual ball-bearing fan automatically adjusts its speed according to temperature, so it will never intrude on your music and games. Blue LEDs bathe the transparent fan blades in a cool glow. Not feeling blue? You can turn off the lighting with the press of a button.

								<h3>Corsair Gaming Series GS600 Features:</h3>
								<li>It supports the latest ATX12V v2.3 standard and is backward compatible with ATX12V 2.2 and ATX12V 2.01 systems</li>
								<li>An ultra-quiet 140mm double ball-bearing fan delivers great airflow at an very low noise level by varying fan speed in response to temperature</li>
								<li>80Plus certified to deliver 80% efficiency or higher at normal load conditions (20% to 100% load)</li>
								<li>0.99 Active Power Factor Correction provides clean and reliable power</li>
								<li>Universal AC input from 90~264V — no more hassle of flipping that tiny red switch to select the voltage input!</li>
								<li>Extra long fully-sleeved cables support full tower chassis</li>
								<li>A three year warranty and lifetime access to Corsair’s legendary technical support and customer service</li>
								<li>Over Current/Voltage/Power Protection, Under Voltage Protection and Short Circuit Protection provide complete component safety</li>
								<li>Dimensions: 150mm(W) x 86mm(H) x 160mm(L)</li>
								<li>MTBF: 100,000 hours</li>
								<li>Safety Approvals: UL, CUL, CE, CB, FCC Class B, TÜV, CCC, C-tick</li>
							</section>
										  
						</div>
					<div class="tab-pane fade" id="service-two">
						
						<section class="container">
								
						</section>
						
					</div>
					<div class="tab-pane fade" id="service-three">
												
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>
	</section>
	<!-- //gallery -->

	<!-- newsletter -->
	<div class="w3layouts_newsletter">
		<div class="container">
			<div class="w3layouts_newsletter_left">
				<h3>Subscribe to our newsletter</h3>
			</div>
			<div class="w3layouts_newsletter_right">
				<form action="#" method="post">
					<input type="email" name="Email" placeholder="Email..." required="">
					<input type="submit" value="Subscribe">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //newsletter -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-4 w3_footer_grid-main">
					<h2><a href="index.jsp.html"><span>L</span>uxury <span>H</span>omes</a></h2>
					<p>Aliquam lacus tur <a href="https://w3layouts.com/">http://Luxury Homes.com</a> lobortis quis dolor sed, nec convallis
						velit vestibulum ac dignissim rhoncus neque.</p>
				</div>
				<div class="col-md-4 w3_footer_grid-main-2">
					<div class="midle-w3l">
						<p>Luxury <span>Homes</span></p>
					</div>
				</div>
				<div class="col-md-4 w3_footer_grid-main">
					<div class="w3_footer_grid">
						<div class="col-xs-2 w3l_footer_grid">
							<i class="fa fa-home" aria-hidden="true"></i>
						</div>
						<div class="col-xs-10 address-right">
							<h4>Address</h4>
							<p>234 main street, NewYork City,F34 834.</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="w3_footer_grid">
						<div class="col-xs-2 w3l_footer_grid">
							<i class="fa fa-phone" aria-hidden="true"></i>
						</div>
						<div class="col-xs-10 address-right">
							<h4>Call Us</h4>
							<p>+(123) 456 789 344</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="w3_footer_grid">
						<div class="col-xs-2 w3l_footer_grid">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</div>
						<div class="col-xs-10 address-right">
							<h4>Mail Us</h4>
							<p><a href="mailto:info@example.com">info@example.com</a>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="copyright">
		<div class="container">
			<p>Â© 2017 Luxury Homes. All Rights Reserved | Design by <a href="https://w3layouts.com/">W3layouts</a></p>
		</div>
	</div>
	<!-- //footer -->

	<!-- js-scripts -->
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->
	<!-- //js -->
	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smooth scrolling -->
	<!--search jQuery-->
	<script src="js/main.js"></script>
	<!--//search jQuery-->
	<!-- js files for gallery section -->
	<script src="js/jquery.mb.CSSAnimate.min.js"></script>
	<script src="js/jquery.mb.thumbGrid.js"></script>
	<script>
		jQuery(function () {
			jQuery("[data-thumbgrid]").thumbGrid();

			//    customize
			jQuery("#effect").on("change", function () {
				var x = $(this).val();
				jQuery("#thumbGrid").data("effect", x);
			});

			jQuery("#delay").on("change", function () {
				var x = parseFloat($(this).val());
				jQuery("#thumbGrid").data("delay", x);
			});

			jQuery("#timing").on("change", function () {
				var x = parseFloat($(this).val());
				jQuery("#thumbGrid").data("timing", x);
			});
		});
	</script>
	<!-- //js files for gallery section -->

	<!-- js-scripts -->

</body>

</html>