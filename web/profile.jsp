<%-- 
    Document   : profile
    Created on : May 10, 2018, 1:44:29 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
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
            function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];

                var reader = new FileReader();

                //alert("File name: " + firstfile.name);
                //alert("File size: " + firstfile.size);

                reader.onload = (function (f)
                {
                    return function read12(e)
                    {
                        document.getElementById(imageid).src = e.target.result;
                    };
                })(firstfile);


                reader.readAsDataURL(firstfile);
            }
            function fetchprofile() {
                document.getElementById("view").style.display = 'block';
                document.getElementById("edit").style.display = 'none';
                document.getElementById("choose").style.display = 'none';
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        //console.log(res);
                        var ans1 = "";
                        var ans2 = "";
                        var ans3 = "";
                        var ans4 = "";
                        var ans5;
                        for (var i = 0; i < jsa.length; i++) {
                            var js = jsa[i];
                            ans1 += "<b>" + js["Fullname"];
                            +"</b>";
                            ans2 += "<b>" + js["Email"];
                            +"</b>";
                            ans3 += "<b>" + js["Username"];
                            +"</b>";
                            ans4 += "<b>" + js["Userphone"];
                            +"</b>";
                            ans5 = js["Userphoto"];
                        }
                        document.getElementById("fullname").innerHTML = ans1;
                        document.getElementById("email").innerHTML = ans2;
                        document.getElementById("username").innerHTML = ans3;
                        document.getElementById("phone").innerHTML = ans4;
                        document.getElementById("quesImage1").src = ans5;
                    }
                };
                xmlhttp.open("GET", "./fetchprofile", true);
                xmlhttp.send();
            }
            function view_profile() {
                document.getElementById("view").style.display = 'block';
                document.getElementById("edit").style.display = 'none';
                document.getElementById("choose").style.display = 'none';
                document.getElementById("formEDIT").reset();
                okay();
            }
            var q;
            function edit_profile() {
                document.getElementById("view").style.display = 'none';
                document.getElementById("edit").style.display = 'block';
                document.getElementById("choose").style.display = 'none';
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        //console.log(res);
                        var js = jsa[0];
                        var ans1 = js["Fullname"];
                        var ans2 = js["Email"];
                        q = js["Email"];
                        var ans3 = js["Password"];
                        var ans4 = js["Userphone"];
                        var ans5 = js["Userphoto"];

//                        for (var i = 0; i < jsa.length; i++) {
//                            var js = jsa[i];
//                            ans1 += "<b>" + js["Fullname"];
//                            +"</b>";
//                            ans2 += "<b>" + js["Email"];
//                            +"</b>";
//                            ans3 += "<b>" + js["Password"];
//                            +"</b>";
//                            ans4 += "<b>" + js["Userphone"];
//                            +"</b>";
//                        }
                        document.getElementById("fullnameEDIT").value = ans1;
                        document.getElementById("emailEDIT").value = ans2;
                        document.getElementById("emailR_EDIT").value = ans2;
                        document.getElementById("passwordEDIT").value = ans3;
                        document.getElementById("passwordR_EDIT").value = ans3;
                        document.getElementById("phoneEDIT").value = ans4;
                        document.getElementById("quesImage1").src = ans5;
                    }
                };
                xmlhttp.open("GET", "./fetchprofile", true);
                xmlhttp.send();
            }
            function change_profileImage() {
                document.getElementById("view").style.display = 'none';
                document.getElementById("edit").style.display = 'none';
                document.getElementById("choose").style.display = 'block';
                document.getElementById("formEDIT").reset();
                okay();
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        //console.log(res);
                        var js = jsa[0];
                        var ans5 = js["Userphoto"];
                        document.getElementById("quesPHOTO").src = ans5;
                    }
                };
                xmlhttp.open("GET", "./fetchprofile", true);
                xmlhttp.send();
            }
            function hello2() {


                var ans = "";
                var formdata = new FormData();
                var controls = document.getElementById("formPHOTO").elements;

                //alert("found " + controls.length + " controls in form");

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
                    alert("choose a profile picture !!");
                } else if (flag == 2)
                {
                    alert("choose a profile picture !!");
                } else
                {
                    //alert(ans);
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "./photoupload", true);
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == 'success')
                            {
                                alert('Image Uploaded Successfully !!');
                                window.location.href = "profile.jsp";
                            } else
                            {
                                alert('Image update failed');
                            }

                        }
                    };

                    xhr.send(formdata);
                }
            }
            function validate() {
                var str = document.getElementById("fullnameEDIT").value;
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
                var color = "red";
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
            function phone_number(phn) {
                //TextBox left blank.
                if (phn.length == 0) {
                    return true;
                }
                var passed = 0;
                if (!/^[0-9]*$/g.test(document.formEDIT.phoneEDIT.value)) {
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
            function save(index) {
                var ans = index;
                var one = document.getElementById("fullnameEDIT").value;
                var two = document.getElementById("emailEDIT").value;
                var three = document.getElementById("emailR_EDIT").value;
                var four = document.getElementById("passwordEDIT").value;
                var five = document.getElementById("passwordR_EDIT").value;
                var six = document.getElementById("phoneEDIT").value;
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
                    var controls = document.getElementById("formEDIT").elements;
                    var flag = 0;
                    for (var i = 0; i < controls.length; i++)
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        formdata.append(controls[i].name, controls[i].value);
                    }


                    //alert(ans);
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "./editprofileSave", true);
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res === 'success')
                            {
                                alert('Edited Successfully !!');
                                okay();
                                edit_profile();
                            } else
                            {
                                alert('No changes made !!');
                            }

                        }
                    };
                    xhr.send(formdata);
                }
            }
            ///////////////////////////////////////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////////////////////////////////
            function checkemail(value)
            {
                if (document.getElementById("emailEDIT").value != document.getElementById("emailR_EDIT").value)
                {
                    document.getElementById("d2").innerHTML = "Emails do not match!";
                } else {
                    document.getElementById("d2").innerHTML = "";
                }
            }
            function checkpassword(value)
            {
                if (document.getElementById("passwordEDIT").value != document.getElementById("passwordR_EDIT").value)
                {
                    document.getElementById("d3").innerHTML = "Passwords do not match!";
                } else {
                    document.getElementById("d3").innerHTML = "";
                }
            }
            function validateEmail($email) {
                var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
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
            function okay() {
                document.getElementById("d1").innerHTML = "";
                document.getElementById("d2").innerHTML = "";
                document.getElementById("club2").innerHTML = "";
                document.getElementById("d3").innerHTML = "";
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
            function clear1() {
                document.getElementById("d2").innerHTML = "";
                document.getElementById("club2").innerHTML = "";
                document.getElementById("d3").innerHTML = "";
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
            function clear3() {
                document.getElementById("d3").innerHTML = "";
            }
            function clear4() {
                document.getElementById("club2").innerHTML = "";
            }
            function go1()
            {
                var three = document.getElementById("emailR_EDIT").value;
                var y = "profile";
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
                            save(flag);
                        } else {
                            flag = 2;
                            save(flag);
                        }
                    }
                };
                xmlhttp.open("GET", "./fetchusername?three=" + three + "&y=" + y + "&q=" + q, true);
                xmlhttp.send();
            }
            ///////////////////////////////////////////////////////////////////////////////////////////////////
            ///////////////////////////////////////////////////////////////////////////////////////////////////
        </script>
    </head>
    <body onload="fetchprofile()">
        <%
            String userEmail1 = session.getAttribute("userEmail").toString();
            String userFullname1 = session.getAttribute("userFullname").toString();
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
                        </ul>
                        <h1 class="white-text">My Profile</h1><br>
                    </div>
                </div>
            </div>

        </div>
        <!-- /Hero-area -->
        <br><br>
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <div class="container">
            <div class="row">
                <div class="col-sm-1"></div>
                <% //////////////////////////////////////////////////////////////////////////////////////////%>
                <div class="col-sm-3" style="padding: 10px; min-height: 400px;">
                    <img src="" id="quesImage1" style="width: 150px;height: 150px;padding-left: 5px;border-radius: 21px;" >
                    <br>
                    <label><button type="button" class="btn btn-link" onclick="view_profile()" style="padding-left: 5px;"><b>YOUR PROFILE</b></button></label>
                    <br>
                    <label><button type="button" class="btn btn-link" onclick="edit_profile()" style="padding-left: 5px;"><b>EDIT PROFILE</b></button></label>
                    <br>
                    <label><button type="button" class="btn btn-link" onclick="change_profileImage()" style="padding-left: 5px;"><b>CHOOSE PROFILE IMAGE</b></button></label>
                    <br>
                </div>
                <% //////////////////////////////////////////////////////////////////////////////////////////%>
                <div class="col-sm-8" id="view">
                    <div style="border: solid 2px #FF6700; border-radius: 10px; padding-left: 180px; min-height: 5px;">
                        <form id="formview">
                            <div style="padding: 30px;">
                                <label style="font-size: 20px;">Full Name :</label>
                                <label style="font-size: 20px;" id="fullname">
                                </label>
                                <br>

                                <label style="font-size: 20px;">User Email :</label>
                                <label style="font-size: 20px;" id="email">
                                </label>
                                <br>

                                <label style="font-size: 20px;">User Name :</label>
                                <label style="font-size: 20px;" id="username">
                                </label>
                                <br>

                                <label style="font-size: 20px;">Phone Number :</label>
                                <label style="font-size: 20px;" id="phone">
                                </label><br>
                            </div>
                        </form>
                    </div>
                </div>
                <% //////////////////////////////////////////////////////////////////////////////////////////%>
                <div class="col-sm-8" id="edit">
                    <div style="border: solid 2px #FF6700; border-radius: 10px; padding-left: 0px; min-height: 5px;">
                        <form class="form-horizontal" id="formEDIT" name="formEDIT" style="padding: 42px;">

                            <div class="form-group" >
                                <label class="control-label col-sm-3" >Enter Full Name</label>
                                <div class="col-sm-9">
                                    <input class="input" type="text" name="fullnameEDIT" id="fullnameEDIT" class="form-control" placeholder="Enter Full Name" onfocus="okay()"/>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9"><label id="club1"></label></div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-3" >Enter Email<br><h6>Default Username</h6></label>
                                <div class="col-sm-9" >
                                    <input class="input" title="Note :" data-content="Email should be of the form :xxx@xxx.com" data-toggle="popover" data-trigger="focus" type="email" name="emailEDIT" id="emailEDIT" class="form-control" placeholder="Enter email" onkeyup="go(this.value)" onkeydown="go(this.value)" onfocus="clear1()"/>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9"><label id="d1"></label></div>
                            </div>


                            <div class="form-group" >
                                <label class="control-label col-sm-3" >Re-Enter Email</label>
                                <div class="col-sm-9">
                                    <input class="input" type="email" name="emailR_EDIT" id="emailR_EDIT" class="form-control" placeholder="Re-Enter email" onkeyup="checkemail(this.value)" onkeydown="checkemail(this.value)" onfocus="checkemail(this.value)"/>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9"><label id="d2"></label></div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-3" >Enter Password</label>
                                <div class="col-sm-9">
                                    <input class="input" title="Note :" data-content="minimum length must be 9 digits comprising upper, lower case alphabets [a-z] [A-Z], digits [0-9], special charaters {  $@!%*#?&  } only !!" data-toggle="popover" data-trigger="focus" data-placement="top" type="password" name="passwordEDIT" id="passwordEDIT" class="form-control" placeholder="Enter Password" onkeyup="CheckPasswordStrength(this.value)" onfocus="clear3()"/>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9"><label id="club2"></label></div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-3" >Re-Enter Password</label>
                                <div class="col-sm-9">
                                    <input class="input" type="password" name="passwordR_EDIT" id="passwordR_EDIT" class="form-control" placeholder="Re-Enter Password" onkeyup="checkpassword(this.value)" onkeydown="checkpassword(this.value)" onfocus="clear4(), checkpassword(this.value)"/>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9"><label id="d3"></label></div>
                            </div>

                            <div class="form-group" >
                                <label class="control-label col-sm-3" >Enter Phone Number</label>
                                <div class="col-sm-1"><center><b>+91</b></center></div>
                                <div class="col-sm-8">
                                    <input class="input" type="text" name="phoneEDIT" id="phoneEDIT" class="form-control" />
                                </div>
                            </div>
                            <center><input   type="button"  value="SAVE" class="main-button" onclick="go1()" /></center>
                        </form>
                    </div>
                </div>
                <% //////////////////////////////////////////////////////////////////////////////////////////%>
                <div class="col-sm-8" id="choose">
                    <div style="border: solid 2px #FF6700; border-radius: 10px; padding-left: 0px; min-height: 5px;">
                        <form class="form-horizontal" id="formPHOTO" name="formPHOTO" style="padding: 42px;">
                            <div class="form-group" id="image1"style="height: 50px;">
                                <label class="control-label col-sm-3" >QUESTION IMAGE</label>
                                <div class="col-sm-9">
                                    <input type="file" id="quesfilePHOTO"  name="quesfilePHOTO" onchange="readandpreview(this, 'quesPHOTO')" class="form-control" />
                                    <br>
                                    <img src="" id="quesPHOTO" style="width: 300px;height: 200px;border-radius: 10px;" >
                                </div>
                            </div>
                            <div class="form-group">

                            </div>
                            <div class="form-group" style="padding-left: 185px;">
                                <input type="button" class="main-button" id="thePHOTO" name="thePHOTO" value="UPLOAD"  onclick="hello2()"/>
                            </div>
                        </form>
                    </div>
                </div>
                <% //////////////////////////////////////////////////////////////////////////////////////////%>
            </div>
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
