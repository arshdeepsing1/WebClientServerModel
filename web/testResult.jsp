<%-- 
    Document   : testResult
    Created on : Apr 28, 2018, 11:43:19 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Section Result</title>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.canvasjs.min.js"></script>
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

        <style type="text/css">
            #myProgress {
                width: 100%;
                background-color: #ddd;
            }

            #myBar {
                width: 1%;
                height: 20px;
                background-color: #4CAF50;
            }

            .t1{
                font-size: 40px;
                color: #ff0000; 
            }
            .t2{
                font-size: 40px;
                color: #000000; 
            }

            .t{
                font-size: 40px;
                color: #00cc00; 
            }
            .table tbody{
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
            var inc = 1;
            var algo1;
            var algo2;
            var tm_S;
            var result_S;
            var n = 0;
            var pid;
            var three;
            var xmlhttp;
            var correct;
            var wrong;
            var unutil;
            xmlhttp = new XMLHttpRequest();
            function result() {
                xmlhttp.open("get", "./finalresultservlet", true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function () {

                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("div1").innerHTML = xmlhttp.responseText.trim();
                        algo1 = document.getElementById("tellpercent").innerHTML;
                        algo2 = parseInt(algo1);
                        console.log(algo2);
                        tm_S = document.getElementById("tellmarks").innerHTML;
                        result_S = document.getElementById("tellresult").innerHTML;
                        document.getElementById("left").innerHTML = "<h4>MARKS SCORED :" + tm_S + "</h4>";
                        document.getElementById("right").innerHTML = "<h4>TEST RESULT :" + result_S + "</h4>";
                        document.getElementById("wheel").style.visibility = 'visible';
                        three = algo1;
                        correct = document.getElementById("piechart1").innerHTML;
                        wrong = document.getElementById("piechart2").innerHTML;
                        unutil = document.getElementById("piechart3").innerHTML;
                        document.getElementById("output").innerHTML = "YOU SCORED " + algo1 + "%";
                        piechart();
                        start();
                        document.getElementById("swift").style.visibility = 'visible';
                    }
                };

            }
            function start()
            {

                var elem = document.getElementById("myBar");
                var width = 1;
                var id = setInterval(frame, 9);
                function frame() {
                    if (width >= algo2) {
                        algo2 = 0;
                        clearInterval(id);
                    } else {
                        width++;
                        elem.style.width = width + '%';
                    }
                }
            }
            function piechart() {
                var x1 = parseInt(correct);
                var x2 = parseInt(wrong);
                var x3 = parseInt(unutil);
                var chart = new CanvasJS.Chart("chartContainer",
                        {
                            theme: "theme2",
                            title: {
                                text: "ANALYSIS"
                            },
                            data: [
                                {
                                    type: "pie",
                                    showInLegend: false,
                                    toolTipContent: "{y} - #percent %",
                                    yValueFormatString: "",
                                    //                legendText: "{indexLabel}",
                                    dataPoints: [
                                        //{  y: 41, indexLabel: "Republican" },
                                        //{  y: 21, indexLabel: "US Congress" },
                                        {y: x3, indexLabel: "Unattempted"},
                                        {y: x2, indexLabel: "Incorrect"},
                                        {y: x1, indexLabel: "correct"},
                                    ]
                                }
                            ]
                        });
                chart.render();
            }
        </script>
    </head>
    <body onload="result()">
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

                <div class="navbar-header" style="padding-left: 242px;">
                    <!-- Logo -->
                    <div class="navbar-brand">
                        <center> <h1 id="alpha">RESULT</h1></center>
                    </div>
                </div>

                <!-- Navigation -->
                <nav id="nav">
                    <ul class="main-menu nav navbar-nav navbar-right">
                        <li><a href="onlineskilltest.jsp">Take  Another Test</a></li>
                        <li><a href="userdashboard.jsp">Home</a></li>
                    </ul>
                </nav>
                <!-- /Navigation -->

            </div>
        </header>
        <!-- /Header -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <br>
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <div class="container">
            <!--            <h3 style="background-color: greenyellow;"><a href="userdashboard.jsp"  ><b><font color="#006600">GO TO HOME PAGE</font></b></a> </h3>
                        <br>-->
            <div class="row" style="height: 260px;">
                <div class="row col-sm-6"style="height: 260px;padding-top: 70px;">
                    <div style="border-radius :20px 20px 20px 20px;background-color: #FCF0E4;height: 120px;">
                        <label id="left" style="padding-top :21px;padding-left :25px;"></label><label id="right" style="padding-top :21px;padding-left :50px;"></label>
                        <div id="wheel" style="visibility :hidden;">
                            <div id="myProgress" class="progress">
                                <div id="myBar" class="progress-bar progress-bar-info active" ></div><label id="output"></label> 
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row col-sm-6" style="height: 260px;"><div id="chartContainer" style="height: 260px;"></div></div>
            </div>
            <br>
            <div id="div1" class="row">

            </div>
            <br>
            <div class="row" id="swift" style="visibility: hidden">
                <center><a href="feedback.jsp"><button type="button" class="main-button icon-button" id="gofeedback" >SEND FEEDBACK</button></a></center>
            </div>
        </div>
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
