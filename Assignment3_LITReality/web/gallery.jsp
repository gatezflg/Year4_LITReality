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
	<title>Luxury Homes a Real Estates Category Bootstrap Responsive Web Template | Gallery</title>
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
		<div class="banner-2">
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
								<li><a href="/propertiesServlet" class="active">Gallery</a></li>
								<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="icons.html">Web Icons</a></li>
										<li><a href="codes.html">Short Codes</a></li>
									</ul>
								</li>
								<li><a href="contact.html">Mail Us</a></li>
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
			<ul class="w3_short">
				<li><a href="index.jsp.html">Home</a><i>>></i></li>
				<li>Gallery</li>
			</ul>
		</div>
	</div>
	<!-- //banner -->
	<!-- gallery -->
	<section class="agileits-gallery" id="gallery">
		<h3 class="w3l-titles">Our Gallery</h3>
		<div class="gallery_container">
                    <c:forEach items="${propertiesList}" var="property">
                            <div class="galleryItem">
                                    <img src="images/properties/large/${property.photo}/${property.photo}.JPG" alt="${property.id}"/>
                                    
                                    <h3>${property.city}</h3>
                                    <h3><fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></h3> 
                            </div>
                      </c:forEach>    
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