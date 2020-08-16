<%-- 
    Document   : manage_course
    Created on : 11 Apr, 2018, 11:37:19 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Courses</title>
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
            .modal-backdrop
            {
                opacity:0.5 !important;
            }
        </style>

        <script>
            var myjsa;
            var b;

            function checksure()
            {
                var ans = confirm("Are you sure you want to logout?");
                if (ans == true)
                {
                    window.location.href = "logoutAdmin.jsp";
                } else
                {

                }
            }
            function gotofeedback()
            {
                window.location.href = "Welcome.jsp";
            }

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

            function fetchcourse()
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
                        ans += "<tr> <th>Course Name</th> <th>Description</th> <th>Icon</th><th>Edit</th><th>Delete</th></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";

                            ans += "<td>" + js["cname"] + "</td>";
                            ans += "<td>" + js["descript"] + "</td>";
                            ans += "<td><img src='" + js["icon"] + "' width='50' height='50' /></td>";
                            ans += "<td><input type='button' value='Edit' class='btn btn-success'  onclick='showeditmodel(" + i + ")' /></td>";
                            ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + js["Courseid"] + ")' /></td>";
                            ans += "</tr>";

                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchcourse", true);
                xml.send();



            }



            function addcourse()
            {
                var cname = document.getElementById("cname").value;
                var descript = document.getElementById("descript").value;
                var icon = document.getElementById("icon").value;
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

                if (cname == "")
                {
                    alert("enter course name");
                } else if (descript == "")
                {
                    alert("enter description");
                } else if (icon == "")
                {
                    alert("select icon image");
                } else if (flag == 1)
                {
                    alert("Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("Select icon file");
                } else
                {
                    // alert(ans);
                    // alert(formdata);

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./addcourse", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == 'success')
                            {
                                alert('Course Added Successfully');
                                fetchcourse();
                                //document.getElementById("Courseid").value = "";
                            } else
                            {
                                alert('Course already exists');
                            }

                        }
                    };

                    xhr.send(formdata);
                }
            }

            function del(Courseid)
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
                            fetchcourse();
                        }
                    };
                    xml.open("GET", "deleteCourse?Courseid=" + Courseid, true);
                    xml.send();
                }



            }


            function showeditmodel(index) {
                b = index;
                var js = myjsa[index];
                var cname = js["cname"];
                var cdesc = js["descript"];
                var icon = js["icon"];
                var cidedit = js["Courseid"];


                document.getElementById("cidedit").value = cidedit;
                document.getElementById("cnameedit").value = cname;
                document.getElementById("cdescedit").value = cdesc;

                //document.getElementById("filecaticonedit").innerHTML.value = icon;
                document.getElementById("im2edit").src = icon;

                $("#mymodaleditcategory").modal('show');

            }

            function editcategory()
            {

                var cname = document.getElementById("cnameedit").value;
                var descript = document.getElementById("cdescedit").value;
                var icon = document.getElementById("filecaticonedit").value;
                var ans = "";
                //NEW CODE
                var formdata = new FormData();

                var controls = document.getElementById("form2").elements;

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
                        //   formdata.append("rn",document.getElementById("rn").value);
                        // formdata.append(firstfile.name,firstfile);

                        formdata.append(controls[i].name, controls[i].value);
                    }
//                    alert(ans);
//                    alert(flag);
                }
                if (cname == "")
                {
                    alert("enter course name");
                } else if (descript == "")
                {
                    alert("enter description");
                } else if (icon == "")
                {
                    alert("select image file");
                } else if (flag == 1)
                {
                    alert("Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("Select icon file");
                } else
                {
                    // alert(ans);
                    // alert(formdata);

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./editCategory", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == 'success')
                            {
                                alert('Course Edited Successfully');
                                $("#mymodaleditcategory").modal('hide');
                                fetchcourse();
                            } else
                            {
                                alert('Course update failed');
                            }

                        }
                    };

                    xhr.send(formdata);
                }


            }
//        }
        </script>

    </head>
    <body onload="fetchcourse()">
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
            <div class="row">
                <div  class="col-md-10 col-md-offset-1" style="border: solid 2px black; border-radius: 5px; padding: 10px">

                    <form id="form1" action="#" method="POST" enctype="multipart/form-data">
                        <!--                    <div class="form-group">
                                                <label class="control-label col-sm-3" >Course ID</label>
                                                <div class="col-sm-9">
                                                    <input type="text" name="Courseid" id="Courseid"  class="form-control" />
                                                </div>
                                            </div>-->
                        <div class="form-group">
                            <label class="control-label col-md-3" >Course Name</label>
                            <div class="col-md-9">
                                <input type="text" name="cname" id="cname" class="input form-control" />
                                <br>
                            </div>
                        </div>
                        <label style="visibility: hidden;"></label>
                        <div class="form-group">
                            <label class="control-label col-md-3">Course Description</label>
                            <div class="col-md-9">
                                <textarea  rows="5" cols="5" name="descript" id="descript"  class="input form-control"></textarea>
                                <br>
                            </div>
                        </div>
                        <label style="visibility: hidden;"></label>
                        <div class="form-group">
                            <label class="control-label col-md-3" >ICON</label>
                            <div class="col-md-9">
                                <input type="file" name="icon" id="icon" accept="image/*" class="input form-control" onchange="readandpreview(this, 'im2')"/>
                                <img src="" id="im2" style="width: 100px;height: 100px;">
                            </div>
                        </div>
                        <br><br>
                    </form>

                    <center><input type="button"  value="Add course" class="main-button icon-button" onclick="addcourse()" /></center>

                </div>
            </div>
        </div>
        <label id="res"></label>
    <center><h1>Courses</h1></center>
    <div class="container">
        <div id="d1" style="min-height: 100px; border: solid 2px black">

        </div>
    </div>
    <div id="mymodaleditcategory" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Course</h4>
                </div>
                <div class="modal-body">
                    <form id="form2" action="#" enctype="multipart/form-data">

                        <div class="form-group">
                            <label>Course Name</label>
                            <input type="text" id="cnameedit" name="cnameedit" class="input form-control" placeholder="Category name">
                            <input type="hidden" id="cidedit" name="cidedit" />
                        </div>


                        <div class="form-group">
                            <label>Course Description</label>
                            <textarea  rows="10" cols="5" id="cdescedit" name="cdescedit" class="input form-control" placeholder="Category Description"></textarea>
                        </div>


                        <div class="form-group">

                            <label>Icon</label>
                            <input type="file" id="filecaticonedit" name="filecaticonedit" accept="image/*" onchange="readandpreview(this, 'im2edit')" class="input form-control">
                            <img src="" id="im2edit" style="width: 100px;height: 100px;" >

                        </div>        
                        <input type="button" name="btedit" value="edit " class="main-button icon-button pull-right" style="margin-left: 195px;" onclick="editcategory()" />
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
