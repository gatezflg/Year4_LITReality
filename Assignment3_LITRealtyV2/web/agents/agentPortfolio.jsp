<%@ include file="/agents/adminHeader.jsp" %> 
<div class="row">
    <div class="col-lg-8">
        <div class="panel panel-default">
            <c:choose>
                <c:when test="${list == 'agents'}">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> Portfolio Listings
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table id="mytable" class="table table-bordred table-striped">
                                            <thead>
                                            <th> </th>
                                            <th>City</th>
                                            <th>Price</th>
                                            <th>Vendor</th>
                                            <th>View Vendor</th>
                                            <th>View Detail</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${agentProps}" var="house">
                                                    <tr>
                                                        <td class="image-holder"><a href="PropertiesServlet?singleView=${house.id}"><img style="height:100px; width: 70%;" src="images/properties/large/${house.photo}/${house.photo}.JPG" class="img-responsive" alt="properties"></a></td>
                                                        <td>${house.city}</td>
                                                        <td class="price"><fmt:formatNumber value="${house.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></td>
                                                        <td>${house.vendorId.name}</td>
                                                        <td><p data-placement="top" data-toggle="tooltip" title="Vendor"><a href="VendorsServlet?vendorId=${house.vendorId.vendorId}"><button class="btn btn-primary btn-xs"  ><span class="glyphicon glyphicon-share"></span></button></a></p></td>
                                                        <td><p data-placement="top" data-toggle="tooltip" title="Property"><a href="AgentServlet?propId=${house.id}"><button class="btn btn-default btn-xs" ><span class="glyphicon glyphicon-home"></span></button></a></p></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </c:when>    
                <c:when test="${list == 'all'}">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> All Listings
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table id="mytable" class="table table-bordred table-striped">
                                            <thead>
                                            <th> </th>
                                            <th>City</th>
                                            <th>Price</th>
                                            <th>Vendor</th>
                                            <th>View Vendor</th>
                                            <th>View Detail</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${allProps}" var="house">
                                                    <tr>
                                                        <td class="image-holder"><a href="PropertiesServlet?singleView=${house.id}"><img style="height:100px; width: 70%;" src="images/properties/large/${house.photo}/${house.photo}.JPG" class="img-responsive" alt="properties"></a></td>
                                                        <td>${house.city}</td>
                                                        <td class="price"><fmt:formatNumber value="${house.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></td>
                                                        <td>${house.vendorId.name}</td>
                                                        <td><p data-placement="top" data-toggle="tooltip" title="Vendor"><a href="VendorsServlet?vendorId=${house.vendorId.vendorId}"><button class="btn btn-primary btn-xs"  ><span class="glyphicon glyphicon-share"></span></button></a></p></td>
                                                        <td><p data-placement="top" data-toggle="tooltip" title="Property"><a href="AgentServlet?propId=${house.id}"><button class="btn btn-default btn-xs" ><span class="glyphicon glyphicon-home"></span></button></a></p></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </c:when>
            </c:choose>
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-8 -->
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-bell fa-fw"></i> Notifications Panel
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <i class="fa fa-comment fa-fw"></i> New Comment
                        <span class="pull-right text-muted small"><em>4 minutes ago</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                        <span class="pull-right text-muted small"><em>12 minutes ago</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                        <span class="pull-right text-muted small"><em>27 minutes ago</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-tasks fa-fw"></i> New Task
                        <span class="pull-right text-muted small"><em>43 minutes ago</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                        <span class="pull-right text-muted small"><em>11:32 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                        <span class="pull-right text-muted small"><em>11:13 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-warning fa-fw"></i> Server Not Responding
                        <span class="pull-right text-muted small"><em>10:57 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                        <span class="pull-right text-muted small"><em>9:49 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-money fa-fw"></i> Payment Received
                        <span class="pull-right text-muted small"><em>Yesterday</em>
                        </span>
                    </a>
                </div>
                <!-- /.list-group -->
                <a href="#" class="btn btn-default btn-block">View All Alerts</a>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-4 -->
</div>
<!-- /.row -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<%@ include file="/agents/adminFooter.jsp" %>
