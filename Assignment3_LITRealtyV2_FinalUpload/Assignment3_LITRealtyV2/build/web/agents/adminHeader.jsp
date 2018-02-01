<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="Author" content="Ronan Gately">
        <title>LIT-Realty Agents | ${page}</title>

        <!-- Bootstrap Core CSS -->
        <link href="agents/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- MetisMenu CSS -->
        <link href="agents/assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="agents/assets/dist/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <!-- Morris Charts CSS -->
        <link href="agents/assets/vendor/morrisjs/morris.css" rel="stylesheet" type="text/css"/>
        <link href="agents/assets/DataTables-1.10.12/media/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Fonts -->
        <link href="agents/assets/css/input_style.css" rel="stylesheet" type="text/css"/>
        <link href="agents/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link rel="shortcut icon" href="images/site/logo.gif">

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
        <style>
            body {
                padding-bottom: 50px;

            }

        </style>
    </head>
    <body>
        <c:set var="props" value="${allProps}"/>
        <c:set var="myProps" value="${agentProps}"/>
        <c:set var="litVendors" value="${vendorList}"/>
        <c:set var="allAgentsList" value="${allAgentsList}"/>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" >Welcome ${agent.name}
                        <c:if test="${agent.role == 'admin'}">
                            - Administrator
                        </c:if></a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">

                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <img class="bottom img-circle center" style="height: 30%; width: 30%;" src="images/agents/${agent.agentId}.jpg" alt=""/> <i class="fa fa-caret-down"> </i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="AdminServlet?agentId=${agent.agentId}"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="AdminServlet?edit=${agent.agentId}"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/Assignment3_LITRealtyV2/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="LoginServlet"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="AgentServlet"><i class="fa fa-bar-chart-o fa-fw"></i> My Property Portfolio</a>
                            </li>
                            <li>
                                <a href="VendorsServlet?all"><i class="fa fa-table fa-fw"></i> LITRealty Vendors</a>
                            </li>
                            <li>
                                <a href="EditPropertyServlet"><i class="fa fa-edit fa-fw"></i> Add Property</a>
                            </li>
                            <c:if test="${agent.role == 'admin'}">
                                <li>
                                    <a href="AdminServlet?Report=1"><i class="fa fa-file-archive-o fa-fw"></i> LitRealty Reports</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">${title}</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${fn:length(litVendors)}</div>
                                        <div>Vendors</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <a href="VendorsServlet?all"> <span class="pull-left"> LITRealty Vendors </span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span></a>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${fn:length(props)}</div>
                                        <div>Lit-Reality Properties</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <a href="AgentServlet?allProp"> <span class="pull-left"> All Properties </span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span></a>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${fn:length(myProps)}</div>
                                        <div>${agent.name} Portfolio </div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <a href="AgentServlet"> <span class="pull-left"> My Property Portfolio </span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span></a>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <c:if test="${agent.role == 'admin'}">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-red">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">${fn:length(allAgentsList)}</div>
                                            <div>LITRealty Agents</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <a href="AdminServlet?all"><span class="pull-left">View All Agents</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span></a>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:if>          
                </div>
                <!-- /.row -->