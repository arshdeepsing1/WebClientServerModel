<%-- 
    Document   : Welcome
    Created on : 8 Apr, 2018, 5:00:57 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
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
            .notify-badge{
                position: absolute;
                right:22px;
                top:67px;
                background:red;
                text-align: center;
                border-radius: 40px 40px 40px 40px;
                color:white;
                padding:5px 10px;
                font-size:10px;
            }
        </style>

        <script>
            $(document).ready(function () {

                $("#tree1").click(function () {
                    $("#myModalCP").modal({backdrop: false});
                });

            });
            function go()
            {

                var opass = document.getElementById("opass").value;
                var npass = document.getElementById("npass").value;
                var cpass = document.getElementById("cpass").value;
                if (opass === "") {
                    alert("enter old password");
                } else if (npass === "") {
                    alert("enter new password");
                } else if (cpass === "") {
                    alert("enter confirm new password");
                } else if ((npass + "").length <= 4) {
                    alert("minimum password length should be 5 characters");
                } else if (cpass !== npass) {
                    alert("new password and confirm new password do not match");
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {

                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            if (res === "success")
                            {
                                alert('password changed successfully');
                                $("#themodal").trigger('reset');
                                $("#myModalCP").modal('hide');
                            } else if (res === "failed")
                            {
                                alert('password not changed');
                                $("#themodal").trigger('reset');
                                $("#myModalCP").modal('hide');
                            }

                        }
                    };
                    xmlhttp.open("POST", "./changepass?opass=" + opass + "&npass=" + npass + "&cpass=" + cpass, true);
                    xmlhttp.send();


                }
            }
            function fetchcourse()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText.trim();
                        document.getElementById("res").innerHTML = res;
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

            function fetchsection()
            {
                var Courseid = document.getElementById("Courseid").value;


                if (Courseid == '-1')
                {
                    alert('Please select valid department');
                } else
                {
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText.trim();
                            document.getElementById("l2").innerHTML = res;

                            var mainjson = JSON.parse(res);
                            var jsa = mainjson["ans"];

                            var ans = "";

                            ans += "<option value='-1'>--Select--</option>";
                            for (var i = 0; i < jsa.length; i++)
                            {
                                var js = jsa[i];
                                ans += "<option value='" + js["Sectionid"] + "'  >" + js["sname"] + "</option>";
                            }


                            document.getElementById("section").innerHTML = ans;



                        }
                    };
                    xml.open("GET", "./fetchsection?Courseid=" + Courseid, true);
                    xml.send();



                }



            }
            function notification() {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText.trim();
                        if (res === "0") {

                        } else {
                            document.getElementById("tree").style.visibility = 'visible';
                            document.getElementById("tree").innerHTML = "<b>" + res + "</b>";
                        }

                    }
                };
                xml.open("GET", "./fetchnewnotify", true);
                xml.send();
            }
        </script>

    </head>
    <body onload="notification()">
        <%
            String Username = session.getAttribute("Username").toString();

        %>

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
                        <li><a href="manage_feedback.jsp">User Feedbacks</a></li>
                        <li><a href="logoutAdmin.jsp" onClick="return confirm('Are you sure you want to logout?')" >Logout</a></li>
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
            <div class="bg-image bg-parallax overlay" style="background-image:url(./img/cta2-background.jpg)"></div>
            <!-- /Backgound Image -->

            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        <ul class="hero-area-tree">
                            <li><a href="Welcome.jsp">Home</a></li>
                        </ul>
                        <h1 class="white-text">Welcome <%= Username%></h1><br>
                        <!--                        <h4 class="white-text">Administrator Logged In</h4>-->
                    </div>
                </div>
            </div>

        </div>
        <!-- /Hero-area -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <br>
        <div class="container">
            <div class="row">
                <div id="main" class="col-md-9">
                    <div class="row">
                        <!-- single blog -->
                        <div class="col-md-6">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="manage_course.jsp">
                                        <img src="./img/HardDisk.jpg" alt="" style="height: 200px;" />
                                    </a>
                                </div>
                                <h3><a href="manage_course.jsp">MANAGE COURSES</a></h3>
                            </div>
                        </div>
                        <!-- /single blog -->
                        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
                        <!-- single blog -->
                        <div class="col-md-6">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="manage_section.jsp">
                                        <img src="./img/HardDisk.jpg" alt="" style="height: 200px;" />
                                    </a>
                                </div>
                                <h3><a href="manage_section.jsp">MANAGE SECTIONS</a></h3>
                            </div>
                        </div>
                        <!-- /single blog -->
                        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
                        <!-- single blog -->
                        <div class="col-md-6">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="manage_questions.jsp">
                                        <img src="./img/HardDisk.jpg" alt="" style="height: 200px;" />
                                    </a>
                                </div>
                                <h3><a href="manage_questions.jsp">MANAGE QUESTIONS</a></h3>
                            </div>
                        </div>
                        <!-- /single blog -->
                        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
                        <!-- single blog -->
                        <div class="col-md-6">
                            <div class="single-blog">
                                <div class="blog-img">
                                    <a href="manage_papers.jsp">
                                        <img src="./img/HardDisk.jpg" alt="" style="height: 200px;" />
                                    </a>
                                </div>
                                <h3><a href="manage_papers.jsp">MANAGE PAPERS</a></h3>
                            </div>
                        </div>
                        <!-- /single blog -->
                    </div>
                </div>
                <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
                <div id="aside" class="col-md-3">
                    <!-- category widget -->
                    <button type="button" class="main-button icon-button pull-right" id="tree1">Change Password</button>
                    <br><br><br>
                    <!-- /category widget -->
                    <!-- single posts -->
                    <div class="single-post" style="padding-left: 54px;">
                        <center><h4><a href="userQuery.jsp">User Notifications<span class="notify-badge" id="tree" style="visibility: hidden;"></span></a></h4></center>
                    </div>
                    <!-- /single posts -->
                </div>
            </div>
        </div>
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- Modal -->
        <div id="myModalCP" class="modal fade" role="dialog" style="overflow-y :scroll;max-height: 85%;margin-top: 50px;margin-bottom: 50px;width: 100%;">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Change Password</h4>
                    </div>
                    <div class="modal-body">


                        <form class="form-horizontal" id="themodal">
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="t1">OLD PASSWORD</label>
                                <div class="col-sm-9">
                                    <input class="input" type="text" id="opass" placeholder="Enter name" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="t1">NEW PASSWORD</label>
                                <div class="col-sm-9">
                                    <input class="input" type="text" id="npass" placeholder="Enter name" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="t2">CONFIRM PASSWORD</label>
                                <div class="col-sm-9">
                                    <input class="input" type="text" id="cpass" placeholder="Enter password" class="form-control" />
                                </div>
                            </div>

                            <input type="button" class="main-button icon-button pull-right" value="Change"  onclick="go()"/>
                            <br><br>
                        </form>


                    </div>
                    <div class="modal-footer">
                        <button id="okayOne" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>

        </div>
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
