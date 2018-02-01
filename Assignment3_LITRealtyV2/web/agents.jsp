<%-- 
    Document   : agents
    Created on : 01-Feb-2018, 13:25:15
    Author     : gatez1511
--%>
<%@ include file="Files/header.jsp" %> 

<!-- banner -->
<div class="inside-banner">
    <div class="container"> 
        <span class="pull-right"><a href="index.jsp">Home</a> -> Agents</span>
        <h2>Agents</h2>

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

                <!-- properties -->
                <c:forEach items="${allAgents}" var="agent">
                    <div class="row">
                        <div class="col-lg-2 col-sm-2 "><a href="#"><img src="images/agents/${agent.image}.jpg" class="img-responsive"  alt="agent name"></a></div>
                        <div class="col-lg-7 col-sm-7 "><h4>${agent.name}</h4><p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p></div>
                        <div class="col-lg-3 col-sm-3 "><span class="glyphicon glyphicon-envelope"></span> <a href="mailto:${agent.email}">${agent.email}</a><br>
                            <span class="glyphicon glyphicon-earphone" data-toggle="tooltip" data-placement="right" title="Phone"></span> ${agent.phone}
                            <span class="glyphicon glyphicon-file" data-toggle="tooltip" data-placement="right" title="Fax"></span> ${agent.fax}
                        </div>
                    </div>
                </c:forEach>
                <!-- properties -->


            </div>
        </div>
    </div>
</div>

<%@ include file="Files/footer.jsp" %> 
