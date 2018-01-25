<%@ include file="Files/header.jsp" %> 
<!-- banner -->
<div class="inside-banner">
  <div class="container"> 
                  <span class="pull-right"><a href="index.jsp">Home</a> -> Favourites</span>
    <h2>Favourites</h2>

</div>
</div>
<!-- banner -->


<div class="container">
<div class="properties-listing spacer">

<div class="row">
<div class="col-lg-3 col-sm-4 ">
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
</div>

<div class="col-lg-9 col-sm-8">
<div class="sortby clearfix">

</div>
<div class="row">
     <!-- properties -->
     <c:forEach items="${favs}" var="house">
      <div class="col-lg-4 col-sm-6">
      <div class="properties">
          <div class="image-holder"><a href="PropertiesServlet?singleView=${house.id}"><img style="height:150px; width: 100%;"  src="images/properties/large/${house.photo}/${house.photo}.JPG" class="img-responsive" alt="properties"></a>
          <div class="status sold">${house.statusId.status}</div>
        </div>
        <h4>${house.city}</h4>
        <p class="price">Price: <fmt:formatNumber value="${house.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></p>
        <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bedrooms">${house.bedrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Bathrooms">${house.bathrooms}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">${house.garagesize}</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Ber Rating">${house.berRating}</span></div>
        <a class="btn btn-primary" href="FavouritesServlet?delete=${house.id}">Remove Favourite</a>
      </div>
      </div>
      </c:forEach>
      <!-- properties -->
      
      
</div>
</div>
</div>
</div>
</div>

<%@ include file="Files/footer.jsp" %> 