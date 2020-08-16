<%-- 
    Document   : userQuery
    Created on : May 23, 2018, 7:34:46 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Notifications</title>
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
            th{
                color: black;
                /*                font-size: 17px;*/
                text-align: center;
            }
            td{
                color: black;
                text-align: center;
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
            var myjsa;
            function fetchquery() {
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
                        ans += "<table class='table table-hover'>";

                        ans += "<thead>";
                        ans += "<tr> <th>User Notifications</th> <th>Reply</th> <th>Delete</th> </tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            var x = js["flag"];
                            if (x === "1") {
                                ans += "<tr>";
                                ans += "<td><b>NAME</b> :" + js["name"] + "<br>";
                                ans += "<b>EMAIL</b> :" + js["eaddress"] + "<br>";
                                ans += "<b>SUBJECT</b> :" + js["subject"] + "<br>";
                                ans += "<b>MESSAGE</b> :" + js["message"] + "</td>";
                                ans += "<td><input type='button' value='Reply' class='btn btn-success'  onclick='showeditmodel(" + i + ")' /></td>";
                                ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + i + ")' /></td>";
                                ans += "</tr>";
                            } else {
                                ans += "<tr style='background-color: lightgray;'>";
                                ans += "<td><b>NAME</b> :" + js["name"] + "<br>";
                                ans += "<b>EMAIL</b> :" + js["eaddress"] + "<br>";
                                ans += "<b>SUBJECT</b> :" + js["subject"] + "<br>";
                                ans += "<b>MESSAGE</b> :" + js["message"] + "</td>";
                                ans += "<td><input type='button' value='Reply' class='btn btn-success'  onclick='showeditmodel(" + i + ")' /></td>";
                                ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + i + ")' /></td>";
                                ans += "</tr>";
                            }
                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("the_query").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchquery", true);
                xml.send();
            }

            function showeditmodel(index) {
                var js = myjsa[index];
                var uname = js["tq"];
                document.getElementById("try").value = uname;
                $("#myModalok").trigger('reset');
                $("#myModalok").modal('show');
            }
            function replygo() {
                var y = "2";
                var four = document.getElementById("four").value;
                var five = document.getElementById("try").value;
                if (four === "") {
                    alert('Please add your reply')
                } else {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            alert(res);
                            fetchquery();
                        }
                    };
                    xmlhttp.open("GET", "./addreply?y=" + y + "&four=" + four + "&five=" + five, true);
                    xmlhttp.send();
                }
            }
            function del(ind)
            {
                var js = myjsa[ind];
                var tq1 = js["tq"];
                var ans = confirm('Are you sure you want to delete?');
                if (ans)
                {

                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText.trim();
                            alert(res);
                            fetchquery();
                        }
                    };
                    xml.open("GET", "deletequery?tq=" + tq1, true);
                    xml.send();
                }
            }
            function clear(){
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText.trim();
                        //alert(res);
                    }
                };
                xml.open("GET", "./addclear", true);
                xml.send();
            }
        </script>
    </head>
    <body onload="fetchquery(),clear()">
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
                        <li><a href="logoutAdmin.jsp" onClick="return confirm('Are you sure you want to logout?')" >Logout</a></li>
                    </ul>
                </nav>
                <!-- /Navigation -->

            </div>
        </header>
        <!-- /Header -->
        <% ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////%>
        <br>
        <div class="container">
            <center><h1>User Messages</h1></center>
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div id="the_query">

                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>

        <!-- Modal -->
        <div id="myModalok" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Reply</h4>
                    </div>
                    <div class="modal-body">
                        <form>

                            <div class="form-group">
                                <label>Your Reply</label>
                                <textarea type="text" id="four" rows="5" name="message" class="form-control" placeholder="Enter your Reply"></textarea>
                            </div>
                            <input type="text" id="try" class="form-control" style="visibility: hidden;" />
                            <input type="button" class="main-button" value="Submit" onclick="replygo()" />

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
