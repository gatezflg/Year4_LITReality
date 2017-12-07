<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>

<head>
    <%@include file="Files/meta.jsp" %>
    <%@ include file="Files/header.jsp" %> 
    <title>LIT-Realty | Mail</title>
</head>

<body>
	<!-- banner -->
	<div class="banner-main">
		<div class="banner-2">
			<!--header-->
			<%@include file="Files/navBar.jsp" %>
			<!--//header-->
		</div>
	</div>
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">
			<ul class="w3_short">
				<li><a href="index.jsp.html">Home</a><i>>></i></li>
				<li>Mail Us</li>
			</ul>
		</div>
	</div>
	<!-- //banner -->
	<div class="contact">
		<div class="container">
			<h3 class="w3l-titles">Mail Us</h3>
			<div class="col-md-3 col-sm-3 contact-left">
				<div class="address">
					<h4><i class="fa fa-map-marker" aria-hidden="true"></i>Location</h4>
					<p>345 Setwant natrer,</p>
					<p>Washington. United States.</p>
				</div>
				<div class="phone">
					<h4><i class="fa fa-phone" aria-hidden="true"></i>PHONE</h4>
					<p>+1(401) 1234 567.</p>
					<p>+1(804) 4261 150.</p>
				</div>
				<div class="email">
					<h4><i class="fa fa-envelope-o" aria-hidden="true"></i>E-MAIL</h4>
					<p><a href="mailto:info@example.com">example@gmail.com</a></p>
					<p><a href="mailto:info@example.com">example2@gmail.com</a></p>
				</div>
			</div>
			<div class="col-md-9 col-sm-9 contact-right">
				<form action="#" method="post">
					<input type="text" name="name" placeholder="Your name" required="">
					<input type="email" name="email" placeholder="Your email" required="">
					<input type="text" name="subject" placeholder="Your subject" required="">
					<input type="text" name="phone number" placeholder="Phone number" required="">
					<textarea name="message" placeholder="Your message" required=""></textarea>
					<input type="submit" value="Send">
				</form>
			</div>
		</div>
	</div>
	<div class="map-w3ls">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22702.22744502486!2d11.113366067229226!3d44.662878362361056!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x477fc3eca9065c15%3A0x12ec8a03aadae866!2s40019+Sant&#39;Agata+Bolognese+BO%2C+Italy!5e0!3m2!1sen!2sin!4v1451281303075"
		    allowfullscreen></iframe>
	</div>
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