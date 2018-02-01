<%-- 
    Document   : addNewProperty
    Created on : 31-Jan-2018, 23:32:07
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
            <i class="fa fa-map-marker fa-fw"></i> Add Property Details
        </div>
        <div class="panel-body">
            <!-- /.panel-heading -->
            <div class="col-lg-9 col-sm-8 " style="padding-bottom: 50px;">
                <form action="AddPropertyServlet" method="post" enctype="multipart/form-data" class="form-horizontal form-label-left">
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="street">
                            Street:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="street" id="street" class="big-control col-md-7 col-xs-12"  placeholder="Street Name" required="required" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="city">
                            City:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="city" id="city" class="big-control col-md-7 col-xs-12"  placeholder="City" required="required" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="type">
                            Status:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="status" id="style" class="left-form-control">
                                <option selected="selected">Please select one</option>
                                <c:forEach items="${propertyStatus}" var="status">
                                        <option value="${status.statusId}">${status.status}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="price">
                            Price:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="price" id="price" class="big-control col-md-7 col-xs-12" type="number" placeholder="000.00" required="required" min="0" step="0.01">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="style">
                            Property Style:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="style" id="style" class="left-form-control" >
                                <option selected="selected">Please select one</option>
                                <c:forEach items="${styles}" var="style">
                                        <option value="${style.styleId}">${style.PStyle}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="type">
                            Property Type:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="type" id="style" class="left-form-control" >
                                <option selected="selected">Please select one</option>
                                <c:forEach items="${propertyType}" var="type">
                                        <option value="${type.typeId}">${type.PType}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="beds">
                            Bedrooms:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="bedrooms" id="beds" type="number" class="left-form-control col-md-7 col-xs-12" placeholder="1" required="required" min="0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="baths">
                            Bathrooms:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="bathrooms" id="baths" type="number" class="right-form-control col-md-7 col-xs-12" placeholder="1" required="required" min="0" step="0.1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="squareFeet">
                            Square Feet:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="squareFeet" id="squareFeet" type="number" class="left-form-control col-md-7 col-xs-12" required="required" min="0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="garageStyle">
                            Garage:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="garageType" id="garageType" class="right-form-control" >
                                <option selected="selected">Please select one</option>
                                <c:forEach items="${garageType}" var="garage">
                                        <option value="${garage.garageId}">${garage.GType}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="garageSize">
                            Garage Size:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="garageSize" id="garageSize" type="number" class="right-form-control col-md-7 col-xs-12"  required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="ber">
                            BER Rating:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="ber" id="ber" class="right-form-control">
                                <option selected="selected">Please select one</option>
                                <c:forEach items="${berRatingsList}" var="ber">
                                        <option value="${ber}">${ber}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="lotSize">
                            Lot Size:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input name="lotSize" id="lotSize" class="right-form-control col-md-7 col-xs-12" placeholder="0x0" required="required" type="text">
                        </div>
                    </div>
                    <!--                     IF ADMIN TO GO HERE-->
                    <div class="form-group">
                        <label class="right-control-label col-md-3 col-sm-3 col-xs-12" for="agent">
                            Agent:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="agent" id="agent" class="right-form-control">
                                <option value="${agent.agentId}" selected="selected">${agent.name}</option>
                                <c:forEach items="${allAgentsList}" var="agents">
                                        <option value="${agents.agentId}">${agents.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="left-control-label col-md-3 col-sm-3 col-xs-12" for="vendor">
                            Vendor:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="vendor" id="vendor" class="left-form-control" >
                                <option selected="selected">Please select one</option>
                                <c:forEach items="${vendorList}" var="vendor">
                                        <option value="${vendor.vendorId}">${vendor.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="big-label col-md-3 col-sm-3 col-xs-12" for="description">
                            Description:
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea name="description" id="description" class="textarea" placeholder="Description...." ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="upload-label col-md-3 col-sm-3 col-xs-12" for="file">
                            Select photos to upload
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="upload" type="file" name="uploadFile" multiple="multiple"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                            <a href="EditPropertyServlet">
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
