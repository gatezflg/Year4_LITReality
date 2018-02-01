<%-- 
    Document   : singleView
    Created on : 30-Jan-2018, 21:19:49
    Author     : gatez1511
--%>
<%@ include file="/agents/adminHeader.jsp" %> 
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            <i class="fa fa-map-marker fa-fw"></i> ${house.street}, ${house.city}
        </div>
        <!-- /.panel-heading -->
        <div class="col-lg-9 col-sm-8 " style="padding-bottom: 50px;">
            <h2>${house.bedrooms} Bedroom ${house.styleId.PStyle} Property</h2>
            <div class="row">
                <div class="col-lg-8">
                    <div class="house-images">
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
                                    <img src="images/properties/large/${house.photo}/${house.photo}.JPG" class="properties" alt="properties" />
                                </div>
                                <!-- #Item 1 -->
                                <c:forEach items="${imageList}" var="image">
                                    <div class="item">
                                        <img src="<c:url value="/images/properties/large/${house.photo}/${image}"/>" alt="properties" />
                                    </div>
                                </c:forEach>
                            </div>
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                        <!-- #Slider Ends -->
                    </div>
                    <div class="spacer"><h4><span class="glyphicon glyphicon-th-list"></span> Properties Detail</h4>
                                ${house.description}
                    </div>
                </div>
                <style>
                    .input-w label {
                        float: none; /* if you had floats before? otherwise inline-block will behave differently */
                        display: inline-block;
                        vertical-align: middle;    
                    }
                </style>
                <div class="col-lg-4">
                    <div class="col-lg-12  col-sm-6">
                        <div class="property-info">
                            <div class="input-w">
                                <label class="your-input">Listing Number: </label>
                                <span class="pull-right">${house.listingNum}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Price: </label>
                                <span class="pull-right"><fmt:formatNumber value="${house.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Status </label>
                                <span class="pull-right">${house.statusId.status}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Is Active? </label>
                                <c:if test="${house.active == 1}">
                                    <span class="pull-right">Yes</span>
                                </c:if>
                                <c:if test="${house.active == 0}">
                                    <span class="pull-right">No</span>
                                </c:if>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Date Added: </label>
                                <span class="pull-right"><fmt:formatDate pattern="dd-MM-yyyy" value="${house.dateAdded}" /></span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Property Type:  </label>
                                <span class="pull-right">${house.typeId.PType} </span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Property Style: </label>
                                <span class="pull-right">${house.styleId.PStyle}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Lot Size: </label>
                                <span class="pull-right">${house.lotsize}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Sq Foot: </label>
                                <span class="pull-right">${house.squarefeet}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">No. of Bedrooms:</label>
                                <span class="pull-right">${house.bedrooms}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">No. of Bathrooms: </label>
                                <span class="pull-right">${house.bathrooms}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Agent: </label>
                                <span class="pull-right">${house.agentId.name}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Vendor: </label>
                                <span class="pull-right"><a href="VendorsServlet?vendorId=${house.vendorId.vendorId}" >${house.vendorId.name}</a></span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Garage Type:</label>
                                <span class="pull-right">${house.garageId.GType}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">Garage Size:</label>
                                <span class="pull-right">${house.garagesize}</span>
                            </div>
                            <div class="input-w">
                                <label class="your-input">BER Rating:</label>
                                <span class="pull-right"><img src="images/BER/${house.berRating}.png"/></span>
                            </div>
                            <style>
                                .btn-label {position: relative;left: -12px;display: inline-block;padding: 6px 12px;background: rgba(0,0,0,0.15);border-radius: 3px 0 0 3px;}
                                .btn-labeled {padding-top: 0;padding-bottom: 0;}
                                .btn { margin-bottom:10px; }

                            </style>
                            <c:choose>
                                <c:when test="${house.agentId.agentId == agent.agentId}">
                                    <a href="EditPropertyServlet">
                                        <button type="button" class="btn btn-labeled btn-success">
                                            <span class="btn-label"><i class="glyphicon glyphicon-inbox"></i></span> Add New Property
                                        </button>
                                    </a>
                                    <br/>  
                                    <a href="EditPropertyServlet?edit=${house.id}">
                                        <button type="button" class="btn btn-labeled btn-info">
                                            <span class="btn-label"><i class="glyphicon glyphicon-refresh"></i></span> Update Property
                                        </button>
                                    </a>

                                </c:when>
                                <c:otherwise>
                                    <div class="col-md-12">
                                        <a href="EditPropertyServlet">
                                            <button type="button" class="btn btn-labeled btn-success">
                                                <span class="btn-label"><i class="glyphicon glyphicon-inbox"></i></span> Add New Property
                                            </button>
                                        </a>
                                    </div>  
                                </c:otherwise>

                            </c:choose>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.panel -->
</div>

<%@ include file="/agents/adminFooter.jsp" %>
