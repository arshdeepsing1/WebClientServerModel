<%-- 
    Document   : contact
    Created on : May 23, 2018, 6:47:09 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
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
            function sendmessage() {
                var one = document.getElementById("_one").value;
                var two = document.getElementById("_two").value;
                var three = document.getElementById("_three").value;
                var four = document.getElementById("_four").value;
                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;

                // alert("found " + controls.length + " controls in form");

                var flag = 0;
                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }

                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length != 0)
                        {
                            ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    } else    // for other input types  text,password,select
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        //formdata.append("rn",document.getElementById("rn").value);
                        //formdata.append(firstfile.name,firstfile);

                        formdata.append(controls[i].name, controls[i].value);
                    }
//                    alert(ans);
//                    alert(flag);
                }

                if (one === "") {
                    alert('Please add your name');
                } else if (two === "") {
                    alert('please add your email to get reply');
                } else if (three === "") {
                    alert('please add a subject to your query');
                } else if (four === "") {
                    alert('please enter your message');
                } else if (flag === 1)
                {
                    alert("Give name attribute to all controls in form");
                } else if (flag === 2)
                {
                    alert("Select icon file");
                } else
                {
                    //alert(ans);
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "./addcontact?_one=" + one + "&_two=" + two + "&_three=" + three + "&_four=" + four, true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                            document.getElementById("form1").reset();
                        }
                    };
                    xhr.send(formdata);
                }
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
                        <li><a href="start.jsp">Start Page</a></li>
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
                            <li><a href="start.jsp">Home</a></li>
                            <li>Contact</li>
                        </ul>
                        <h1 class="white-text">Get In Touch</h1>

                    </div>
                </div>
            </div>

        </div>
        <br>
        <!-- /Hero-area -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <!-- container -->
        <div class="container">
            <div class="row">
                <div  class="col-md-6 col-md-offset-3" style="border: solid 2px black; border-radius: 5px; padding: 10px">

                    <form id="form1" action="#" method="POST" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="control-label col-md-3" >User Name</label>
                            <div class="col-md-9">
                                <input type="text" name="_one" id="_one" class="input form-control" />
                                <br>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-md-3">User Email</label>
                            <div class="col-md-9">
                                <input type="text" name="_two" id="_two" class="input form-control" />
                                <br>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-md-3">Subject</label>
                            <div class="col-md-9">
                                <input type="text" name="_three" id="_three" class="input form-control" />
                                <br>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-md-3">Message</label>
                            <div class="col-md-9">
                                <textarea  rows="5" cols="5" name="_four" id="_four"  class="input form-control"></textarea>
                                <br>
                            </div>
                        </div>
                        
                    </form>

                    <center><input type="button"  value="Send Message" class="main-button icon-button" onclick="sendmessage()" /></center>

                </div>
            </div>
        </div>
        <!-- /container -->
        <%@include file="zFooter.jsp" %>
    </body>
</html>
