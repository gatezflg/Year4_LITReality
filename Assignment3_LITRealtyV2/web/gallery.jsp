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
                          <%@include file="Files/navBar.jsp" %>  
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
        <%@ include file="Files/footer.jsp" %>
	<!-- //footer -->
</body>

</html>