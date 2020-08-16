<%-- 
    Document   : managesubcategories
    Created on : 12 Apr, 2018, 3:50:31 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Test</title>
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
                width: 50%;
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
            .table thead{
                border: 2px solid #FF6700;
                border-bottom: 3px solid #FF6700;
            }
            a.disabled {
                pointer-events: none;
            }
        </style>
        <script>
            var globalcatjsa;
            var globalsubjsa;
            var globalquesjsa;
            var selectedcatcid;
            var selectedcatindex;
            var selectedsubsid;
            var selectedsubindex;
            var hou = 9;
            var sec = 60;
            var myTimer;
            var n = 0;
            var limit = 100;


            function exit() {
                var ans = confirm("You would not be able to evaluste your result.\n\nAre you sure you want to EXIT?");
                if (ans == true)
                {
                    window.location.href = "userdashboard.jsp";
                } else
                {

                }
            }
            function submit() {
                var ans = confirm("Are you sure you want to SUBMIT?");
                if (ans == true)
                {
                    //document.getElementById("head").style.display = 'none';
                    document.getElementById("the_two").style.display = 'none';
                    document.getElementById("the_three").style.display = 'none';
                    clearInterval(myTimer);
                    document.getElementById("timer").className = "t2";
                    document.getElementById("timer").innerHTML = "";
                    //document.getElementById("alpha").innerHTML = "RESULT";
                    //alert('Your Result');
                    document.getElementById("div1").innerHTML = "<center><b>GENERATING YOUR RESULT</b></center>";
                    saveresultDB();
                } else
                {

                }
            }
            ////////////////////////////////////////////////////////////////////
            function showcourses()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var ans1 = "";
                        var res = xml.responseText.trim();
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        globalcatjsa = jsa;
                        ans1 += "<option>--Select Course--</option>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans1 += "<option value=\"" + js["Courseid"] + "\">" + js["cname"] + "</option>";
                        }
                        document.getElementById("cat").innerHTML = ans1;
                    }

                };

                xml.open("GET", "./fetchcourse", true);
                xml.send();

            }
            ////////////////////////////////////////////////////////////////////
            function setselectedcourse(value)
            {
                var index = document.getElementById("cat").selectedIndex;
                if (index == 0)
                {

                    alert("Select any course");
                } else
                {

                    selectedcatcid = value;
                    selectedcatindex = index - 1;
                    showsubjects(value);

                }
            }
            ////////////////////////////////////////////////////////////////////
            function showsubjects(cid)
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var ans1 = "";
                        var res = xml.responseText.trim();
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        globalsubjsa = jsa;
                        ans1 += "<option>--Select Subject--</option>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans1 += "<option value=\"" + js["Sectionid"] + "\">" + js["sname"] + "</option>";
                        }
                        document.getElementById("subcat").innerHTML = ans1;
                    }
                };
                xml.open("GET", "./fetchsection?cid=" + cid, true);
                xml.send();
            }
            ////////////////////////////////////////////////////////////////////
            function setselectedsubject(value)
            {
                var ind = document.getElementById("cat").selectedIndex;
                var index = document.getElementById("subcat").selectedIndex;
                if (ind == 0) {
                    alert("Please select any course")
                } else {
                    if (index == 0)
                    {

                        alert("Select any subject");
                    } else
                    {
                        selectedsubsid = value;
                        selectedsubindex = index - 1;
                        showquestions(value, selectedcatcid);
                        go2();
                        hideddd();
                    }
                }
            }
            ////////////////////////////////////////////////////////////////////
            function showquestions(sid, cid)
            {
                var ans = "";
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();
                        document.getElementById("div1").innerHTML = res;
                    }
                };
                xml.open("GET", "./fetchrandomquestions?sid=" + sid + "&cid=" + cid, false);
                xml.send();
            }
            ////////////////////////////////////////////////////////////////////

            var value = 80;
            var interval;
            var ans;
            var h = 0;
            var xmlhttp;
            xmlhttp = new XMLHttpRequest();
            ////////////////////////////////////////////////////////////////////
            function go2() {

                //interval = setInterval(go3, 1000);
                //document.getElementById("s1").style.display = "none";

                myTimer = setInterval(gamma, 1000);

            }
            function gamma() {

                if (hou > 0) {
                    document.getElementById("timer").innerHTML = hou + " : " + sec;
                } else {
                    document.getElementById("timer").className = "t1";
                    document.getElementById("timer").innerHTML = "TIME LEFT:" + "" + hou + " :" + sec;
                }
                sec--;
                if (sec == 0)
                {
                    if (hou <= 0 && sec <= 0) {
                        clearInterval(myTimer);
                        //document.getElementById("head").style.display = 'none';
                        document.getElementById("timer").className = "t2";
                        document.getElementById("timer").innerHTML = "TIME OVER";
                        document.getElementById("div1").innerHTML = "<center><b>GENERATING YOUR RESULT</b></center>";
                        //alert('re-directing to result window !!');
//                        var rd = 5;
//                        var redirect = setInterval(function () {
//                            rd--;
//                            if (rd == 0) {
//                                clearInterval(rd);
//                                document.getElementById("timer").innerHTML = "";
//                                document.getElementById("alpha").innerHTML = "RESULT";
//                                result();
//                                //window.location.href = "testResult.jsp?";
//                            }
//                        }, 1000);
                        saveresultDB();
                    }
                    hou--;
                    sec = 60;
                    if (hou == 0)
                    {

                    }
                }
            }
            ////////////////////////////////////////////////////////////////////
            function saveresultDB() {
                var xmlhttp1 = new XMLHttpRequest();
                xmlhttp1.open("GET", "./thesectiontest", true);
                xmlhttp1.send();
                xmlhttp1.onreadystatechange = function () {

                    if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200)
                    {

                        var res1 = xmlhttp1.responseText.trim();
                        if (res1 === 'success') {
                            start();
                        } else {
                            alert('result not saved !!');
                        }


                    }
                };

            }
            ////////////////////////////////////////////////////////////////////
            function go4(ind) {
                if (ind == 0) {
                    xmlhttp.onreadystatechange = go1;
                    xmlhttp.open("get", "./generatequestionservlet?ind=" + ind, true);
                    xmlhttp.send();
                } else {
                    var i2 = ind - 1;
                    xmlhttp.onreadystatechange = go1;
                    xmlhttp.open("get", "./generatequestionservlet?ind=" + i2, true);
                    xmlhttp.send();
                }
            }
            function go5(ind1) {
                var i1 = ind1 + 1;
                xmlhttp.onreadystatechange = go1;
                xmlhttp.open("get", "./generatequestionservlet?ind=" + i1, true);
                xmlhttp.send();
            }
            ////////////////////////////////////////////////////////////////////
            function go1()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("div1").innerHTML = xmlhttp.responseText;
                    //document.getElementById("s1").style.display = "none";
                }
            }
            function unselect(ind) {

                var newindex = ind;

                xmlhttp.onreadystatechange = function () {

                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("div1").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("get", "./unselectservlet?newindex=" + newindex, true);
                xmlhttp.send();
            }
            function go6(userans, ind) {
                var newindex = ind;
                document.getElementById("unselect").style.display = 'block';
                xmlhttp.onreadystatechange = function () {

                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("div1").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("get", "./resultservlet?newindex=" + newindex + "&useranswer=" + userans, true);
                xmlhttp.send();
            }
            function hideddd()
            {
                document.getElementById("q").style.display = 'none';
//                document.getElementById("teststart").style.visibility = 'visible';
                document.getElementById("the_one").style.display = 'none';
                document.getElementById("the_two").style.display = 'block';
                document.getElementById("the_three").style.display = 'block';
            }

            function playresult() {
                window.location.href = "testResult.jsp";
            }

            function start()
            {

                document.getElementById("z").style.visibility = 'visible';
                var elem = document.getElementById("myBar");
                var width = 1;
                var id = setInterval(frame, 30);
                function frame() {
                    if (width >= limit) {
                        limit = 0;
                        clearInterval(id);
                        playresult();
                    } else {
                        width++;
                        elem.style.width = width + '%';
                    }
                }
            }
        </script>


    </head>

    <body onload="showcourses()">
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

                <div class="navbar-header" style="padding-left: 200px;">
                    <!-- Logo -->
                    <div class="navbar-brand">
                        <center> <h1 id="alpha">ONLINE TEST</h1></center>
                    </div>
                </div>

                <!-- Navigation -->
                <nav id="nav">
                    <ul class="main-menu nav navbar-nav navbar-right">
                        <li id="the_one"><a href="onlineskilltest.jsp">Return</a></li>
                        <li id="the_two" style="display: none;"><button type="button" class="btn btn-link" onclick="exit()"><h4>Exit Test</h4></button></li>
                        <li id="the_three" style="display: none;"><button type="button" class="btn btn-link" onclick="submit()"><h4>Submit Test</h4></button></li>
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
            <!--            <div class="row">
                            <div class="page-header">
                                <center> <h1 id="alpha">ONLINE EXAM</h1></center>
                            </div>
                        </div>-->
            <div  class="row">
                <div class="col-sm-12">

                    <div id="q">

                        <div  class="form-group">
                            <label>Select Course</label><select class="form-control" id="cat" name="cat" onchange="setselectedcourse(this.value)">



                            </select>
                        </div>
                        <div  class="form-group">
                            <label>Select Section</label><select class="form-control" id="subcat" name="subcat" >



                            </select>
                        </div>
                        <br>
                        <button type="button" class="main-button btn-lg" onclick="setselectedsubject(subcat.value)"> START TEST </button>
                    </div>
                </div>
            </div>
            <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
            <!--            <div class="row" id="teststart" style="visibility: hidden;">
                            <div class="col-sm-12">
                                <div id="head">
                                    <div class="col-sm-2"><h3><button type="button" class="btn btn-link" onclick="exit()">EXIT TEST</button></h3></div>
                                    <div class="col-sm-8"></div>
                                    <div class="col-sm-2"><h3><button type="button" class="btn btn-link" onclick="submit()">SUBMIT TEST</button></h3></div>
                                </div>
                            </div>
                        </div>-->
            <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
            <div class="row">
                <div class="col-sm-1">
                </div>
                <div class="col-sm-10">
                    <label id="timer" class="t"></label><br>
                    <div id="div1" class="row">

                    </div>

                </div>
                <div class="col-sm-1">
                </div>
            </div>
            <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
            <div class="row">
                <div id="z" style="visibility: hidden; border-radius :0px 0px 20px 20px; background-color: yellow;">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-8">
                        <div id="myProgress" class="progress">
                            <div id="myBar" class="progress-bar progress-bar-info active"></div>
                        </div>
                    </div>

                </div>
            </div>
            <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        </div>
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
    </body>
</html>
