<%-- 
    Document   : managesubjects
    Created on : 12 Apr, 2018, 5:35:11 PM
    Author     : Home
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Section</title>
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
            var globaljsa;
            var globaljsasub;
            var selectedcid;
            var selectedindex;
            function showsubcategorymodel() {
                var x = document.getElementById("maincat").value;
                if (x === "--Select Course--") {
                    alert("Please select a course !!");
                } else {
                    var js = globaljsa[selectedindex];
                    var cname = js["cname"];
                    //alert("cn " + cname + " si " + selectedcid);
                    document.getElementById("cname").value = cname;
                    document.getElementById("cid").value = selectedcid;
                    $("#mymodaladdsubcategory").modal('show');
                }
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


            function showcategories()
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var ans1 = "";
                        var res = xml.responseText.trim();
                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        globaljsa = jsa;
                        ans1 += "<option>--Select Course--</option>";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans1 += "<option value=\"" + js["Courseid"] + "\">" + js["cname"] + "</option>";
                        }
                        document.getElementById("maincat").innerHTML = ans1;
                    }

                };

                xml.open("GET", "./fetchcourse", true);
                xml.send();

            }
            function showsubcategories(cid)
            {
                var ans;
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        var res = xml.responseText.trim();

                        var mainjson = JSON.parse(res);
                        var jsa = mainjson["ans"];
                        globaljsasub = jsa;

                        ans = "<table  class=\"table table-hover\" >";
                        ans += "<thead><tr><th>Section Name</th><th>Section Description</th><th>Icon</th><th>Edit</th><th>Delete</th></tr></thead>";

                        ans += "<tbody>";

                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<tr>";

                            ans += "<td id=\"cname_" + i + "\">" + js["sname"] + "</td>";
                            ans += "<td id=\"cdesc_" + i + "\">" + js["sdescript"] + "</td>";
                            ans += "<td  id=\"icon_" + i + "\"> <img    src=\"" + js["icon"] + "\"  width=\"116\" height=\"100\" /></td>";

                            ans += "<td><input type=\"button\" value=\"Edit\" class=\"btn btn-success\" onclick=\"showeditsubcategorymodel(" + i + ")\"/></td>";
                            ans += "<td><input type=\"button\" value=\"Delete\" class=\"btn btn-danger\" onclick=\"delsubcategory(" + js["Sectionid"] + ")\"/></td>";
                            ans += "</tr>";

                        }

                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;

                    }

                };

                xml.open("GET", "./fetchsection?Courseid=" + cid, false);
                xml.send();
            }


            function setselectedcategory(value)
            {
                var index = document.getElementById("maincat").selectedIndex;
                if (index == 0)
                {

                    alert("Select any course");
                    document.getElementById("d1").innerHTML = "";
                } else
                {

                    selectedcid = value;
                    selectedindex = index - 1;
                    // alert("scid " + selectedcid + "  si " + selectedindex);
                    showsubcategories(value);

                }
            }

            function addsubcategory() {
                var sname = document.getElementById("sname").value;
                var sdesc = document.getElementById("sdesc").value;
                var is = document.getElementById("filesubcaticon").value;

                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;

                //alert("found " + controls.length + " controls in form");

                var ans = "";
                //NEW CODE

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
                    } else
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        formdata.append(controls[i].name, controls[i].value);
                    }

                }
                if (sname == "")
                {
                    alert("Please Enter Subject Name");
                } else if (sdesc == "")
                {
                    alert("Please Select Subject Description");
                } else if (is == "")
                {
                    alert("Please Select Section Image");
                } else if (flag == 1)
                {
                    alert("Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("Select Files for file controls");
                } else
                {
                    //alert(ans);
                    var xhr = new XMLHttpRequest;

                    xhr.open("POST", "./addsection", true);

                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == "success")
                            {
                                alert("Section Added Successfully");
                                $("#mymodaladdsubcategory").modal('hide');
                                var refresh = document.getElementById("maincat");
                                refresh.setSelectedIndex = selectedindex;
                                setselectedcategory(selectedcid);

                            } else
                            {
                                alert("This Section Already Exist in this course");
                            }

                        }
                    };


                    xhr.send(formdata);

                }

            }

            function delsubcategory(value) {
                var retVal = confirm("Do you want to continue ?");
                if (retVal == true) {
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "./deletesection?cid=" + selectedcid + "&sid=" + value, true);
                    xhr.onreadystatechange = function () {
                        if (xhr.status == 200 && xhr.readyState == 4)
                        {
                            var ans = xhr.responseText.trim();
                            if (ans === "success") {
                                alert("Section deleted successfully");
                                var refresh = document.getElementById("maincat");
                                refresh.setSelectedIndex = selectedindex;
                                setselectedcategory(selectedcid);

                            } else {
                                alert("Section deletion failed");
                            }
                        }
                    };
                    xhr.send();
                    return true;
                } else {
                    alert("Delete request cancelled by user");
                }
            }

            function showeditsubcategorymodel(index) {
                var js = globaljsa[selectedindex];
                var cname = js["cname"];
                var cid = js["Courseid"];
                var jssub = globaljsasub[index];
                var sname = jssub["sname"];
                var sdesc = jssub["sdescript"];
                var icon = jssub["icon"];

                var sid = jssub["Sectionid"];

                document.getElementById("cidedit").value = cid;
                document.getElementById("sidedit").value = sid;
                document.getElementById("cnameedit").value = cname;
                document.getElementById("snameedit").value = sname;
                document.getElementById("sdescedit").value = sdesc;
                document.getElementById("im2edit").src = icon;

                $("#mymodeleditsubcategory").modal('show');
            }
            function editsubject() {
                var sname = document.getElementById("snameedit").value;
                var sdesc = document.getElementById("sdescedit").value;
                var file = document.getElementById("filesubcaticonedit").value;
                var cid = document.getElementById("cidedit").value;
                var sid = document.getElementById("sidedit").value;


                var formdata = new FormData();

                var controls = document.getElementById("form2").elements;

                // alert("found " + controls.length + " controls in form");

                var ans = "";
                //NEW CODE

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
                    } else
                    {
                        ans = ans + controls[i].name + ": " + controls[i].value + "\n";
                        formdata.append(controls[i].name, controls[i].value);
                    }

                }
                if (sname == "")
                {
                    alert("Please Enter Subject Name");
                } else if (sdesc == "")
                {
                    alert("Please Select Subject Description");
                } else if (file == "")
                {
                    alert("Please Select Section Image");
                } else if (flag == 1)
                {
                    alert("Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("Select Files for file controls");
                } else
                {
                    //alert(ans);

                    var xhr = new XMLHttpRequest;

                    xhr.open("POST", "./AdminEditSubject", true);


                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res === "success")
                            {
                                alert("Section Updated Successfully");
                                $("#mymodeleditsubcategory").modal('hide');
                                var refresh = document.getElementById("maincat");
                                refresh.setSelectedIndex = selectedindex;
                                setselectedcategory(selectedcid);



                            } else
                            {
                                alert(res);
                            }

                        }
                    };


                    xhr.send(formdata);

                }
            }

        </script>
    </head>

    <body onload="showcategories()">
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
                <center> <h1>Manage Sections/Chapters</h1></center>
            </div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">

                    <div  class="form-group">
                        <label>Select Course</label><select class="form-control" id="maincat" name="maincat" onchange="setselectedcategory(this.value)">



                        </select>
                    </div>

                </div>
            </div>
            <center><input type="button" value="Add Section"  class="main-button icon-button" onclick="showsubcategorymodel()"  /></center> <br><br>
            <div id="d1">

            </div>
        </div>


        <!-- Modal add sub category-->
        <div id="mymodaladdsubcategory" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add Section</h4>
                    </div>
                    <div class="modal-body">

                        <form id="form1" action="#" enctype="multipart/form-data">

                            <div class="form-group">
                                <label> Course </label>
                                <input type="text" id="cname" name="cname" class="input form-control" readonly>
                                <input type="hidden" id="cid" name="cid" >
                            </div>

                            <div class="form-group">
                                <label> Section Name</label>
                                <input type="text" id="sname" name="sname" class="input form-control" placeholder="Section Name">
                            </div>

                            <div class="form-group">
                                <label> Section Description</label>
                                <textarea  rows="3" cols="5" id="sdesc" name="sdesc" class="input form-control" placeholder="Section Description"></textarea>
                            </div>

                            <div class="form-group">

                                <label>Section Icon</label>
                                <input type="file" id="filesubcaticon" name="filesubcaticon" accept="image/*" onchange="readandpreview(this, 'im2')" class="input form-control"><br>
                                <img src="" id="im2" style="width: 100px;height: 100px;" >

                            </div>

                            <input type="button" name="bt" value="Add Section" class="main-button icon-button" style="margin-left: 195px;" onclick="addsubcategory()" />
                            <br><br>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal edit sub category-->
        <div id="mymodeleditsubcategory" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit Section</h4>
                    </div>
                    <div class="modal-body">

                        <form id="form2" action="#" enctype="multipart/form-data">

                            <div class="form-group">
                                <label> Course </label>
                                <input type="text" id="cnameedit" name="cnameedit" class="input form-control" readonly>
                                <input type="hidden" id="cidedit" name="cidedit" >
                            </div>

                            <div class="form-group">
                                <label> Section Name</label>
                                <input type="text" id="snameedit" name="snameedit" class="input form-control" placeholder="Section Name">
                                <input type="hidden" id="sidedit" name="sidedit">
                            </div>

                            <div class="form-group">
                                <label> Section Description</label>
                                <textarea  rows="3" cols="5" id="sdescedit" name="sdescedit" class="input form-control" placeholder="Section Description"></textarea>
                            </div>

                            <div class="form-group">
                                <label> Icon</label>
                                <input type="file" id="filesubcaticonedit" name="filesubcaticonedit" accept="image/*" onchange="readandpreview(this, 'im2edit')" class="input form-control">
                                <img src="" id="im2edit" style="width: 100px;height: 100px;" >
                            </div>  

                            <input type="button" name="btedit" value="Update" class="main-button icon-button" style="margin-left: 195px;" onclick="editsubject()" />

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
