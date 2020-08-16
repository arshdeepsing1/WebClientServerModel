<%-- 
    Document   : user_login
    Created on : Apr 22, 2018, 4:54:31 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });
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
            function phone_number(phn) {
                //TextBox left blank.
                if (phn.length == 0) {
                    return true;
                }

                //Regular Expressions.
                var regex = new Array();
                regex.push("[0-9]"); //Digit.

                var passed = 0;

                //Validate for each Regular Expression.
                for (var i = 0; i < regex.length; i++) {
                    if (new RegExp(regex[i]).test(phn)) {
                        passed++;
                    }
                }

                //Validate for length of Password.
                if (passed > 0 && phn.length > 9) {
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
                }
                if (strength != "Good") {
                    return true;
                } else {
                    return false;
                }
            }
            function CPS(password) {
                //TextBox left blank.
                if (password.length == 0) {
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
                if (color != "darkgreen") {
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
            function signup()
            {
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
                } else if (emailtest(two)) {
                    alert("Email should be of the form :xxx@xxx.com !!");
                } else if (CPS(four)) {
                    alert("Please choose a strong password !!");
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


                    alert(ans);
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

                            } else
                            {
                                alert('Sign-up failed');
                            }

                        }
                    };
                    xhr.send(formdata);
                    $("#myModal").trigger('reset');
                    $("#myModal").modal('hide');
                }
            }
        </script>

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h3>USER LOGIN</h3>
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
                        <br>
                        <a href="#" target="_blank" data-toggle="modal" data-target="#myModalCP">Forgot Password</a>


                    </form>
                    <br>
                    <h4>New User Sign-up Here</h4>
                    <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModal">Sign-Up</button>
                    <div class="row">
                        <div class="col-sm-12">

                            <div class="alert alert-success alert-dismissible fade in" id="alert" style="visibility: hidden">

                                <a href="#" class="close" data-dismiss="alert">&times;</a>

                                <strong>Login again to visit your profile!</strong> 
                            </div>

                        </div>
                    </div>






                    <!--Forgot Password Modal -->
                    <div id="myModalCP" class="modal fade" role="dialog">
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
                                                <input type="text" id="UsernameForget" placeholder="Enter Username" class="form-control" />
                                            </div>
                                        </div>
                                        <label id="a1"></label>



                                        <input type="button" class="btn btn-success" value="Submit"  onclick="forgetPassword()"/>


                                    </form>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>

                    </div>








                    <!-- Modal for Sign-Up -->
                    <div id="myModal" class="modal fade" role="dialog"  >
                        <div class="modal-dialog" >

                            <!-- Modal content-->
                            <div class="modal-content" >
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title"><b>Sign-Up</b></h4>
                                </div>
                                <div class="modal-body">


                                    <form class="form-horizontal" id="form1" name="form1">

                                        <div class="form-group" >
                                            <label class="control-label col-sm-3" >Enter Full Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="fullname" id="fullname" class="form-control" placeholder="Enter Full Name" onfocus="okay()"/>
                                            </div>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-9"><label id="club1"></label></div>
                                        </div>

                                        <div class="form-group" >
                                            <label class="control-label col-sm-3" >Enter Email</label>
                                            <div class="col-sm-9" >
                                                <input title="Note :" data-content="Email should be of the form :xxx@xxx.com" data-toggle="popover" data-trigger="focus" type="email" name="email" id="email" class="form-control" placeholder="Enter email" onkeyup="go(this.value)" onkeydown="go(this.value)" onfocus="clear1()"/>
                                            </div>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-4"><label id="d1"></label></div><div class="col-sm-5"><label id="test"></label></div>
                                        </div>


                                        <div class="form-group" >
                                            <label class="control-label col-sm-3" >Re-Enter Email</label>
                                            <div class="col-sm-9">
                                                <input type="email" name="emailR" id="emailR" class="form-control" placeholder="Re-Enter email" onkeyup="checkemail(this.value)" onkeydown="checkemail(this.value)" onfocus="checkemail(this.value)"/>
                                            </div>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-9"><label id="d2"></label></div>
                                        </div>

                                        <div class="form-group" >
                                            <label class="control-label col-sm-3" >Enter Password</label>
                                            <div class="col-sm-9">
                                                <input title="Note :" data-content="minimum length must be 9 digits comprising upper,lower case alphabets[a-z][A-Z];digits[0-9];special charaters[$@$!%*#?&]" data-toggle="popover" data-trigger="focus" type="password" name="password" id="password" class="form-control" placeholder="Enter Password" onkeyup="CheckPasswordStrength(this.value)" onfocus="clear3()"/>
                                            </div>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-9"><label id="club2"></label></div>
                                        </div>

                                        <div class="form-group" >
                                            <label class="control-label col-sm-3" >Re-Enter Password</label>
                                            <div class="col-sm-9">
                                                <input type="password" name="passwordR" id="passwordR" class="form-control" placeholder="Re-Enter Password" onkeyup="checkpassword(this.value)" onkeydown="checkpassword(this.value)" onfocus="clear4(),checkpassword(this.value)"/>
                                            </div>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-9"><label id="d3"></label></div>
                                        </div>

                                        <div class="form-group" >
                                            <label class="control-label col-sm-3" >Enter Phone Number</label>
                                            <div class="col-sm-1"><center><b>+91</b></center></div>
                                            <div class="col-sm-8">
                                                <input type="text" name="phone" id="phone" class="form-control" />
                                            </div>
                                        </div>

                                        <input type="button" class="btn btn-success"  value="Sign-Up"  onclick="signup()"/>

                                    </form>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" id="close" name="close" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
