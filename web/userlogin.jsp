<%-- 
    Document   : adminlogin
    Created on : Apr 2, 2017, 7:11:58 PM
    Author     : Harpreet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="css/bootstrap.css" rel="stylesheet" />

        <title>use Login Page</title>
        <script >
          
            function login()
            {

                var email = document.getElementById("Username").value;
                var password = document.getElementById("password").value;
                if (email == "") {
                    alert("enter email");
                } else if (email.indexOf("@") == -1 || email.indexOf("@") > email.lastIndexOf(".")) {
                    alert("invalid email");
                } else if (password == "") {
                    alert("enter password");
                } else {
                      var xhr = new XMLHttpRequest();
                    xhr.open("GET", "./LoginCheck?Username=" + email + "&password=" + password, true);
                    xhr.onreadystatechange = function () {
                        if (xhr.status == 200 && xhr.readyState == 4)
                        {
                            var ans = xhr.responseText.trim();
                            if (ans == "success") {
                                alert("login success");
                                window.location.href="userdashboard.jsp";
                            } else {
                                alert("invalid email/password");
                            }
                        }
                    };

                    xhr.send();
                }
            }


        </script>
    </head>
    <body onload="go()" >

        <div class="container">
            <div class="jumbotron">
                <h1>User LOGIN</h1>
            </div>
            <form action ="#" >
                <div class="form-group">  
                    <p id="p" style="color: red"></p>
                    <label>email</label>
                    <input  type="text" class="form-control" id="email" name="email" required/>

                </div>
                <div class="form-group">   


                    <label>Password</label>

                    <input type="password" class="form-control" id="password" name="password" required />

                </div>

                <div class="form-group">                    
                    <input type="button" value="LOGIN" class=" btn-success" onclick="login()"/>  


                </div>



            </form>

        </div>
    </body>
</html>