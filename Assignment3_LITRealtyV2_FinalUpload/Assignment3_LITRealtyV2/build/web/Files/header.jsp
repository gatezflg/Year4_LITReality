<!DOCTYPE html>
<html lang="en">
    <head>
        <title>LIT-Realty | ${page}</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="Author" content="Ronan Gately">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="assets/style.css"/>
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.js"></script>
        <script src="assets/script.js"></script>
        <!-- Owl stylesheet -->
        <link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
        <script src="assets/owl-carousel/owl.carousel.js"></script>
        <!-- Owl stylesheet -->


        <!-- slitslider -->
        <link rel="stylesheet" type="text/css" href="assets/slitslider/css/style.css" />
        <link rel="stylesheet" type="text/css" href="assets/slitslider/css/custom.css" />
        <script type="text/javascript" src="assets/slitslider/js/modernizr.custom.79639.js"></script>
        <script type="text/javascript" src="assets/slitslider/js/jquery.ba-cond.min.js"></script>
        <script type="text/javascript" src="assets/slitslider/js/jquery.slitslider.js"></script>
        <!-- slitslider -->
        <link rel="shortcut icon" href="images/site/logo.gif">

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <style>
            #map {
                height: 400px;
                width: 100%;
                background-color: grey;
            }
        </style>
    </head>
    <body>
        <!-- Header Starts -->
        <div class="navbar-wrapper">

            <div class="navbar-inverse" role="navigation">
                <div class="container">
                    <div class="navbar-header">


                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>


                    <!-- Nav Starts -->
                    <div class="navbar-collapse  collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="IndexServlet">Home</a></li>
                            <li><a href="PropertiesServlet?all">All Properties</a></li>
                            <li><a href="FavouritesServlet?all">Favourites</a></li>
                            <li><a href="IndexServlet?Agents=1">Agents</a></li>
                            <li><a href="contact.jsp">Contact</a></li>
                        </ul>
                    </div>
                    <!-- #Nav Ends -->

                </div>
            </div>

        </div>
        <!-- #Header Starts -->





        <div class="container">

            <!-- Header Starts -->
            <div class="header">
                <a href="IndexServlet"><img src="images//site/logo2.jpg" alt="Realestate"></a>
            </div>
            <!-- #Header Starts -->
        </div>