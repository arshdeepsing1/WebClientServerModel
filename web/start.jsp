<%-- 
    Document   : start
    Created on : May 19, 2018, 6:17:10 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AceInterviewTest</title>
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
            .modal-backdrop
            {
                opacity:0.4 !important;
            }
        </style>

        <script>

            function forgetPassword() {

                var Username = document.getElementById("UsernameForget").value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        alert(res);
                    }
                };
                xmlhttp.open("GET", "./UserRecoveryPass?Username=" + Username, true);
                xmlhttp.send();

            }
            function userLogin()
            {
                var Username = document.getElementById("Username1").value;
                var Password = document.getElementById("Password1").value;
                if (Username == "" && !Password == "")
                {
                    alert('enter username');
                } else if (!Username == "" && Password == "")
                {
                    alert('enter password');
                } else if (Username == "" && Password == "") {
                    alert('Please enter username and password');
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            if (res === "success")
                            {
                                alert('Login successfull');
                                window.location.href = "userdashboard.jsp";
                            } else
                            {
                                alert('login failed');
//                            document.getElementById("l1").innerHTML = res;
                            }
                        }
                    };
                    xmlhttp.open("GET", "./UserLoginCheck?Username=" + Username + "&Password=" + Password, true);
                    xmlhttp.send();
                }
            }

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
                            ans += "<div class='col-md-3 col-md-offset-1'>";
                            ans += "<div class='course'>";
                            ans += "<a href='#' class='course-img disabled'>";
                            ans += "<img src='" + js["icon"] + "' alt='' style='width: 120px;height: 100px;border: 2px solid #FF6700;border-radius: 10px;'>";
                            ans += "<i class='course-link-icon fa fa-link'></i>";
                            ans += "</a>";
                            ans += "<a class='course-title disabled' href='#'><b>" + js["cname"] + "</b></a>";
                            ans += "</div>";
                            ans += "</div>";
                        }
                        document.getElementById("cloud").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchcourse", true);
                xml.send();
            }
        </script>
    </head>
    <body onload="fetchcourse()">
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- Header -->
        <header id="header" class="transparent-nav">
            <div class="container">

                <div class="navbar-header">
                    <!-- Logo -->
                    <!-- <div class="navbar-brand"> -->
                    <a class="logo disabled" href="start.jsp" style="padding-top: 2px;">
                        <label><h2 style="color: #FF6700;"><b>Ace</b></h2></label><label><h2 style="color: white;"><b>InterviewTest</b></h2></label>
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

                <!-- Navigation -->
                <nav id="nav">
                    <ul class="main-menu nav navbar-nav navbar-right">
                        <li><a href="start.jsp">Home</a></li>
                        <li><a href="signup.jsp">Sign Up</a></li>
                        <!--                        <li><a href="contact.html">Contact</a></li>-->
                    </ul>
                </nav>
                <!-- /Navigation -->
            </div>
        </header>
        <!-- /Header -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- Home -->
        <div id="home" class="hero-area">

            <!-- Backgound Image -->
            <div class="bg-image bg-parallax overlay" style="background-image:url(./img/copy.png)"></div>
            <!-- /Backgound Image -->

            <div class="home-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8" style="height: 300px;">
                            <h1 class="white-text">Ace Your Interview Test</h1>
                            <p class="lead white-text">A Platform For Interview Preparation</p>
                            <button data-toggle="modal" data-target="#myModalLOGIN" class="main-button">LOGIN</button>
                            <button data-toggle="modal" data-target="#myModal" class="btn-link" style="color: whitesmoke"tyle>Forgot Password?</button>
                        </div>

                        <div class="col-sm-4" id="thegreatLOG" style="display: none;background-color: white;border-radius: 10px;">
                            <!--                            <form class="form-horizontal">
                                                            <h2>User Login</h2>
                                                            <br>
                                                            <div class="form-group">
                                                                <label class="control-label col-sm-3" for="t1">Enter Username</label>
                                                                <div class="col-sm-9">
                                                                    <input class="input" type="text" id="Username1" placeholder="Enter user name" class="form-control" />
                                                                </div>
                                                            </div>
                            
                                                            <div class="form-group">
                                                                <label class="control-label col-sm-3" for="t2">Enter Password</label>
                                                                <div class="col-sm-9">
                                                                    <input class="input" type="password" id="Password1" placeholder="Enter user password" class="form-control" />
                                                                </div>
                                                            </div>
                            
                                                            <input type="button" class="main-button icon-button pull-right" value="Login"  onclick="userLogin()"/>
                                                            <br>
                                                            <label onclick="md6()">Forgot Password</label>
                                                            <br>
                                                            <div class="form-group">
                                                            </div>
                                                        </form>-->
                        </div>

                        <div class="col-sm-4" id="thegreatLOGone" style="display: none;background-color: white;border-radius: 10px;">

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- /Home -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- Modal -->
        <div id="myModalLOGIN" class="modal fade" role="dialog" style="overflow-y :scroll;max-height: 85%;margin-top: 50px;margin-bottom: 50px;width: 100%;">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">User Login</h4>
                    </div>
                    <div class="modal-body">

                        <form class="form-horizontal">

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="t1">Enter Username</label>
                                <div class="col-sm-9">
                                    <input class="input" type="text" id="Username1" placeholder="Enter user name" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="t2">Enter Password</label>
                                <div class="col-sm-9">
                                    <input class="input" type="password" id="Password1" placeholder="Enter user password" class="form-control" />
                                </div>
                            </div>

                            <input type="button" class="main-button icon-button pull-right" value="Login"  onclick="userLogin()"/>
                            <br><br>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- Modal -->
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog" style="overflow-y :scroll;max-height: 85%;margin-top: 50px;margin-bottom: 50px;width: 100%;">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Forgot Password</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-3" for="t3">Enter Username</label>
                                <div class="col-sm-9">
                                    <input class='input' type="text" id="UsernameForget" placeholder="Enter Username" class="form-control" />
                                </div>
                            </div>

                            <input type="button" class="main-button icon-button pull-right" value="Submit"  onclick="forgetPassword()"/>
                            <br><br>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- About -->
        <div id="about" class="section">

            <!-- container -->
            <div class="container">

                <!-- row -->
                <div class="row">

                    <div class="col-md-6">
                        <div class="section-header">
                            <h2>Welcome to AceInterviewTest</h2>
                            <p class="lead">A Platform For Interview Preparation</p>
                        </div>

                        <!-- feature -->
                        <div class="feature">
                            <i class="feature-icon fa fa-laptop"></i>
                            <div class="feature-content">
                                <h4>Give Online Tests</h4>
                                <p>Choose among courses and their sections to practice. Give full course wise and section wise test.</p>
                            </div>
                        </div>
                        <!-- /feature -->

                        <!-- feature -->
                        <div class="feature">
                            <i class="feature-icon fa fa-clock-o"></i>
                            <div class="feature-content">
                                <h4>Timing Based Tests</h4>
                                <p>Improve your efficiency for giving timing interview tests of software companies.</p>
                            </div>
                        </div>
                        <!-- /feature -->

                        <!-- feature -->
                        <div class="feature">
                            <i class="feature-icon fa fa-bookmark"></i>
                            <div class="feature-content">
                                <h4>Review Test Performance </h4>
                                <p>Get complete performance analysis of each and every test.</p>
                            </div>
                        </div>
                        <!-- /feature -->

                    </div>

                    <div class="col-md-6">
                        <div class="about-img">
                            <img src="./img/course04.jpg" alt="">
                        </div>
                    </div>

                </div>
                <!-- row -->

            </div>
            <!-- container -->
        </div>
        <!-- /About -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- Courses -->
        <div id="courses" class="section">

            <!-- container -->
            <div class="container">

                <!-- row -->
                <div class="row">
                    <div class="section-header text-center">
                        <h3>our courses</h3>
                        <p class="lead"></p>
                    </div>
                </div>
                <!-- /row -->

                <!-- courses -->
                <div id="courses-wrapper">

                    <!-- row -->
                    <div class="row" id="cloud">

                    </div>
                    <!-- /row -->

                </div>
                <!-- /courses -->

            </div>
            <!-- container -->

        </div>
        <!-- /Courses -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- Why us -->
        <div id="why-us" class="section">

            <!-- container -->
            <div class="container">

                <!-- row -->
                <div class="row">
                    <div class="section-header text-center">
                        <h2>Why AceInterviewTest</h2>
                        <p class="lead">Because AceInterviewTest is developed with aim to improve efficiency of students in interview tests of software companies.</p>
                    </div>

                    <!-- feature -->
                    <div class="col-md-4">
                        <div class="feature">
                            <i class="feature-icon fa fa-laptop"></i>
                            <div class="feature-content">
                                <h4>Give Online Tests</h4>
                                <p>Choose among courses and their sections to practice. Give full course wise and section wise test.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /feature -->

                    <!-- feature -->
                    <div class="col-md-4">
                        <div class="feature">
                            <i class="feature-icon fa fa-clock-o"></i>
                            <div class="feature-content">
                                <h4>Timing Based Tests</h4>
                                <p>Improve your efficiency for giving timing interview tests of software companies.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /feature -->

                    <!-- feature -->
                    <div class="col-md-4">
                        <div class="feature">
                            <i class="feature-icon fa fa-bookmark"></i>
                            <div class="feature-content">
                                <h4>Review Test Performance </h4>
                                <p>Get complete performance analysis of each and every test.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /feature -->

                </div>
                <!-- /row -->

            </div>
            <!-- /container -->

        </div>
        <!-- /Why us -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- Contact CTA -->
        <div id="contact-cta" class="section">

            <!-- Backgound Image -->
            <div class="bg-image bg-parallax overlay" style="background-image:url(./img/speed.jpg)"></div>
            <!-- Backgound Image -->

            <!-- container -->
            <div class="container">

                <!-- row -->
                <div class="row">

                    <div class="col-md-8 col-md-offset-2 text-center">
                        <h2 class="white-text">Have A Question ?</h2>
                        <!--                        <p class="lead white-text">Libris vivendo eloquentiam ex ius, nec id splendide abhorreant.</p>-->
                        <a class="main-button icon-button" href="contact2.jsp">Contact Us Now</a>
                    </div>

                </div>
                <!-- /row -->

            </div>
            <!-- /container -->

        </div>
        <!-- /Contact CTA -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
