<%-- 
    Document   : index
    Created on : 28-Nov-2017, 12:42:08
    Author     : gatez1511
--%>
<head>
    <title>LIT-Realty | Gallery</title>
    <%@include file="Files/meta.jsp" %>
    <%@ include file="Files/header.jsp" %>
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
							<a href="IndexServlet"><img src="images/site/lit_logo.jpg" alt=""/></a>
						</div>
						<!--navbar-header-->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="IndexServlet">Home</a></li>
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
            		<div class="w3ls_banner_info_grids">
			<div class="container">
				<div class="col-xs-3 w3ls_banner_info_grid">
					<div class="w3l_banner_info_grid">
						<div class="w3_banner_info_grid hi-icon-effect-4 hi-icon-effect-4b">
                                                    <a href="PropertiesServlet"><i class="hi-icon hi-icon-archive fa fa-home"></i></a>
						</div>
						<h4>All Properties</h4>
					</div>
				</div>
				<div class="col-xs-3 w3ls_banner_info_grid">
					<div class="w3l_banner_info_grid">
						<div class="w3_banner_info_grid hi-icon-effect-4 hi-icon-effect-4b">
                                                    <a href="<c:url value = "PropertiesServlet?resSingle"/>"><i class="hi-icon hi-icon-archive fa fa-ellipsis-h"></i></a>
						</div>
						<h4>Residential->Single</h4>
					</div>
				</div>
				<div class="col-xs-3 w3ls_banner_info_grid">
					<div class="w3l_banner_info_grid">
						<div class="w3_banner_info_grid hi-icon-effect-4 hi-icon-effect-4b">
                                                    <a href="<c:url value = "PropertiesServlet?resMulti"/>"><i class="hi-icon hi-icon-archive fa fa-ellipsis-v"> </i></a>
						</div>
						<h4>Residential-Multi</h4>
					</div>
				</div>
				<div class="col-xs-3 w3ls_banner_info_grid">
					<div class="w3l_banner_info_grid">
						<div class="w3_banner_info_grid hi-icon-effect-4 hi-icon-effect-4b">
                                                     <a href="<c:url value = "PropertiesServlet?commercial"/>"><i class="hi-icon hi-icon-archive fa fa-suitcase"> </i>
						</div>
						<h4>Commercial</h4>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			
		</div>
	</div>
	<!-- //banner -->
	<!-- gallery -->
	<section class="agileits-gallery" id="gallery">
		<h3 class="w3l-titles">Our Gallery - ${propertiesType}</h3>
		<div class="gallery_container">
                    <c:forEach items="${propertiesList}" var="property">
                            <div class="galleryItem">
                                  <a href="PropertiesServlet?singleView=${property.id}">
                                <img src="images/properties/large/${property.photo}/${property.photo}.JPG" alt="${property.id}" height="200" width="200"/>
                                <h3>${property.city}</h3>
                                <h3><fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></h3> </a>
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
			<p>© 2017 Luxury Homes. All Rights Reserved | Design by <a href="https://w3layouts.com/">W3layouts</a></p>
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