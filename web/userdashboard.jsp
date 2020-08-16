<%-- 
    Document   : adminhome
    Created on : Apr 15, 2017, 3:41:35 PM
    Author     : Harpreet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home Page</title>
        <!-- Google font -->
        <!--		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">-->
        <!-- Bootstrap -->
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel="shortcut icon" href="favicon.ico?" type="image/x-icon" />

        <style>
            a.disabled {
                pointer-events: none;
            }
            html, body{
                padding-right: 0px !important; 
                position: relative!important;
            }
        </style>

        <script>

        </script>
    </head>
    <body>
        <%
            String userEmail = session.getAttribute("userEmail").toString();
            String userFullname = session.getAttribute("userFullname").toString();
        %>
        <!--        <nav class="navbar navbar-inverse">
        
                    <div class="container-fluid" >
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>                                                
                            </button>
                            <a  class="navbar-brand" href="#">   WebSiteName</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="onlineskilltest.jsp">TAKE TEST</a></li>
                                <li><a href="userTestHistory.jsp">TEST HISTORY</a></li>
                                <li><a href="ranking.jsp">VIEW RANKS</a></li>
                                <li><a href="download.jsp">DOWNLOAD PAPERS</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= userEmail%><span class="glyphicon glyphicon-user"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Change Password</a></li>
                                        <li><a href="profile.jsp">My Profile</a></li>
                                        <li><a href="userlogout.jsp">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="jumbotron">
                    <h4> USER LOGGED IN</h4> 
                    <label>EMAIL: <%=userEmail%></label>
        
                </div>-->
        <!-- Header -->
        <header id="header" style="border-bottom-color: lightgray;height: 57px;">
            <div class="container">

                <div class="navbar-header">
                    <!-- Logo -->
                    <!-- <div class="navbar-brand"> -->
                    <a class="logo disabled" href="" style="padding-top: 2px;">
                        <label><h2 style="color: #FF6700;"><b>Ace</b></h2></label><label><h2 style="color: black;"><b>InterviewTest</b></h2></label>
                        <!--                            <img src="./img/logo-alt.png" alt="logo">-->
                    </a>
                    <!-- </div> -->
                    <!-- /Logo -->

                    <!-- Mobile toggle -->
                    <button class="navbar-toggle">
                        <span></span>
                    </button>
                    <!-- /Mobile toggle -->
                </div>

                <!--                <div class="navbar-header" style="padding-left: 233px;">
                                     Logo 
                                    <div class="navbar-brand">
                                        <center> <h1 id="alpha">RESULT</h1></center>
                                    </div>
                                </div>-->

                <!-- Navigation -->
                <nav id="nav">
                    <ul class="main-menu nav navbar-nav navbar-right">
                        <li><a href="userdashboard.jsp">Home</a></li>
                        <li><a href="onlineskilltest.jsp">Start Test</a></li>
                        <li><a href="userTestHistory.jsp">Test History</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="userlogout.jsp" onClick="return confirm('Are you sure you want to logout?')" >Logout</a></li>
                    </ul>
                </nav>
                <!-- /Navigation -->

            </div>
        </header>
        <!-- /Header -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>

        <!-- Hero-area -->
        <div class="hero-area section">

            <!-- Backgound Image -->
            <div class="bg-image bg-parallax overlay" style="background-image:url(./img/page-background.jpg)"></div>
            <!-- /Backgound Image -->

            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        <ul class="hero-area-tree">
                            <li><a href="userdashboard.jsp">Home</a></li>
                        </ul>
                        <h1 class="white-text">Welcome <%= userFullname%></h1><br>
                        <h4 class="white-text">User Logged In : <%= userEmail%></h4>
                    </div>
                </div>
            </div>

        </div>
        <!-- /Hero-area -->
        <br><br>
        <div class="container">
            <div class="row">
                <div id="main" class="col-md-9">
                    <div class="row">
                        <!-- single blog -->
                        <div class="col-md-6">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="onlineskilltest.jsp">
                                        <img src="./img/starttest.jpg" style="height: 250px;" />
                                    </a>
                                </div>
                                <center><h3><a href="onlineskilltest.jsp">TAKE TEST</a></h3></center>
                                <!--                            <div class="blog-meta">
                                                                <span class="blog-meta-author">By: <a href="#">John Doe</a></span>
                                                                <div class="pull-right">
                                                                    <span>18 Oct, 2017</span>
                                                                    <span class="blog-meta-comments"><a href="#"><i class="fa fa-comments"></i> 35</a></span>
                                                                </div>
                                                            </div>-->
                            </div>
                        </div>
                        <!-- /single blog -->
                    </div>
                </div>
                <div id="aside" class="col-md-3">
                    <!-- posts widget -->
                    <div class="widget posts-widget">
                        <!--                        <h3></h3>-->

                        <!-- single posts -->
                        <div class="single-post">
                            <a class="single-post-img" href="ranking.jsp">
                                <img src="./img/course02.jpg" alt="">
                            </a>
                            <a href="ranking.jsp">View Ranks</a>
                        </div>
                        <!-- /single posts -->

                        <!-- single posts -->
                        <div class="single-post">
                            <a class="single-post-img" href="download.jsp">
                                <img src="./img/course05.jpg" alt="">
                            </a>
                            <a href="download.jsp">Download Papers</a>
                        </div>
                        <!-- /single posts -->

                    </div>
                    <!-- /posts widget -->
                    <!-- category widget -->
                    <div class="widget category-widget">
                        <h3>Query?</h3>
                        <h4><a href="contact.jsp">Contact Us</a></h4>
                    </div>
                    <!-- /category widget -->
                </div>
            </div>
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>