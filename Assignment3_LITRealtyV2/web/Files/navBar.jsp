<%-- 
    Document   : navBar
    Created on : 07-Dec-2017, 12:33:18
    Author     : gatez1511
--%>
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
