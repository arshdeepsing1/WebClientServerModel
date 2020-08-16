<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <title>JobPrep.com</title>
        <script type="text/javascript">


        </script>
        <script>
            function go1()
            {
                var empname = document.getElementById("empname").value;
                var address = document.getElementById("address").value;
                var phone = document.getElementById("phone").value;
                var password = document.getElementById("password1").value;
                var cpassword = document.getElementById("cpassword").value;
                if (password !== cpassword)
                {
                    alert("PLEASE CHECK YOUR PASSWORD");
                    $('#myModal1').modal('show');
                } else if (password === "")
                {
                    alert("Password IS Empty");

                } else if (cpassword === "")
                {
                    alert("Confirm Password IS Empty");

                } else
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            if (res === "success")
                            {
                                alert("sign up successfull");
                            }

                        }
                    };
                    xmlhttp.open("POST", "./signup?empname=" + empname + "&address=" + address + "&phone=" + phone + "&password=" + password, true);
                    xmlhttp.send();
                }
            }
            function go()
            {
                var eid = document.getElementById("eid").value;
                var password = document.getElementById("password").value;

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                        var res = xmlhttp.responseText.trim();
                        if (res === "success")
                        {
                            alert("Login successfull");
                            window.location.href = "After_Login.jsp?eid=" + eid;
                        } else
                        {
                            alert("fail");
                            //document.getElementById("l1").innerHTML = res;
                        }
                    }
                };
                xmlhttp.open("GET", "./CheckLogin?eid=" + eid + "&password=" + password, true);
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
                                window.location.href="userdashboard.jsp";
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
            function signup()
            {
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

                    xhr.open("POST", "./adduser", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == 'success')
                            {
                                alert('User Sign-Up Successfull!');
                                

                            } else
                            {
                                alert('Sign-Up Failed!');
                            }

                        }
                    };

                    xhr.send(formdata);
                }
            }
        </script>
    </head>
    <body style="background-color: brown">

        <div class="container-fluid" >
            <div id="all" class="container">
                <br>
                <div class="jumbotron" style="background-color:#000">    
                    <h1 style="color: brown">JobPrep.com</h1>
                </div>
                <div>
                    <nav class="navbar navbar-inverse">

                        <div class="container-fluid" style="border: solid 10px #761c19;">

                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>                        
                                </button>
                                <a class="navbar-brand" href="#">CONTENT</a>
                            </div>

                            <div class="collapse navbar-collapse" id="myNavbar">

                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="HomePage.jsp">Home</a></li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories Wise Preparation<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Private Placement</a></li>
                                            <li><a href="#">Government Jobs</a></li>
                                            <li><a href="#">Current Affairs</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Course Wise Preparation<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Aptitude</a></li>
                                            <li><a href="#">Reasoning</a></li>
                                            <li><a href="#">Java</a></li>
                                            <li><a href="#">C/C++</a></li>
                                            <li><a href="#">General Awareness</a></li>

                                        </ul>
                                    </li>
                                    <li><a href="#">About Us</a></li>

                                </ul>

                                <ul class="nav navbar-nav navbar-right">
                                    <li data-toggle="modal" data-target="#myModal1"><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                    <li data-toggle="modal" data-target="#myModal"><a href="#" ><span class="glyphicon glyphicon-log-in"  ></span> Login</a></li>
                                </ul>



                                <div class="modal" id="myModal" >
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">::LOGIN::</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class = "container">
                                                    <h3>USER LOGIN</h3>
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-3" for="t1">Enter Username</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" id="Username1" placeholder="Enter user name" class="form-control" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="control-label col-sm-3" for="t2">Enter Password</label>
                                                            <div class="col-sm-9">
                                                                <input type="password" id="Password1" placeholder="Enter user password" class="form-control" />
                                                            </div>
                                                        </div>

                                                        <input type="button" class="btn btn-success" value="Login"  onclick="userLogin()"/>
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


                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
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
                                <div id="myModal1" class="modal fade" role="dialog"  >
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
                                                        <label class="control-label col-sm-3" >Enter Email</label>
                                                        <div class="col-sm-9">
                                                            <input type="email" name="email" id="email" class="form-control" placeholder="Enter email" onkeyup="go(this.value)" required/>
                                                        </div>
                                                        <div class="col-sm-3"></div>
                                                        <div class="col-sm-9"><label id="d1"></label></div>
                                                    </div>

                                                    <div class="form-group" >
                                                        <label class="control-label col-sm-3" >Enter Full Name</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" name="fullname" id="fullname" class="form-control" placeholder="Enter Full Name" required/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" >

                                                    </div>

                                                    <div class="form-group" >
                                                        <label class="control-label col-sm-3" >Re-Enter Email</label>
                                                        <div class="col-sm-9">
                                                            <input type="email" name="emailR" id="emailR" class="form-control" placeholder="Re-Enter email" required/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" >
                                                        <label class="control-label col-sm-3" >Enter Password</label>
                                                        <div class="col-sm-9">
                                                            <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" required/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" >
                                                        <label class="control-label col-sm-3" >Re-Enter Password</label>
                                                        <div class="col-sm-9">
                                                            <input type="password" name="passwordR" id="passwordR" class="form-control" placeholder="Re-Enter Password" required/>
                                                        </div>
                                                    </div>

                                                    <input type="button" class="btn btn-success" id="sign" name="sign" value="Sign-Up"  onclick="signup()"/>

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
                    </nav>

                </div>
            </div>            
        </div>

    </body>
</html>
