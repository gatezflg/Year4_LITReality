    <%@ include file="Files/header.jsp" %> 
<!-- banner -->
<div class="inside-banner">
  <div class="container"> 
    <span class="pull-right"><a href="IndexServlet">Home</a> / Buy</span>
    <h2>Buy</h2>
</div>
</div>
<!-- banner -->


<div class="container">
<div class="properties-listing spacer">

<div class="row">
<div class="col-lg-3 col-sm-4 hidden-xs">

<div class="hot-properties hidden-xs">
<h4>Hot Properties</h4>
    <c:forEach items="${recommened}" var="prop">
        <div class="row">
            <div class="col-lg-4 col-sm-5"><img src="images/properties/large/${prop.photo}/${prop.photo}.JPG" class="img-responsive img-circle" alt="properties"></div>
            <div class="col-lg-8 col-sm-7">
              <h5><a href="PropertiesServlet?singleView=${prop.id}">${prop.city}</a></h5>
              <p class="price"><fmt:formatNumber value="${prop.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
            </div>
        </div>
    </c:forEach>
</div>
<div class="advertisement">
  <h4>Advertisements</h4>
  <img src="images/advertisements.jpg" class="img-responsive" alt="advertisement">

</div>

</div>

<div class="col-lg-9 col-sm-8 ">

<h2>${property.bedrooms} Bedroom ${property.styleId.PStyle} Property</h2>
<div class="row">
  <div class="col-lg-8">
  <div class="property-images">
    <!-- Slider Starts -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators hidden-xs">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
      </ol>
      <div class="carousel-inner">
        <!-- Item 1 -->
        <div class="item active">
          <img src="images/properties/large/${property.photo}/${property.photo}.JPG" class="properties" alt="properties" />
        </div>
        <!-- #Item 1 -->
        <c:forEach items="${imageList}" var="image">
            <div class="item">
             <img src="<c:url value="/images/properties/large/${property.photo}/${image}"/>" alt="properties" />
             </div>
        </c:forEach>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
<!-- #Slider Ends -->

  </div>
  



  <div class="spacer"><h4><span class="glyphicon glyphicon-th-list"></span> Properties Detail</h4>
  ${property.description}
  
  </div>
  <div><h4><span class="glyphicon glyphicon-map-marker"></span> Location</h4>
    <div id="map"></div>
    <script>
        var geocoder;
          var map;
          function initMap() {
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var mapOptions = {
              zoom: 15,
              center: latlng
            }
            map = new google.maps.Map(document.getElementById('map'), mapOptions);

            geocodeAddress(geocoder, map);
          }


          function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('address').innerHTML;
            geocoder.geocode( { 'address': address}, function(results, status) {
              if (status == 'OK') {
                resultsMap.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: resultsMap,
                    position: results[0].geometry.location
                });
              } else {
                alert('Geocode was not successful for the following reason: ' + status);
              }
            });
          }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfRUgP7zWW7vO74O6qPILCQIJSdz0xGoY&callback=initMap">
    </script>
  </div>

  </div>
  <div class="col-lg-4">
  <div class="col-lg-12  col-sm-6">
<div class="property-info">
<p class="price"> <fmt:formatNumber value="${property.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
  <p class="area"><span class="glyphicon glyphicon-map-marker"></span><span id="address"> ${property.street}, ${property.city}</span></p>

    <h6><span class="glyphicon glyphicon-home"></span> Availability</h6>
    <div class="listing-detail">
    <span data-toggle="tooltip" data-placement="bottom" data-original-title="Bedrooms">${property.bedrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Bathrooms">${property.bathrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">${property.garagesize}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Ber Rating">${property.berRating}</span></div>

  <c:choose>
        <c:when test="${empty cookieSuccess}">
            <a href="FavouritesServlet?propID=${property.id}"><button class="btn btn-primary">Favourite <span class="glyphicon glyphicon-heart-empty"></span></button></a>
        </c:when>
            <c:otherwise>
            <button class="btn btn-primary">Favourite <span class="glyphicon glyphicon-heart"></span></button>
        </c:otherwise>
    </c:choose>
            
  <div class="profile">
  <span class="glyphicon glyphicon-user"></span> Agent Details
  <p>${property.agentId.name}<br>${property.agentId.phone}<br>${property.agentId.email}</p>
  </div>
</div>
</div>
<div class="col-lg-12 col-sm-6 ">
<div class="enquiry">
  <h6><span class="glyphicon glyphicon-envelope"></span> Post Enquiry</h6>
  <form role="form">
                <input type="text" class="form-control" placeholder="Full Name"/>
                <input type="text" class="form-control" placeholder="you@yourdomain.com"/>
                <input type="text" class="form-control" placeholder="your number"/>
                <textarea rows="6" class="form-control" placeholder="Whats on your mind?"></textarea>
      <button type="submit" class="btn btn-primary" name="Submit">Send Message</button>
      </form>
 </div>         
</div>
  </div>
</div>
</div>
</div>
</div>
</div>

<%@ include file="Files/footer.jsp" %> 