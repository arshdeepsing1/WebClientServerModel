<%-- 
    Document   : userTestHistory
    Created on : May 4, 2018, 11:05:49 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test History</title>
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
            th{
                color: black;
                font-size: 17px;
            }
            td{
                color: black;
            }
            .modal-dialog {
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            .modal-content {
                height: auto;
                min-height: 100%;
                border-radius: 0;
            }
            .modal-dialog1 {
                width: 50%;
                height: 50%;
                margin: 50px;
                padding: 50px;
            }

            .modal-content1 {
                height: auto;
                min-height: 50%;
                border-radius: 0;
                background-color: whitesmoke;
                border: 1px solid black;
            }
            .zoom {
                transition: transform .2s; /* Animation */
                width: 600px;
                height: 600px;
                margin: 10 auto;
            }
            .zoom:hover {
                transform: scale(9.9); 
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
            var myjsa;
            function rollCourses() {
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
                        ans += "<thead>";
                        ans += "<tr><th>TEST ID</th><th>TEST DATE</th><th>COURSE</th><th>MARKS SCORED</th><th>FINAL RESULT</th><th>SHOW RESULT</th></tr>";
                        ans += "</thead>";
                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + js["rid"] + "</td>";
                            ans += "<td>" + js["testDate"] + "</td>";
                            ans += "<td>" + js["cname"] + "</td>";
                            ans += "<td>" + js["marksscored"] + "</td>";
                            ans += "<td>" + js["finalresult"] + "</td>";
                            ans += "<td><input type='button' value='Show Details Result' class='btn btn-success'  onclick='checkcoursetestques(" + js["rid"] + ")'/></td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        document.getElementById("great").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchC_history", true);
                xml.send();
            }
            function rollSections() {
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
                        ans += "<thead>";
                        ans += "<tr><th>TEST ID</th><th>TEST ID</th><th>TEST SECTION</th> <th>TEST COURSE</th><th>MARKS SCORED</th><th>FINAL RESULT</th><th>SHOW RESULT</th></tr>";
                        ans += "</thead>";
                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + js["rid"] + "</td>";
                            ans += "<td>" + js["testDate"] + "</td>";
                            ans += "<td>" + js["sname"] + "</td>";
                            ans += "<td>" + js["cname"] + "</td>";
                            ans += "<td>" + js["marksscored"] + "</td>";
                            ans += "<td>" + js["finalresult"] + "</td>";
                            ans += "<td><input type='button' value='Show Detail Result' class='btn btn-primary'  onclick='checkcoursetestques(" + js["rid"] + ")'/></td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        document.getElementById("great").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchS_history", true);
                xml.send();
            }

            function checkcoursetestques(rid)
            {
                $("#myModal").trigger('reset');
                $("#myModal").modal('show');
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
                        ans += "<thead class='bg-warning'>";
//                        var qwerty = 1;
//                        for (var j = 0; j < jsa.length; j++) {
//                            var check_for_photo = jsa[j];
//                            if (check_for_photo["quesType"] == "TEXT TYPE QUESTION") {
//                                qwerty = 1;
//                            } else {
//                                qwerty = 2;
//                                break;
//                            }
//                        }
//                        if (qwerty === 1) {
//                            ans += "<tr><td>TEST ID</td> <td>QUESTION NUMBER</td> <td>QUESTION TITLE</td><td>CORRECT ANSWER</td><td>USER ANSWER</td><td></td></tr>";
//                        } else {
//                            ans += "<tr><td>TEST ID</td> <td>QUESTION NUMBER</td> <td>QUESTION TITLE</td><td>QUESTION IMAGE</td><td>CORRECT ANSWER</td><td>USER ANSWER</td><td></td></tr>";
//                        }
                        ans += "<tr><th>TEST ID</th> <th>QUESTION NUMBER</th> <th>QUESTION TITLE</th><th>USER ANSWER</th><th>CORRECT ANSWER</th><th></th><th>EXPLANATION</th></tr>";
                        ans += "</thead>";
                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + js["rid"] + "</td>";
                            ans += "<td>" + (i + 1) + "</td>";
//                            if (qwerty == 1) {
//
//                            } else {
                            if (js["quesType"] == "TEXT TYPE QUESTION") {
                                ans += "<td>" + js["quesTitle"] + "</td>";
                            } else {
                                ans += "<td>" + js["quesTitle"] + "<br><img src=\"" + js["quesImage"] + "\"/ class='zoom' style=\"width :30px;height :30px\"><br>(hover to zoom)</td>";
                            }
//                            }
                            if (js["useranswer"] == "") {
                                js["useranswer"] = "N/A";
                            }
                            ans += "<td>" + js["useranswer"] + "</td>";
                            ans += "<td>" + js["correctanswer"] + "</td>";
                            if (js["useranswer"] === js["correctanswer"])
                            {
                                ans += "<td><span class=\"glyphicon glyphicon-ok-sign\" style='color: green;'></span></td>";
                            } else if (js["useranswer"] !== js["correctanswer"])
                            {
                                if (js["useranswer"] === "")
                                {
                                    ans += "<td><span class=\"glyphicon glyphicon-ban-circle\" style='color: blue;'></span></td>";
                                } else
                                {
                                    ans += "<td><span class=\"glyphicon glyphicon-remove-sign\" style='color: red;'></span></td>";
                                }
                            }
                            ans += "<td><input type='button' value='Show Explanation' class='btn btn-primary btn-sm'  onclick='Explanation(" + js["qid"] + ")' style='background-color: #FF6700;'/></td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        document.getElementById("model").innerHTML = ans;
                    }
                };
                xml.open("GET", "./checkcoursetestques?rid=" + rid, true);
                xml.send();

            }
            function Explanation(qid)
            {

                $("#myModalex").trigger('reset');
                $("#myModalex").modal('show');
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
                        ans += "<thead class='bg-info'>";
                        ans += "<tr> <th>EXPLANATION</th></tr>";
                        ans += "</thead>";
                        ans += "</tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";
                            ans += "<td>" + js["Explanation"] + "</td>";
                            ans += "</tr>";
                        }
                        ans += "</tbody>";
                        ans += "</table>";
                        document.getElementById("modelex").innerHTML = ans;
                    }
                };
                xml.open("GET", "./Explanation?qid=" + qid, true);
                xml.send();
            }
        </script>
    </head>
    <body>
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
                            <li>Test History</li>
                        </ul>
                        <h1 class="white-text">Your Test History</h1>

                    </div>
                </div>
            </div>

        </div>
        <!-- /Hero-area -->
        <br><br>

        <div class="container">
            <!--            <div class="row">
                            <center><h1><b>Your Test History</b></h1></center>
                        </div>
                        <br>-->
            <div class="row">
                <button type="button" class="btn btn-success btn-block" onclick="rollCourses()"> Course History</button>
                <button type="button" class="btn btn-primary btn-block" onclick="rollSections()"> Section History</button>
                <br><br>
                <div id="great"></div>
            </div>
        </div>
        <!--        <div id="myModal" class="modal fade" role="dialog"  style="overflow-y :scroll;max-height: 85%;margin-top: 50px;margin-bottom: 50px;width: 100%;">-->
        <div id="myModal" class="modal fade" role="dialog" style="overflow-y :scroll;">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">TEST DETAILS</h4>
                    </div>
                    <div class="modal-body" id="model" >


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="close" name="close" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <div id="myModalex" class="modal fade" role="dialog"  >
            <div class="modal-dialog1">

                <!-- Modal content-->
                <div class="modal-content1" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Explanation</h4>
                    </div>
                    <div class="modal-body" id="modelex">


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="close" name="close" data-dismiss="modal">Close</button>
                    </div>


                </div>

            </div>
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
