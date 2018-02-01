<%-- 
    Document   : agentsPage
    Created on : 01-Feb-2018, 10:29:22
    Author     : gatez1511
--%>

<%@ include file="/agents/adminHeader.jsp" %> 
<div class="row">
    <div class="col-lg-8">
        <c:choose>
            <c:when test="${not empty selectedAgent}">
                <c:set var="thisAgent" value="${selectedAgent}"/>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> Selected Agent Properties
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table id="mytable" class="table table-bordred table-striped">
                                            <thead>
                                            <th>Agent Name </th>
                                            <th>Contact Number</th>
                                            <th>Fax</th>
                                            <th>Email</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>${thisAgent.name}</td>
                                                    <td>${thisAgent.phone}</td>
                                                    <td>${thisAgent.fax}</td>
                                                    <td>${thisAgent.email}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <c:if test="${thisAgent.agentId == agent.agentId}">
                                            <div class="col-md-4" style="padding-top: 10px">
                                                <a href="AdminServlet?edit=${thisAgent.agentId}"><button class="btn btn-warning btn-lg">Edit Details</button></a>
                                            </div>
                                        </c:if>  

                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table id="mytable" class="table table-bordred table-striped">
                                            <thead>
                                            <th> </th>
                                            <th>City</th>
                                            <th>Price</th>
                                            <th>View Detail</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${propsThisAgent}" var="house">
                                                    <tr>
                                                        <td class="image-holder"><a href="PropertiesServlet?singleView=${house.id}"><img style="height:100px; width: 70%;" src="images/properties/large/${house.photo}/${house.photo}.JPG" class="img-responsive" alt="properties"></a></td>
                                                        <td>${house.city}</td>
                                                        <td class="price"><fmt:formatNumber value="${house.price}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/></td>
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
                </div>
            </c:when>
            <c:when test="${not empty addingAgent}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-shopping-cart"></i> Adding New Agent
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area">
                            <div class="span3 well">
                                <form accept-charset="UTF-8" action="AdminServlet" method="post">
                                    <input class="span3" name="name" placeholder="Full Name" type="text"> 
                                    <input class="span3" name="contactNumber" placeholder="Contact Number" type="text">
                                    <input class="span3" name="fax" placeholder="Fax" type="text"> 
                                    <input class="span3" name="email" placeholder="Email" type="email"> 
                                    <input class="span3" name="username" placeholder="Username" type="text"> 
                                    <input class="span3" name="password" placeholder="Password" type="password"> 
                                    <button class="btn btn-warning" type="submit">Add Agent</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </c:when>
            <c:when test="${not empty editA}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-shopping-cart"></i> Adding New Agent
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area">
                            <div class="span3 well">
                                <form accept-charset="UTF-8" action="AdminServlet?DoEdit=${editA.agentId}" method="post">
                                    <input class="span3" name="name" placeholder="${editA.name}" type="text" readonly> 
                                    <input class="span3" name="contactNumber" placeholder="${editA.phone}" type="text" required>
                                    <input class="span3" name="fax" placeholder="${editA.fax}" type="text" required> 
                                    <input class="span3" name="email" placeholder="${editA.email}" type="email" required> 
                                    <input class="span3" name="username" placeholder="Username" type="text" readonly> 
                                    <button class="btn btn-warning" type="submit">Edit Agent</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </c:when>
            <c:when test="${not empty allAgents}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> List of Agents
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table id="mytable" class="table table-bordred table-striped">
                                            <thead>
                                            <th>Agent Name </th>
                                            <th>Contact Number</th>
                                            <th>Fax</th>
                                            <th>Email</th>
                                            <td>View Details</td>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${allAgents}" var="thisAgent">
                                                    <tr>
                                                        <td>${thisAgent.name}</td>
                                                        <td>${thisAgent.phone}</td>
                                                        <td>${thisAgent.fax}</td>
                                                        <td>${thisAgent.email}</td>
                                                        <td><p data-placement="top" data-toggle="tooltip" title="Vendor"><a href="AdminServlet?agentId=${thisAgent.agentId}"><button class="btn btn-primary btn-xs"  ><span class="glyphicon glyphicon-share"></span></button></a></p></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-md-4" style="padding-top: 10px">
                                        <a href="AdminServlet?add=1"><button class="btn btn-warning btn-lg">Add Agent</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </c:when>
        </c:choose>
        <!-- /.panel -->
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

<%@ include file="/agents/adminFooter.jsp" %>