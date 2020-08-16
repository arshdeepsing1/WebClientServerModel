<%-- 
    Document   : signup
    Created on : May 20, 2018, 11:09:11 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
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
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });
            ///////////////////////////////////////////////////////////////////////////////////////////////////
            function validate() {
//                if (!/^[a-zA-Z]*$/g.test(document.form1.fullname.value)) {
//                    //alert("Invalid characters");
//                    //document.form1.name.focus();
//                    return false;
//                } else {
//                    return true;
//                }
                var str = document.getElementById("fullname").value;
                var len = str.length;
                var flag = 1;
                var i = 0;
                for (i = 0; i < len; i++) {
                    var x = str.charCodeAt(i);
                    if ((x >= 65 && x <= 90) || (x >= 97 && x <= 122) || (x === 32)) {
                        flag = 1;
                    } else {
                        flag = 2;
                        //alert("yes");
                        break;
                    }
                }
                if (flag == 1) {
                    return true;
                } else {
                    return false;
                }
            }
            function phone_number(phn) {
                //TextBox left blank.
                if (phn.length == 0) {
                    return true;
                }
                var passed = 0;
                if (!/^[0-9]*$/g.test(document.form1.phone.value)) {
                    //alert("Invalid characters");
                    //document.form1.name.focus();
                    passed = 0;
                } else {
                    passed = 1;
                }

                //Validate for length of Password.
                if (passed === 1 && phn.length === 10) {
                    passed++;
                }

                //Display status.
                var color = "";
                var strength = "";
                switch (passed) {
                    case 0:
                        strength = "Weak";
                        color = "red";
                        break;
                    case 1:
                        strength = "Weak";
                        color = "red";
                        break;
                    case 2:
                        strength = "Good";
                        color = "darkorange";
                        break;
                }
                if (strength != "Good") {
                    return true;
                } else {
                    return false;
                }
            }
            function CPS(password) {
                //TextBox left blank.
                if (password.length === 0 || password.length <= 7) {
                    alert("minimum length should be eight characters");
                    return true;
                }
                //Regular Expressions.
                var regex = new Array();
                regex.push("[A-Z]"); //Uppercase Alphabet.
                regex.push("[a-z]"); //Lowercase Alphabet.
                regex.push("[0-9]"); //Digit.
                regex.push("[$@$!%*#?&]"); //Special Character.
                var passed = 0;
                //Validate for each Regular Expression.
                for (var i = 0; i < regex.length; i++) {
                    if (new RegExp(regex[i]).test(password)) {
                        passed++;
                    }
                }
                //Validate for length of Password.
                if (passed > 2 && password.length > 7) {
                    passed++;
                }
                //Display status.
                var color = "";
                var strength = "";
                switch (passed) {
                    case 0:
                    case 1:
                        strength = "Weak";
                        color = "red";
                        break;
                    case 2:
                        strength = "Good";
                        color = "darkorange";
                        break;
                    case 3:
                        strength = "Good";
                        color = "darkorange";
                        break;
                    case 4:
                        strength = "Strong";
                        color = "green";
                        break;
                    case 5:
                        strength = "Very Strong";
                        color = "darkgreen";
                        break;
                }
                if (color === "red" || color === "darkorange") {
                    return true;
                } else {
                    return false;
                }
            }
            function CheckPasswordStrength(password) {
                var club2 = document.getElementById("club2");

                //TextBox left blank.
                if (password.length == 0) {
                    club2.innerHTML = "";
                    return;
                }

                //Regular Expressions.
                var regex = new Array();
                regex.push("[A-Z]"); //Uppercase Alphabet.
                regex.push("[a-z]"); //Lowercase Alphabet.
                regex.push("[0-9]"); //Digit.
                regex.push("[$@$!%*#?&]"); //Special Character.

                var passed = 0;

                //Validate for each Regular Expression.
                for (var i = 0; i < regex.length; i++) {
                    if (new RegExp(regex[i]).test(password)) {
                        passed++;
                    }
                }

                //Validate for length of Password.
                if (passed > 2 && password.length > 8) {
                    passed++;
                }

                //Display status.
                var color = "";
                var strength = "";
                switch (passed) {
                    case 0:
                    case 1:
                        strength = "Weak";
                        color = "red";
                        break;
                    case 2:
                        strength = "Good";
                        color = "darkorange";
                        break;
                    case 3:
                    case 4:
                        strength = "Strong";
                        color = "green";
                        break;
                    case 5:
                        strength = "Very Strong";
                        color = "darkgreen";
                        break;
                }
                club2.innerHTML = strength;
                club2.style.color = color;
            }
            function okay() {
                document.getElementById("d1").innerHTML = "";
                document.getElementById("d2").innerHTML = "";
                document.getElementById("club2").innerHTML = "";
                document.getElementById("d3").innerHTML = "";
            }
            function clear1() {
                document.getElementById("d2").innerHTML = "";
                document.getElementById("club2").innerHTML = "";
                document.getElementById("d3").innerHTML = "";
            }
            function clear2() {
                document.getElementById("club2").innerHTML = "";
                document.getElementById("d3").innerHTML = "";
            }
            function clear3() {
                document.getElementById("d3").innerHTML = "";
            }
            function clear4() {
                document.getElementById("club2").innerHTML = "";
            }

            function go(value)
            {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        if (res === "yes")
                        {
                            document.getElementById("d1").innerHTML = "Username Already Exists!";
                        } else {
                            document.getElementById("d1").innerHTML = "";
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchusername_fromDB?value=" + value, true);
                xmlhttp.send();


            }
            function go1()
            {
                var three = document.getElementById("emailR").value;
                var y = "signup";
                var flag = 0;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        if (res === "yes")
                        {
                            //alert(res);
                            flag = 1;
                            signup(flag);
                        } else {
                            flag = 2;
                            signup(flag);
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchusername?three=" + three + "&y=" + y, true);
                xmlhttp.send();
            }
            function checkemail(value)
            {
                if (document.getElementById("email").value != document.getElementById("emailR").value)
                {
                    document.getElementById("d2").innerHTML = "Emails do not match!";
                } else {
                    document.getElementById("d2").innerHTML = "";
                }
            }
            function checkpassword(value)
            {
                if (document.getElementById("password").value != document.getElementById("passwordR").value)
                {
                    document.getElementById("d3").innerHTML = "Passwords do not match!";
                } else {
                    document.getElementById("d3").innerHTML = "";
                }
            }
            function validateEmail($email) {
                var emailReg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return emailReg.test($email);
            }
            function emailtest(value) {
                if (!validateEmail(value)) { /* do stuff here */
                    //document.getElementById("test").innerHTML = "<center>Email should be of the form :xxx@xxx.com</center>";
                    //alert("Email should be of the form :xxx@xxx.com !!");
                    return true;
                } else {
                    //document.getElementById("test").innerHTML = "";
                    return false;
                }
            }
            ///////////////////////////////////////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////////////////////////////////
            function signup(index)
            {
                var ans = index;
                var one = document.getElementById("fullname").value;
                var two = document.getElementById("email").value;
                var three = document.getElementById("emailR").value;
                var four = document.getElementById("password").value;
                var five = document.getElementById("passwordR").value;
                var six = document.getElementById("phone").value;
                if (one == "") {
                    alert("please enter your full name");
                } else if (two == "") {
                    alert("please enter your email");
                } else if (three == "") {
                    alert("please re-enter your email");
                } else if (four == "") {
                    alert("please enter your password");
                } else if (five == "") {
                    alert("please re-enter your password");
                } else if (six == "") {
                    alert("please enter your phone number");
                } else if (two != three) {
                    alert("emails do not match !!");
                } else if (four != five) {
                    alert("passwords do not match !!");
                } else if (!validate()) {
                    alert("Full name should contain only alphabets !!");
                } else if (ans == 1) {
                    alert("Username (email) already taken");
                } else if (emailtest(two)) {
                    alert("Email should be of the form :xxx@xxx.com !!");
                } else if (CPS(four)) {
                    alert("Please choose a strong password with correct format !!");
                } else if (phone_number(six)) {
                    alert("invalid phone number !!");
                } else {
                    var ans = "";
                    var formdata = new FormData();
                    var controls = document.getElementById("form1").elements;
                    var flag = 0;
                    for (var i = 0; i < controls.length; i++)
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        formdata.append(controls[i].name, controls[i].value);
                    }


                    //alert(ans);
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "./adduser", true);
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == 'success')
                            {
                                alert('Sign-up Successfully !!');
                                alert('Kindly login with your email as username !!')
                                window.location.href = "start.jsp";
                            } else
                            {
                                alert('Sign-up failed');
                            }

                        }
                    };
                    xhr.send(formdata);

                }
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
                            <li>Sign-up</li>
                        </ul>
                        <h1 class="white-text">Sign-up Page</h1>

                    </div>
                </div>
            </div>

        </div>
        <!-- /Hero-area -->

        <!-- Sign-up -->
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">

                    <form class="form-horizontal" id="form1" name="form1">
                        <br>
                        <h2>User Sign-up</h2>
                        <br>
                        <div class="form-group" >
                            <label class="control-label col-sm-3" >Enter Full Name</label>
                            <div class="col-sm-9">
                                <input class="input" type="text" name="fullname" id="fullname" class="form-control" placeholder="Enter Full Name" onfocus="okay()"/>
                            </div>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9"><label id="club1"></label></div>
                        </div>

                        <div class="form-group" >
                            <label class="control-label col-sm-3" >Enter Email<br><h6>Default Username</h6></label>
                            <div class="col-sm-9" >
                                <input class="input" title="Note :" data-content="Email should be of the form :xxx@xxx.com" data-toggle="popover" data-trigger="focus" type="email" name="email" id="email" class="form-control" placeholder="Enter email" onkeyup="go(this.value)" onkeydown="go(this.value)" onfocus="clear1()"/>
                            </div>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9"><label id="d1"></label></div>
                        </div>


                        <div class="form-group" >
                            <label class="control-label col-sm-3" >Re-Enter Email</label>
                            <div class="col-sm-9">
                                <input class="input" type="email" name="emailR" id="emailR" class="form-control" placeholder="Re-Enter email" onkeyup="checkemail(this.value)" onkeydown="checkemail(this.value)" onfocus="checkemail(this.value)"/>
                            </div>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9"><label id="d2"></label></div>
                        </div>

                        <div class="form-group" >
                            <label class="control-label col-sm-3" >Enter Password</label>
                            <div class="col-sm-9">
                                <input class="input" title="Note :" data-content="minimum length must be 9 digits comprising upper, lower case alphabets [a-z] [A-Z], digits [0-9], special charaters {  $@!%*#?&  } only !!" data-toggle="popover" data-trigger="focus" data-placement="top" type="password" name="password" id="password" class="form-control" placeholder="Enter Password" onkeyup="CheckPasswordStrength(this.value)" onfocus="clear3()"/>
                            </div>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9"><label id="club2"></label></div>
                        </div>

                        <div class="form-group" >
                            <label class="control-label col-sm-3" >Re-Enter Password</label>
                            <div class="col-sm-9">
                                <input class="input" type="password" name="passwordR" id="passwordR" class="form-control" placeholder="Re-Enter Password" onkeyup="checkpassword(this.value)" onkeydown="checkpassword(this.value)" onfocus="clear4(), checkpassword(this.value)"/>
                            </div>
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9"><label id="d3"></label></div>
                        </div>

                        <div class="form-group" >
                            <label class="control-label col-sm-3" >Enter Phone Number</label>
                            <div class="col-sm-1"><center><b>+91</b></center></div>
                            <div class="col-sm-8">
                                <input class="input" type="text" name="phone" id="phone" class="form-control" />
                            </div>
                        </div>

                        <input type="button" class="main-button icon-button pull-right"  value="Sign-Up"  onclick="go1()"/>

                    </form>

                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
        <!-- /Sign-up -->
        <%@include file="zFooter.jsp" %>
    </body>
</html>
