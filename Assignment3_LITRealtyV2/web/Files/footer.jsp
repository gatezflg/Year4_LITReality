<%-- 
    Document   : footer
    Created on : 07-Dec-2017, 13:25:03
    Author     : gatez1511
--%>
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
	<!-- sponsors -->
	<div class="w3l-about sponsors jarallax">
		<div class="some-happy-clients">
			<div class="some-happy-clients-list">
				<h3 class="w3l-titles">Our Sponsors</h3>
				<div class="clients">
					<ul id="flexiselDemo3">
						<li>
							<a href="index.jsp.html">
								<div class="w3l-sponsers">
									<img src="images/s1.png" alt=" ">
								</div>
								<div class="w3l-sponsers-2">
									<h4>Biton</h4>
									<p>Lorem Ipsum sores</p>
								</div>
							</a>
						</li>
						<li>
							<a href="index.jsp.html">
								<div class="w3l-sponsers">
									<img src="images/s2.jpg" alt=" ">
								</div>
								<div class="w3l-sponsers-2">
									<h4>Oenopion</h4>
									<p>Lorem Ipsum sores</p>
								</div>
							</a>
						</li>
						<li>
							<a href="index.jsp.html">
								<div class="w3l-sponsers">
									<img src="images/s3.jpg" alt=" ">
								</div>
								<div class="w3l-sponsers-2">
									<h4>Aristns</h4>
									<p>Lorem Ipsum sores</p>
								</div>
							</a>
						</li>
						<li>
							<a href="index.jsp.html">
								<div class="w3l-sponsers">
									<img src="images/s4.jpg" alt=" ">
								</div>
								<div class="w3l-sponsers-2">
									<h4>Glykon</h4>
									<p>Lorem Ipsum sores</p>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //sponsors -->
	<div class="copyright">
		<div class="container">
			<p>© 2017 Luxury Homes. All Rights Reserved | Design by <a href="https://w3layouts.com/">W3layouts</a></p>
		</div>
	</div>

	<!-- js-scripts -->
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<!-- Necessary-JavaScript-File-For-Bootstrap -->
	<!-- //js -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smoth-scrolling -->
	<!--search jQuery-->
	<script src="js/main.js"></script>
	<!--//search jQuery-->
	<!-- tabs -->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true, // 100% fit in a container
				closed: 'accordion', // Start closed if in accordion view
				activate: function (event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type: 'vertical',
				width: 'auto',
				fit: true
			});
		});
	</script>
	<!-- //tabs -->
	<!-- stats -->
	<script src="js/waypoints.min.js"></script>
	<script src="js/counterup.min.js"></script>
	<script>
		jQuery(document).ready(function ($) {
			$('.counter').counterUp({
				delay: 100,
				time: 1000
			});
		});
	</script>
	<!-- stats -->
	<!-- flexisel -->
	<script type="text/javascript">
		$(window).load(function () {
			$("#flexiselDemo3").flexisel({
				visibleItems: 4,
				animationSpeed: 1000,
				autoPlay: false,
				autoPlaySpeed: 3000,
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: {
					portrait: {
						changePoint: 480,
						visibleItems: 1
					},
					landscape: {
						changePoint: 640,
						visibleItems: 2
					},
					tablet: {
						changePoint: 768,
						visibleItems: 3
					}
				}
			});
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
	<!-- flexisel -->
	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smooth scrolling -->
	<!-- text-effect -->
	<script type="text/javascript" src="js/jquery.transit.js"></script>
	<script type="text/javascript" src="js/jquery.textFx.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.test').textFx({
				type: 'fadeIn',
				iChar: 100,
				iAnim: 1000
			});
		});
	</script>
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
	<!-- //text-effect -->
	<!-- js-scripts -->