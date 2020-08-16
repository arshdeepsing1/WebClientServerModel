<%-- 
    Document   : adminloginpage1
    Created on : 1 Apr, 2015, 7:08:33 PM
    Author     : HP
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start Test</title>
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
            /*            .dropbtn {
                            background-color: #4CAF50;
                            color: white;
                            padding: 16px;
                            font-size: 16px;
                            border: none;
                            cursor: pointer;
                        }
            
                        .dropdown {
                            position: relative;
                            display: inline-block;
                        }
            
                        .dropdown-content {
                            display: none;
                            position: absolute;
                            background-color: #f9f9f9;
                            min-width: 160px;
                            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                            z-index: 1;
                        }
            
                        .dropdown-content a {
                            color: black;
                            padding: 12px 16px;
                            text-decoration: none;
                            display: block;
                        }
            
                        .dropdown-content a:hover {background-color: #f1f1f1}
            
                        .dropdown:hover .dropdown-content {
                            display: block;
                        }
            
                        .dropdown:hover .dropbtn {
                            background-color: #3e8e41;
                        }*/
            a.disabled {
                pointer-events: none;
            }
            html, body{
                padding-right: 0px !important; 
                position: relative!important;
            }
        </style>

        <script>
            function fetchcourse()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();


                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        myjsa = jsa;
                        var ans = "";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<a class=\"category disabled\" href=\"#\">" + js["cname"] + "</a>"
                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("lantern").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchcourse", true);
                xml.send();
            }
        </script>
    </head>
    <body onload="fetchcourse()">
        <!--    <center> <h3><a href="userdashboard.jsp"  >
                        <font color="#006600">GOTO HOME PAGE</font></a> </h3></center>
            <section class="about-us" id="about">
                <div class="container">
                    <div class="jumbotron" style='box-shadow: 10px 10px 5px grey;'>
                        <h1 style="padding-left: 120px;" >ONLINE EXAM</h1>
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>SECTION WISE</h2>
                                <a href="testpage1.jsp" type="button" class="btn btn-success btn-block">START TEST</a>
                            </div>
                            <div class="col-sm-6">
                                <h2>COURSE WISE</h2>
                                <a href="courseTest.jsp" type="button" class="btn btn-success btn-block">START TEST</a>
                            </div>
                        </div>
        
        
        
        
        
        
        
                    </div>
        
                </div>
            </section>-->
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
                            <li>Start Test</li>
                        </ul>
                        <h1 class="white-text">Start Online Test</h1>

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
                                    <a href="testpage1.jsp">
                                        <img src="./img/blog01.jpg" alt="">
                                    </a>
                                </div>
                                <h3><a href="testpage1.jsp">SECTION TEST</a></h3>
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

                        <!-- single blog -->
                        <div class="col-md-6">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="courseTest.jsp">
                                        <img src="./img/blog01.jpg" alt="">
                                    </a>
                                </div>
                                <h3><a href="courseTest.jsp">COURSE TEST</a></h3>
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
                    <!-- category widget -->
                    <div class="widget category-widget">
                        <h3>Course Categories</h3>
                        <div id="lantern">
                        </div>
                        <!-- /category widget -->
                    </div>
                </div>
            </div>
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
