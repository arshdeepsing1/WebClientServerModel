<%-- 
    Document   : ranking
    Created on : May 8, 2018, 11:10:38 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking</title>
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
            td{
                color: black;
            }
            a.disabled {
                pointer-events: none;
            }
            html, body{
                padding-right: 0px !important; 
                position: relative!important;
            }
        </style>

        <script>
            var email = "<%= ((session.getAttribute("userEmail")))%>";
            function fetchcourseranks()
            {

                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText.trim();
                        var mainjson = JSON.parse(res);

                        var jsa = mainjson["ans"];

                        var ans = "";
                        ans += "<option  value='-1'>--Select--</option>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<option  value='" + js["Courseid"] + "'  >" + js["cname"] + "</option>";
                        }
                        document.getElementById("course").innerHTML = ans;

                    }
                };
                xml.open("GET", "./fetchcourse", true);
                xml.send();
            }
            function fetch_all_ranks() {
                var Courseid = document.getElementById("course").value;
                var zed1 = 1;
                var count = 0;
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();
                        //console.log(res);
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        myjsa = jsa;
                        var ans = "";
                        ans += "<table class='table table-hover'>";
                        ans += "<thead class='bg-success'>";
                        ans += "<tr><td>RANK</td><td>USER EMAIL</td><td>MARKS SCORED</td><td>TOTAL MARKS</td><td>PERCENTAGE</td></tr>";
                        ans += "</thead>";
                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            zed1 = 1;
                            var fetchobject = js["marksscored"];
                            var convert = parseInt(fetchobject);
                            zed1 = (convert * 100) / 50;
                            if (zed1 <= 0) {
                                zed1 = 0;
                            }
                            if (js["Email"] === email && count === 0) {
                                ans += "<tr style='background-color: #EE8E2E;'>";
                                ans += "<td style='color: white;'><b>" + (i + 1) + "</b></td>";
                                ans += "<td style='color: white;'><img src='" + js["Userphoto"] + "' class='img-responsive img-thumbnail' style='width: 33px;height: 33px;'/> <b>" + js["Email"] + "</b></td>";
                                ans += "<td style='color: white;'><b>" + js["marksscored"] + "</b></td>";
                                ans += "<td style='color: white;'><b>" + 30 + "</b></td>";
                                ans += "<td><span class=\"badge\" style=\"background-color: white;color: #669900;\">" + (zed1.toString()) + "%</span></td>";
                                ans += "</tr>";
                                count++;
                                document.getElementById("tell").style.visibility = 'visible';
                            } else if (js["Email"] === email && count != 0) {
                                ans += "<tr style='background-color: #EDCAA7;'>";
                                ans += "<td><b>" + (i + 1) + "</b></td>";
                                ans += "<td><img src='" + js["Userphoto"] + "' class='img-responsive img-thumbnail' style='width: 33px;height: 33px;'/> " + js["Email"] + "</td>";
                                ans += "<td>" + js["marksscored"] + "</td>";
                                ans += "<td>" + 30 + "</td>";
                                ans += "<td><span class=\"badge\" style=\"background-color: #669900;color: white;\">" + (zed1.toString()) + "%</span></td>";
                                ans += "</tr>";
                            } else {
                                ans += "<tr>";
                                ans += "<td><b>" + (i + 1) + "</b></td>";
                                ans += "<td><img src='" + js["Userphoto"] + "' class='img-responsive img-thumbnail' style='width: 33px;height: 33px;'/> " + js["Email"] + "</td>";
                                ans += "<td>" + js["marksscored"] + "</td>";
                                ans += "<td>" + 30 + "</td>";
                                ans += "<td><span class=\"badge\" style=\"background-color: #669900;color: white;\">" + (zed1.toString()) + "%</span></td>";
                                ans += "</tr>";
                            }
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        document.getElementById("thetable").innerHTML = ans;

                    }
                };
                xml.open("GET", "./thecourserank?Courseid=" + Courseid, true);
                xml.send();
            }
        </script>
    </head>
    <body onload="fetchcourseranks()">
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
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
                            <li>View Ranks</li>
                        </ul>
                        <h1 class="white-text">View Rank List Of All Courses</h1>

                    </div>
                </div>
            </div>

        </div>
        <!-- /Hero-area -->
        <br><br>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div  class="form-group" >
                        <label>Select Course</label><select class="input form-control" id="course" name="course" onchange="fetch_all_ranks()">
                        </select>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div id="thetable">

                    </div>
                    <br>
                    <label id='tell' style="visibility :hidden;"><h4><span class="glyphicon glyphicon-stop" style="color: #EE8E2E;"></span>Your Current Rank</h4><h4><span class="glyphicon glyphicon-stop" style="color: #EDCAA7;"></span>Previous Scores</h4></label>
                </div>
            </div>

        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
