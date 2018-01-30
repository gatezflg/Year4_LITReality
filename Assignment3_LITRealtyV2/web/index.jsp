<%@ include file="Files/header.jsp" %> 

<div class="">
    <div id="slider" class="sl-slider-wrapper">
        <div class="sl-slider">
            <c:forEach var="i" begin="1" end="5">
                <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
                    <div class="sl-slide-inner">
                        <div class="bg-img bg-img-${i}"></div>
                        <h2><a href="#">Welcome to LitRealty</a></h2>
                        <blockquote>              
                            <p class="location"><span class="glyphicon glyphicon-map-marker"></span> Excellent Locations</p>
                            <p class="location"><span class="glyphicon glyphicon-briefcase"></span> Dedicated Agents</p>
                            <p class="location"><span class="glyphicon glyphicon-picture"></span> Range of Property Styles</p>
                        </blockquote>
                    </div>
                </div>
            </c:forEach>
        </div><!-- /sl-slider -->
        <nav id="nav-dots" class="nav-dots">
            <span class="nav-dot-current"></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </nav>

    </div><!-- /slider-wrapper -->
</div>



<div class="banner-search">
    <div class="container"> 
        <!-- banner -->
        <div class="searchbar">
            <div class="row">
                <br>
                <br>
            </div>
        </div>
    </div>
</div>
<!-- banner -->
<div class="container">
    <div class="properties-listing spacer">
        <h2>Latest Properties</h2>

        <c:choose>
            <c:when test="${empty properties}">
                <h4><span class="glyphicon glyphicon-home"></span> There are no new properties in the last 7 days</h4>
                <p>Click <a href="PropertiesServlet?all">here</a> to view our latest offerings.</p>
            </c:when>
            <c:otherwise>
                <div id="owl-example" class="owl-carousel">
                    <c:forEach items="${properties}" var="house">
                        <div class="properties">
                            <div class="image-holder"><a href="PropertiesServlet?singleView=${house.id}"><img style="height:150px; width: auto;" src="images/properties/large/${house.photo}/${house.photo}.JPG" class="img-responsive" alt="properties"/></a>
                                <div class="status sold">${house.statusId.status}</div>
                            </div>
                            <h4>${house.city}</h4>
                            <p class="price">Price: <fmt:formatNumber value="${house.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
                            <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bedrooms">${house.bedrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Bathrooms">${house.bathrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">${house.garagesize}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Ber Rating">${house.berRating}</span></div>
                            <a class="btn btn-primary" href="PropertiesServlet?singleView=${house.id}">View Details</a>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>




    </div>
    <div class="spacer">
        <div class="row">
            <div class="col-lg-6 col-sm-9 recent-view">
                <h3>About Us</h3>
                <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<br><a href="about.jsp">Learn More</a></p>

            </div>
            <div class="col-lg-5 col-lg-offset-1 col-sm-3 recommended">
                <h3>Recommended Properties</h3>
                <div id="myCarousel" class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                    </ol>
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="row">
                                <div class="col-lg-4"><img src="images/properties/large/${recommened[0].photo}/${recommened[0].photo}.JPG" class="img-responsive" alt="properties"/></div>
                                <div class="col-lg-8">
                                    <h5><a href="PropertiesServlet?singleView=${recommened[0].id}">${recommened[0].city}</a></h5>
                                    <p class="price"><fmt:formatNumber value="${recommened[0].price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
                                    <a href="PropertiesServlet?singleView=${recommened[0].id}" class="more">More Detail</a> </div>
                            </div>
                        </div>
                        <c:forEach items="${recommened}" var="prop" begin="1">
                            <div class="item">
                                <div class="row">
                                    <div class="col-lg-4"><img src="images/properties/large/${prop.photo}/${prop.photo}.JPG" class="img-responsive" alt="properties"/>
                                    </div>
                                    <div class="col-lg-8">
                                        <h5><a href="PropertiesServlet?singleView=${prop.id}">${prop.city}</a></h5>
                                        <p class="price"><fmt:formatNumber value="${prop.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
                                        <a href="PropertiesServlet?singleView=${prop.id}" class="more">More Detail</a> 
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="Files/footer.jsp" %> 