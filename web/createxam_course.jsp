<%-- 
    Document   : manage_questions
    Created on : Apr 13, 2018, 8:25:11 PM
    Author     : Dapinder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <title> MANAGE QUESTIONS </title>
        <script>
            var courset;
            var sectiont;
            var myjsa;
            var index;
            var ii = 1;
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
            function fetchsection1()
            {
                var Courseid = document.getElementById("course1").value;


                if (Courseid == '-1')
                {
                    alert('Please select valid department');
                } else
                {
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            var res = xml.responseText.trim();

                            var mainjson = JSON.parse(res);
                            var jsa = mainjson["ans"];

                            var ans = "";

                            ans += "<option value='-1'>--Select--</option>";
                            for (var i = 0; i < jsa.length; i++)
                            {
                                var js = jsa[i];
                                ans += "<option value='" + js["Sectionid"] + "'  >" + js["sname"] + "</option>";
                            }


                            document.getElementById("section1").innerHTML = ans;


                        }
                    };
                    xml.open("GET", "./fetchsection?Courseid=" + Courseid, true);
                    xml.send();



                }



            }
            function setsid(value)
            {

                document.getElementById("h1").value = value;
            }

            function test()
            {
                document.getElementById("start").style.display = 'none';

                var Sectionid = document.getElementById("section1").value;
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
                        ans += "<form id='starttest'>";

                        ans += "<br>";

                        ans += "<div class='form-group' id='text1'  >";

                        ans += "<div class='col-sm-12'>";
                        ans += "<textarea  rows='10'  id='quesTitle' name='quesTitle' class='form-control' placeholder='question title' readonly></textarea>";
                        ans += "<label class='hidden' id='quesType1' name='quesType1'></label>";
                        ans += "</div>";
                        ans += "</div>";

                        ans += "<div class='form-group' id='image1' >";

                        ans += "<div class='col-sm-12'>";
                        ans += "<img src='' id='ques' style='width: 800;height:100 ;' >";


                        ans += "</div>";

                        ans += "</div>";
                        ans += "<div>";
                        ans += "<div class='form-group' id='image1' >";
                        ans += "<ol>";
                        ans += "<div class='col-sm-1'>";
                        ans += "<li><label ><input type='radio' name='options' id='opA1'  value='' /></label></li>";
                        ans += "</div>";
                        ans += "<div class='col-sm-11'>";
                        ans += "<input type='text' id='opA' name='opA' class='form-control' readonly/>";
                        ans += "</div>";
                        ans += "<div class='col-sm-1'>";
                        ans += "<li><label ><input type='radio' name='options' id='opB1' value='' /></label></li>";
                        ans += "</div>";
                        ans += "<div class='col-sm-11'>";
                        ans += "<input type='text' id='opB' name='opB' class='form-control' readonly/>";
                        ans += "</div>";
                        ans += "<div class='col-sm-1'>";
                        ans += "<li><label ><input type='radio' name='options' id='opC1' value='' /></label></li>";
                        ans += "</div>";
                        ans += "<div class='col-sm-11'>";
                        ans += "<input type='text' id='opC' name='opC' class='form-control' readonly/>";
                        ans += "</div>";
                        ans += "<div class='col-sm-1'>";
                        ans += "<li><label ><input type='radio' name='options' id='opD1' value='' /></label></li>";
                        ans += "</div>";
                        ans += "<div class='col-sm-11'>";
                        ans += "<input type='text' id='opD' name='opD' class='form-control' readonly/>";
                        ans += "</div>";
                        ans += "</ol>";
                        ans += "</div>";
                        ans += "</div>";


                        ans += "</form>";

                        ans += "<div class='col-sm-6'>";
                        ans += "<input type='button' value='PREVIOUS QUESTION' class='btn btn-success'  onclick='previous()' />";
                        ans += "</div>";
                        ans += "<div class='col-sm-6'>";
                        ans += "<input type='button' value='NEXT QUESTION' class='btn btn-success'  onclick='next()' />";
                        ans += "</div>";





                        document.getElementById("start").innerHTML = ans;
                    }
                };
                xml.open("GET", "./filterques_course?Sectionid=" + Sectionid, true);
                xml.send();

            }

            function next()
            {
                 if(ii>=1||ii<=myjsa.length-1)
                {nextques(ii);
                ii = ii - 1;
            }
            else if(ii==0)
            {
                nextques(ii);
            }
            else if(ii==myjsa.length)
            {nextques(ii);
            }
            

            }
            function previous()
            {
                
                if(ii>=1||ii<=myjsa.length-1)
                {nextques(ii);
                ii = ii - 1;
            }
            else if(ii==0)
            {
                nextques(ii);
            }
            else if(ii==myjsa.length)
            {nextques(ii);
            }
            
            }


            function nextques(index)
            {
                var js = myjsa[index];
                document.getElementById("quesType1").value = js["quesType"];
                document.getElementById("quesTitle").value = js["quesTitle"];
                document.getElementById("ques").src = js["quesImage"];
                document.getElementById("opA").value = js["opA"];
                document.getElementById("opB").value = js["opB"];
                document.getElementById("opC").value = js["opC"];
                document.getElementById("opD").value = js["opD"];

                if (document.getElementById("quesType1").value === "--SELECT--")
                {
                    document.getElementById("text1").style.display = 'none';
                    document.getElementById("image1").style.display = 'none';
                } else if (document.getElementById("quesType1").value === "TEXT TYPE QUESTION")
                {
                    document.getElementById("text1").style.display = 'block';
                    document.getElementById("image1").style.display = 'none';
                } else if (document.getElementById("quesType1").value === "PHOTO TYPE QUESTION")
                {
                    document.getElementById("text1").style.display = 'none';
                    document.getElementById("image1").style.display = 'block';
                }
                //if(document.getElementById(quesType)==="TEXT TYPE QUESTION")
                else if (document.getElementById("quesType1").value === "BOTH TYPES") {
                    document.getElementById("text1").style.display = 'block';
                    document.getElementById("image1").style.display = 'block';
                }
            }
            function nextques1()
            {
                document.getElementById("start").style.display = 'block';
                var js = myjsa[0];
                document.getElementById("quesType1").value = js["quesType"];
                document.getElementById("quesTitle").value = js["quesTitle"];
                document.getElementById("ques").src = js["quesImage"];
                document.getElementById("opA").value = js["opA"];
                document.getElementById("opB").value = js["opB"];
                document.getElementById("opC").value = js["opC"];
                document.getElementById("opD").value = js["opD"];

                if (document.getElementById("quesType1").value === "--SELECT--")
                {
                    document.getElementById("text1").style.display = 'none';
                    document.getElementById("image1").style.display = 'none';
                } else if (document.getElementById("quesType1").value === "TEXT TYPE QUESTION")
                {
                    document.getElementById("text1").style.display = 'block';
                    document.getElementById("image1").style.display = 'none';
                } else if (document.getElementById("quesType1").value === "PHOTO TYPE QUESTION")
                {
                    document.getElementById("text1").style.display = 'none';
                    document.getElementById("image1").style.display = 'block';
                }
                //if(document.getElementById(quesType)==="TEXT TYPE QUESTION")
                else if (document.getElementById("quesType1").value === "BOTH TYPES") {
                    document.getElementById("text1").style.display = 'block';
                    document.getElementById("image1").style.display = 'block';
                }
            }

        </script>
    </head>
    <body onload="fetchcourse1()" >


        <div class="container" >
            <h1>CREATE EXAM</h1>
            <br>
            <br>
            <div >
                <div  class="form-group" >
                    <label>Select Course</label><select class="form-control" id="course1" name="course1" onchange="fetchsection1()">
                    </select>
                </div>
                <div  class="form-group" >
                    <label>Select Section</label><select class="form-control" id="section1" name="section1" onchange="test()" >
                    </select>
                </div>
            </div>
            <ul><li onclick="nextques1()"><a  target="_blank" class="btn btn-success" >START TEST</a></li></ul>

            <br>
            <div id="start" class="container-fluid"></div>
            <label id="res"></label><br>

            <!-- Modal for add question -->

        </div>
    </body>
</html>
