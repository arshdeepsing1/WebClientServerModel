<%-- 
    Document   : manage_feedback
    Created on : May 10, 2018, 3:03:25 PM
    Author     : Dapinder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Feedback</title>
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
            .checked {
                color: orange;
            }
            th{
                color: white;
                font-size: 15px;
            }
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
            var qwerty = "";
            function cfeedback()
            {
                var rate;
                qwerty = "left";
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
                        ans += "<table class='table table-hover'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <th>SNO.</th> <th>COURSE NAME</th><th>AVERAGE RATING</th></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var l = i;
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + (l + 1) + "</td>";
                            ans += "<td><b>" + js["c_Name"] + "</b></td>";
                            var q = js["avg(rating)"];
                            var temp = parseInt(q);
                            rate = temp.toString().split('.');
                            ans += "<td><span class=\"badge\" style=\"background-color: red;\">" + (rate.toString()) + "</span></td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("left_table").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchfeedback?qwerty=" + qwerty, true);
                xml.send();


            }
            function sfeedback()
            {
                var rate;
                qwerty = "right";
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
                        ans += "<table class='table table-hover'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <th>SNO.</th> <th>SECTION NAME(COURSE CATEGORY)</th><th>AVERAGE RATING</th></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var l = i;
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + (l + 1) + "</td>";
                            ans += "<td><b>" + js["s_Name"] + "</b> (" + js["c_Name"] + ") </td>";
                            var q = js["avg(rating)"];
                            var temp = parseInt(q);
                            rate = temp.toString().split('.');
                            ans += "<td><span class=\"badge\" style=\"background-color: red;\">" + (rate.toString()) + "</span></td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("right_table").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchfeedback?qwerty=" + qwerty, true);
                xml.send();


            }
            function mfeedback()
            {
                qwerty = "all";
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
                        ans += "<table class='table table-hover'>";

                        ans += "<thead class='bg-primary'>";
                        ans += "<tr> <th>SNO.</th> <th>RESULT ID</th><th>TESTDATE</th><th>EMAIL</th><th>RATING</th><th>COMMENT</th></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var l = i;
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + (l + 1) + "</td>";
                            ans += "<td>" + js["rid"] + "</td>";
                            ans += "<td>" + js["testdate"] + "</td>";
                            ans += "<td>" + js["Email"] + "</td>";
                            var star = js["rating"];
                            if (star === "0") {
                                ans += "<td><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span></td>";

                            } else if (star === "1") {
                                ans += "<td><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span></td>";

                            } else if (star === "2") {
                                ans += "<td><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span></td>";

                            } else if (star === "3") {
                                ans += "<td><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span></td>";

                            } else if (star === "4") {
                                ans += "<td><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star fa-2x\"></span></td>";

                            } else if (star === "5") {
                                ans += "<td><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span><span class=\"fa fa-star checked fa-2x\"></span></td>";

                            } else {

                            }
                            ans += "<td>" + js["comment"] + "</td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchfeedback?qwerty=" + qwerty, true);
                xml.send();


            }
        </script>
    </head>
    <body onload="cfeedback(), sfeedback(), mfeedback()">
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
                        <li><a href="Welcome.jsp">Home</a></li>
                        <li><a href="logoutAdmin.jsp" onClick="return confirm('Are you sure you want to logout?')" >Logout</a></li>
                    </ul>
                </nav>
                <!-- /Navigation -->

            </div>
        </header>
        <!-- /Header -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>

        <div class="container">
            <br><br>
            <center><h1><b>User Test Feedbacks</b></h1></center>
            <br><br>
            <div class="row">
                <div class="col-sm-5">
                    <center><h3><b>Course-Wise Test Average User Rating</b></h3></center>
                    <br>
                    <div id="left_table" class="container-fluid">
                    </div>
                </div>
                <div class="col-sm-1">
                </div>
                <div class="col-sm-6">
                    <center><h3><b>Section-Wise Test Average User Rating</b></h3></center>
                    <br>
                    <div id="right_table" class="container-fluid">
                    </div>
                </div>
            </div>
            <br>
            <center><h3><b>User Feedback History</b></h3></center>
            <div class="row">
                <div id="d1" class="container-fluid">
                </div>
            </div>
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
