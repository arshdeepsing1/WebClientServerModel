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
        </style>


        <script>
            function adminLogin()
            {
                var Username = document.getElementById("Username").value;
                var Password = document.getElementById("Password").value;
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
                                window.location.href = "Welcome.jsp";
                            } else
                            {
                                alert('login failed');
//                            document.getElementById("l1").innerHTML = res;
                            }
                        }
                    };
                    xmlhttp.open("GET", "./LoginCheck?Username=" + Username + "&Password=" + Password, true);
                    xmlhttp.send();
                }
            }

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
                xmlhttp.open("GET", "./RecoveryPass?Username=" + Username, true);
                xmlhttp.send();

            }


        </script>
    </head>
    <body>
        <!-- Hero-area -->
        <div class="hero-area section">

            <!-- Backgound Image -->
            <div class="bg-image bg-parallax overlay" style="background-image:url(./img/Binary-01.jpg)"></div>
            <!-- /Backgound Image -->

            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        <!--                        <ul class="hero-area-tree">
                                                    <li><a href="index.html">Home</a></li>
                                                    <li>Blog</li>
                                                </ul>-->
                        <h1 class="white-text">Admin Login</h1>

                    </div>
                </div>
            </div>

        </div>
        <!-- /Hero-area -->
        <br><br>
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-7">
                    <!--                    <h3>Login Admin</h3>-->
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-md-3" for="t1">Enter Name</label>
                            <div class="col-md-9">
                                <input class="input" type="text" id="Username" placeholder="Enter name" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3" for="t2">Enter Password</label>
                            <div class="col-md-9">
                                <input class="input" type="password" id="Password" placeholder="Enter password" class="form-control" />
                            </div>
                        </div>

                        <input type="button" class="main-button icon-button pull-right" value="Login"  onclick="adminLogin()"/>
                        <br>
                        <a href="#" target="_blank" data-toggle="modal" data-target="#myModalCP" style="padding-left: 24px;">Forgot Password</a>


                    </form>

                </div>
            </div>
        </div>
        <!-- Modal -->
        <div id="myModalCP" class="modal fade" role="dialog" style="overflow-y :scroll;max-height: 85%;margin-top: 50px;margin-bottom: 50px;width: 100%;">
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
                                <label class="control-label col-sm-3" for="t1">ENTER USERNAME</label>
                                <div class="col-sm-9">
                                    <input class="input" type="text" id="UsernameForget" placeholder="Enter Username" class="form-control" />
                                </div>
                            </div>
                            <label id="a1"></label>

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
        <%@include file="zFooter.jsp" %>
    </body>
</html>
