<%-- 
    Document   : feedback
    Created on : May 9, 2018, 7:30:49 PM
    Author     : Dapinder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <title>Feedback</title>
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
            a.disabled {
                pointer-events: none;
            }
            html, body{
                padding-right: 0px !important; 
                position: relative!important;
            }
        </style>
        <script>
            var n = 0;
//            var x=document.getElementById("d").;
//            alert(x);
            function save()
            {
                var x = document.getElementById("d").value;
                var okay1 = document.getElementById("comment").value;
                if (x === "") {
                    alert("Please give a rating to the test !");
                } else if (okay1 === "") {
                    alert("Please add a comment below !");
                } else {
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
                            formdata.append(controls[i].name, controls[i].value);
                        }
                    }

                    if (flag == 1)
                    {
                        alert("CHECK: --> Give name attribute to all controls in form");
                    } else if (flag == 2)
                    {
                        alert("CHECK: --> Select Files for file controls");
                    } else
                    {
                        // alert(ans);
                        // alert(formdata);

                        var xhr = new XMLHttpRequest();

                        xhr.open("POST", "./addfeedback", true);
                        //for response receiving
                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState === 4 && xhr.status == 200)
                            {
                                var res = xhr.responseText.trim();
                                if (res == 'success')
                                {
                                    alert('FEEDBACK ADDED SUCCESSFULLY !!\n\Re-directing to dashboard.');
                                    //document.getElementById("Courseid").value = "";
                                    window.location.href = "userdashboard.jsp";
                                } else
                                {
                                    alert('FEEDBACK NOT ADDED');
                                    window.location.href = "userdashboard.jsp";
                                }

                            }
                        };

                        xhr.send(formdata);
                    }
                }
            }
            function check1(n)
            {
                for (var a = 10; a > 5 + n; a--)
                {
                    var b = (a).toString();
                    document.getElementById("" + b + "").style.display = 'none';

                }

                for (var i = 5; i > n; i--)
                {
                    var c = (i).toString();
                    document.getElementById("" + c + "").style.display = 'inline';

                }
                document.getElementById("d").value = n;


            }
            function check(n)
            {
                for (var a = 6; a <= 5 + n; a++)
                {
                    var b = (a).toString();
                    document.getElementById("" + b + "").style.display = 'inline';

                }

                for (var i = 1; i <= n; i++)
                {
                    var c = (i).toString();
                    document.getElementById("" + c + "").style.display = 'none';

                }
                document.getElementById("d").value = n;
            }
        </script>
    </head>
    <body>
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

                <div class="navbar-header" style="padding-left: 233px;">
                    <!-- Logo -->
                    <div class="navbar-brand">
                        <center> <h1 id="alpha">Feedback</h1></center>
                    </div>
                </div>

                <!-- Navigation -->
                <nav id="nav">
                    <ul class="main-menu nav navbar-nav navbar-right">
                        <li><a href="onlineskilltest.jsp">Home</a></li>
                        <li><a href="userlogout.jsp" onClick="return confirm('Are you sure you want to logout?')" >Logout</a></li>
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
            <center><h3>Test Feedback</h3></center>
            <form class="form-horizontal" id="form1" name="form1">
                <br>
                <div class="form-group" >
                    <label class="control-label col-sm-3" >Rating</label>
                    <input type="text" id="d" name="d" style="display:none"/>
                    <div class="col-sm-9" >
                        <span id="1" class="fa fa-star fa-3x" onclick='check(1)'></span>
                        <span id="6" style="display:none" class="fa fa-star checked fa-3x" onclick='check1(1)'></span>
                        <span id="2" class="fa fa-star fa-3x" onclick='check(2)'></span>
                        <span id="7" style="display:none" class="fa fa-star checked fa-3x" onclick='check1(2)'></span>
                        <span id="3" class="fa fa-star fa-3x" onclick='check(3)'></span>
                        <span id="8" style="display:none" class="fa fa-star checked fa-3x" onclick='check1(3)'></span>
                        <span id="4" class="fa fa-star fa-3x" onclick='check(4)'></span>
                        <span id="9" style="display:none" class="fa fa-star checked fa-3x" onclick='check1(4)'></span>
                        <span id="5" class="fa fa-star fa-3x" onclick='check(5)'></span>
                        <span id="10" style="display:none" class="fa fa-star checked fa-3x" onclick='check1(5)'></span>
                    </div>               
                </div>
                <br>
                <div class="form-group" >
                    <label class="control-label col-sm-3" >Comment</label>
                    <div class="col-sm-6">
                        <textarea rows="5" cols="5" id="comment" name="comment" class="form-control" placeholder="Please leave a comment.."></textarea>
                    </div>
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-12"><label id="d1"></label></div>

                </div>
                <br>
                <div class="form-group" >
                    <label class="control-label col-sm-3" ></label>
                    <div class="col-sm-9">
                        <input type="button" class="main-button icon-button" id="savefeedback" name="savefeedback" value="Save Feed Back"  onclick="save()"/>
                    </div>


                </div>
            </form>
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
