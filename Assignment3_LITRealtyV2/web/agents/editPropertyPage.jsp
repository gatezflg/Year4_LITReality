<%-- 
    Document   : editPropertyPage
    Created on : 31-Jan-2018, 15:30:20
    Author     : gatez1511
--%>

<%@ include file="/agents/adminHeader.jsp" %> 
<style>

    input, select{
        width: 100%;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        resize: none;
    }
    .textarea {

        width: 100%;
        height: 300px;
        padding: 12px 20px;
        overflow:hidden;
        border: 2px solid #ccc;
        border-radius: 4px;
        resize: none;
        overflow-y: scroll;
        
    }


</style>
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            <i class="fa fa-map-marker fa-fw"></i> Edit Property Details
        </div>
        <div class="panel-body">
            <!-- /.panel-heading -->
            <div class="col-lg-9 col-sm-8 " style="padding-bottom: 50px;">

                <form action="UpdatePropertyServlet?propId=${editProp.id}" method="post" enctype="multipart/form-data" class="form-horizontal form-label-left">
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="street">
                            Street:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="street" id="street" class="big-control col-md-7 col-xs-12" readonly placeholder="${editProp.street}" value="${editProp.street}" onfocus="if (this.value === '${editProp.street}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.street}'
                                            }" required="required" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="city">
                            City:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="city" id="city" class="big-control col-md-7 col-xs-12" readonly placeholder="${editProp.city}" value="${editProp.city}" onfocus="if (this.value === '${editProp.city}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.city}'
                                            }" required="required" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="listingNum">
                            Listing Number:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="listingNum" id="listingNum"  type="number" class="big-control col-md-7 col-xs-12" readonly placeholder="${editProp.listingNum}" value="${editProp.listingNum}" onfocus="if (this.value === '${editProp.listingNum}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.listingNum}'
                                            }" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="type">
                            Status:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="status" id="style" class="left-form-control">
                                <c:forEach items="${propertyStatus}" var="status">
                                    <c:choose>
                                        <c:when test="${editProp.statusId.equals(status.statusId)}">
                                            <option value="${status.statusId}" selected="selected">${status.status}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${status.statusId}">${status.status}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="price">
                            Price:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="price" id="price" min="0" step="0.01" class="big-control col-md-7 col-xs-12" type="number" placeholder="${editProp.price}" value="${editProp.price}" onfocus="if (this.value === '${editProp.price}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.price}'
                                            }" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="style">
                            Property Style:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="style" id="style" class="left-form-control" disabled="true">
                                <c:forEach items="${styles}" var="style">
                                    <c:choose>
                                        <c:when test="${editProp.styleId.equals(style.styleId)}">
                                            <option value="${style.styleId}" selected="selected">${style.PStyle}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${style.styleId}">${style.PStyle}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="type">
                            Property Type:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="type" id="style" class="left-form-control" disabled="true">
                                <c:forEach items="${propertyType}" var="type">
                                    <c:choose>
                                        <c:when test="${editProp.styleId.equals(type.typeId)}">
                                            <option value="${type.typeId}" selected="selected">${type.PType}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${type.typeId}">${type.PType}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="beds">
                            Bedrooms:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="bedrooms" id="beds" type="number" min="0" class="left-form-control col-md-7 col-xs-12" placeholder="${editProp.bedrooms}" value="${editProp.bedrooms}" onfocus="if (this.value === '${editProp.bedrooms}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.bedrooms}'
                                            }" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="baths">
                            Bathrooms:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="bathrooms" id="baths" type="number" min="0" step="0.1" class="right-form-control col-md-7 col-xs-12" placeholder="${editProp.bathrooms}" value="${editProp.bathrooms}" onfocus="if (this.value === '${editProp.bathrooms}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.bathrooms}'
                                            }" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="squareFeet">
                            Square Feet:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="squareFeet" id="squareFeet" type="number" min="0"  class="left-form-control col-md-7 col-xs-12" placeholder="${editProp.squarefeet}" value="${editProp.squarefeet}" onfocus="if (this.value === '${editProp.squarefeet}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.squarefeet}'
                                            }" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="garageStyle">
                            Garage:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="garageType" id="garageType" class="right-form-control" disabled="true">
                                <c:forEach items="${garageType}" var="garage">
                                    <c:choose>
                                        <c:when test="${editProp.garageId.equals(garage.garageId)}">
                                            <option value="${garage.garageId}" selected="selected">${garage.GType}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${garage.garageId}">${garage.GType}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="garageSize">
                            Garage Size:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="garageSize" id="garageSize" type="number" min="0" readonly="" class="right-form-control col-md-7 col-xs-12" placeholder="${editProp.garagesize}" value="${editProp.garagesize}" onfocus="if (this.value === '${editProp.garagesize}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.garagesize}'
                                            }" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="ber">
                            BER Rating:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="ber" id="ber" class="right-form-control">
                                <c:forEach items="${berRatingsList}" var="ber">
                                    <c:choose>
                                        <c:when test="${editProp.berRating == ber}">
                                            <option value="${ber}" selected="selected">${ber}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${ber}">${ber}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="lotSize">
                            Lot Size:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="lotSize" id="lotSize" class="right-form-control col-md-7 col-xs-12" placeholder="${editProp.lotsize}" value="${editProp.lotsize}" onfocus="if (this.value === '${editProp.lotsize}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.lotsize}'
                                            }" required="required" type="text">
                        </div>
                    </div>
                    <!--                     IF ADMIN TO GO HERE-->
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="agent">
                            Agent:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="agent" id="agent" class="right-form-control">
                                <c:forEach items="${allAgents}" var="agent">
                                    <c:choose>
                                        <c:when test="${editProp.agentId.equals(agent.agentId)}">
                                            <option value="${agent.agentId}" selected="selected">${agent.name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${agent.agentId}">${agent.name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="vendor">
                            Vendor:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="vendor" id="vendor" class="left-form-control" disabled="true">
                                <c:forEach items="${vendorList}" var="vendor">
                                    <c:choose>
                                        <c:when test="${editProp.vendorId.equals(vendor.vendorId)}">
                                            <option value="${vendor.vendorId}" selected="selected">${vendor.name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${vendor.vendorId}">${vendor.name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="description">
                            Description:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea name="description" id="description" class="textarea" placeholder="${editProp.description}" value="${editProp.description}" onfocus="if (this.value === '${editProp.description}') {
                                        this.value = ''
                                    }" onblur="if (this.value === '') {
                                                this.value = '${editProp.description}'
                                            }" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12">
                            Photos:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12 edit-gallery">
                            <img src="images/properties/large/${editProp.photo}/${editProp.photo}.JPG" style="width: 80px; height: 80px;">
                            <input type="checkbox" name="images" value="${photo}"  />
                            <c:set var="count" value="0" scope="page" />
                            <c:forEach items="${imageList}" var="image" varStatus="loop">
                                <c:set var="count" value="${count + 1}" scope="page"/>
                                <img src="images/properties/large/${editProp.photo}/${editProp.photo}-${count}.JPG" style="width: 80px; height: 80px;">
                                <input type="checkbox" name="images" value="${photo}-${count}"  />
                            </c:forEach>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="upload-label col-md-3 col-sm-3 col-xs-12" for="file">
                            Select photos to upload:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="upload" type="file" name="uploadFile" multiple="multiple"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                            <a href="EditPropertyServlet?edit=${editProp.id}">
                                <button class="btn btn-labeled btn-danger" type="button">Cancel</button>
                            </a>
                            <button class="btn btn-labeled btn-info" type="reset">Reset</button>
                            <button class="btn btn-labeled btn-success" type="submit">Submit</button>
                        </div>
                    </div>




                </form>

            </div>
        </div>
    </div>
    <!-- /.panel -->
</div>
<%@ include file="/agents/adminFooter.jsp" %>
