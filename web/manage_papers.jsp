<%-- 
    Document   : manage_course
    Created on : 11 Apr, 2018, 11:37:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Papers</title>
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
            thead{
                background-color: black;
            }
            th{
                color: white;
                font-size: 17px;
            }
            td{
                color: black;
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
            var b;

            function getFileExtension(filename) {
                /*TODO*/
                return filename.split('.').pop();
            }
            function fetchpaper()
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
                        ans += "<table class='table table-hover'>";

                        ans += "<thead>";
                        ans += "<tr> <th>SNO</th> <th>Paper Title</th> <th>File Path</th><th>Course Name</th><th>Delete</th></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var l = i + 1;
                            var js = jsa[i];
                            ans += "<tr>";

                            ans += "<td>" + l + "</td>";
                            ans += "<td>" + js["paperTitle"] + "</td>";
                            ans += "<td>" + js["filepath"] + "</td>";
                            ans += "<td>" + js["cname"] + "</td>";
                            ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + js["Sno"] + ")' /></td>";
                            ans += "</tr>";

                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchpaper", true);
                xml.send();



            }



            function addpaper()
            {
                var c = document.getElementById("course1").value;
                var x = document.getElementById("fileOK").value;

                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;

                // alert("found " + controls.length + " controls in form");

                var flag = 0;
                for (var i = 0; i < controls.length; i++)
                {
                    if (controls[i].name === "" || controls[i].name === null)
                    {
                        alert("yes");
                        flag = 1;
                        break;
                    }

                    if (controls[i].type == "file")
                    {
                        if (controls[i].files.length != 0)
                        {
                            var quartz = document.getElementById("icon").value;
                            var telltale = getFileExtension(quartz);
                            if (telltale !== "pdf") {
                                flag = 3;
                            }
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

                if (flag === 1)
                {
                    alert("Please fill all the fields !!");
                } else if (x === "")
                {
                    alert("Please choose paper title !!");
                } else if (flag === 2)
                {
                    alert("Please select a file !!");
                } else if (flag === 3)
                {
                    alert("Please select a file of .pdf extension !!");
                } else if (c === "-1")
                {
                    alert("Please choose course category !!");
                } else
                {
                    // alert(ans);
                    // alert(formdata);

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./addpaper", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == 'success')
                            {
                                alert('paper Added Successfully');
                                fetchpaper();
                                $("#form1").trigger('reset');

                            } else
                            {
                                alert('Paper already exists');
                            }

                        }
                    };

                    xhr.send(formdata);
                }
            }

            function del(Sno)
            {
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
                            fetchpaper();
                        }
                    };
                    xml.open("GET", "deletepaper?Sno=" + Sno, true);
                    xml.send();
                }



            }



            function fetchcourse1()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState === 4 && xml.status === 200)
                    {
                        var res = xml.responseText.trim();
                        document.getElementById("res").innerHTML;
                        var mainjson = JSON.parse(res);

                        var jsa = mainjson["ans"];

                        var ans = "";
                        ans += "<option  value='-1'>--Select--</option>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<option  value='" + js["Courseid"] + "'  >" + js["cname"] + "</option>";
                        }
                        document.getElementById("course1").innerHTML = ans;

                    }
                };
                xml.open("GET", "./fetchcourse", true);
                xml.send();
            }

//        }
        </script>

    </head>
    <body onload="fetchpaper(), fetchcourse1()">
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

        <div class="container">
            <div class="page-header">
                <center><h1>Admin Add Paper</h1></center>  
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="border: solid 2px black; border-radius: 5px; padding: 10px">

                    <form id="form1" action="#" method="POST" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="control-label col-sm-3" >Paper Title</label>
                            <div class="col-sm-9">
                                <input type="text" name="fileOK" id="fileOK" class="form-control" />
                                <br>
                            </div>
                        </div>
                        <label style="visibility: hidden;"></label>
                        <div class="form-group">
                            <label class="control-label col-sm-3" >Select File</label>
                            <div class="col-sm-9">
                                <input type="file" name="icon" id="icon"  class="form-control"/>
                            </div>
                        </div>
                        <label style="visibility: hidden;"></label>
                        <div  class="form-group" >
                            <label>Select Course</label><select class="form-control" id="course1" name="course1">
                            </select>
                        </div>
                    </form>

                    <center><input   type="button"  value="Add Paper" class="main-button icon-button" onclick="addpaper()" /></center>

                </div>
            </div>
        </div>
        <label id="res"></label>
        <div class="container">
            <center><h4>OLD PAPERS</h4></center>
            <div id="d1" style="min-height: 50px; border: solid 2px black">

            </div>
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
