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
        <title>Manage Questions</title>
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
                opacity:0.4 !important;
            }
        </style>

        <script>
            $(document).ready(function () {

                $("#myBtn2").click(function () {
                    $("#myModal11").modal({backdrop: "static"});
                });

            });
            var courset;
            var sectiont;
            var myjsa;
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

            function ttq()
            {
                if (document.getElementById("quesType").value === "--SELECT--")
                {
                    document.getElementById("text").style.display = 'none';
                    document.getElementById("image").style.display = 'none';
                    document.getElementById("text1").style.display = 'none';
                    document.getElementById("image1").style.display = 'none';
                } else if (document.getElementById("quesType").value === "TEXT TYPE QUESTION")
                {
                    document.getElementById("text").style.display = 'block';
                    document.getElementById("image").style.display = 'none';
                    document.getElementById("text1").style.display = 'block';
                    document.getElementById("image1").style.display = 'none';
                } else if (document.getElementById("quesType").value === "PHOTO TYPE QUESTION")
                {
                    document.getElementById("text").style.display = 'none';
                    document.getElementById("image").style.display = 'block';
                    document.getElementById("text1").style.display = 'none';
                    document.getElementById("image1").style.display = 'block';
                }
                //if(document.getElementById(quesType)==="TEXT TYPE QUESTION")
                else if (document.getElementById("quesType").value === "BOTH TYPES")
                {
                    document.getElementById("text").style.display = 'block';
                    document.getElementById("image").style.display = 'block';
                    document.getElementById("text1").style.display = 'block';
                    document.getElementById("image1").style.display = 'block';
                }
            }
            function fetchcourse()
            {
                document.getElementById("text").style.display = 'none';
                document.getElementById("image").style.display = 'none';
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
                        document.getElementById("course").innerHTML = ans;

                    }
                };
                xml.open("GET", "./fetchcourse", true);
                xml.send();
            }
            function fetchsection()
            {
                var Courseid = document.getElementById("course").value;


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
                            document.getElementById("l2").innerHTML;

                            var mainjson = JSON.parse(res);
                            var jsa = mainjson["ans"];

                            var ans = "";

                            ans += "<option value='-1'>--Select--</option>";
                            for (var i = 0; i < jsa.length; i++)
                            {
                                var js = jsa[i];
                                ans += "<option value='" + js["Sectionid"] + "'  >" + js["sname"] + "</option>";
                            }


                            document.getElementById("section").innerHTML = ans;


                        }
                    };
                    xml.open("GET", "./fetchsection?Courseid=" + Courseid, true);
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
                            document.getElementById("l2").innerHTML;

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
            function  hello()
            {
                var questype = document.getElementById("quesType").value;
                if (questype == "TEXT TYPE QUESTION") {
                    var quesTitle = document.getElementById("quesTitle").value;
                    var opA = document.getElementById("opA").value;
                    var opB = document.getElementById("opB").value;
                    var opC = document.getElementById("opC").value;
                    var opD = document.getElementById("opD").value;
                    var answer = document.getElementById("answer").value;
                    var Explanation = document.getElementById("Explanation").value;
                    var course = document.getElementById("course").value;
                    var section = document.getElementById("section").value;
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
                                //  flag = 2;
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

                    if (quesTitle == "")
                    {
                        alert("enter course title");
                    } else if (opA == "")
                    {
                        alert("enter option A");
                    } else if (opB == "")
                    {
                        alert("enter option B");
                    } else if (opC == "")
                    {
                        alert("enter option C");
                    } else if (opD == "")
                    {
                        alert("enter option D");
                    } else if (answer == "")
                    {
                        alert("enter answer");
                    } else if (Explanation == "")
                    {
                        alert("enter explanation");
                    } else if (course == -1)
                    {
                        alert("select course category");
                    } else if (section == -1)
                    {
                        alert("Select section category");
                    } else if (flag == 1)
                    {
                        alert("Give name attribute to all controls in form");
                    } else if (flag == 2)
                    {
                        alert("Select Files for file controls");
                    } else
                    {
                        // alert(ans);
                        // alert(formdata);

                        var xhr = new XMLHttpRequest();

                        xhr.open("POST", "./addquestion", true);
                        //for response receiving
                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState === 4 && xhr.status == 200)
                            {
                                var res = xhr.responseText.trim();
                                if (res == 'success')
                                {
                                    alert('Question Added Successfully');
                                    //document.getElementById("form1").reset();
                                    $("#myModal11").modal('hide');
                                    $("#form1").trigger('reset');
                                    //$('body').removeClass('modal-open');
                                    //$('.modal-backdrop').remove();
                                } else
                                {
                                    alert('Question already exists');
                                    //document.getElementById("form1").reset();
                                    $("#myModal11").modal('hide');
                                    $("#form1").trigger('reset');
                                    //$("#myModa111").on('hidden',function(){$(':input',this).val('')});
                                }

                            }
                        };

                        xhr.send(formdata);
                    }
                } else if (questype === "BOTH TYPES") {
                    var quesTitle = document.getElementById("quesTitle").value;
                    var quesImage = document.getElementById("quesImage").value;
                    var opA = document.getElementById("opA").value;
                    var opB = document.getElementById("opB").value;
                    var opC = document.getElementById("opC").value;
                    var opD = document.getElementById("opD").value;
                    var answer = document.getElementById("answer").value;
                    var Explanation = document.getElementById("Explanation").value;
                    var course = document.getElementById("course").value;
                    var section = document.getElementById("section").value;
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

                    if (quesTitle == "")
                    {
                        alert("enter course title");
                    } else if (quesImage == "")
                    {
                        alert("select question image");
                    } else if (opA == "")
                    {
                        alert("enter option A");
                    } else if (opB == "")
                    {
                        alert("enter option B");
                    } else if (opC == "")
                    {
                        alert("enter option C");
                    } else if (opD == "")
                    {
                        alert("enter option D");
                    } else if (answer == "")
                    {
                        alert("enter answer");
                    } else if (Explanation == "")
                    {
                        alert("enter explanation");
                    } else if (course == -1)
                    {
                        alert("select course category");
                    } else if (section == -1)
                    {
                        alert("Select section category");
                    } else if (flag == 1)
                    {
                        alert("Give name attribute to all controls in form");
                    } else if (flag == 2)
                    {
                        alert("Select Files for file controls");
                    } else
                    {
                        // alert(ans);
                        // alert(formdata);

                        var xhr = new XMLHttpRequest();

                        xhr.open("POST", "./addquestion", true);
                        //for response receiving
                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState === 4 && xhr.status == 200)
                            {
                                var res = xhr.responseText.trim();
                                if (res == 'success')
                                {
                                    alert('Question Added Successfully');
                                    //document.getElementById("form1").reset();
                                    $("#myModal11").modal('hide');
                                    $("#form1").trigger('reset');
                                    //document.getElementById("qid").value = "";
                                } else
                                {
                                    alert('Question already exists');
                                    //document.getElementById("form1").reset();
                                    $("#myModal11").modal('hide');
                                    $("#form1").trigger('reset');
                                }

                            }
                        };

                        xhr.send(formdata);
                    }
                } else if (questype === "PHOTO TYPE QUESTION") {
                    //var quesTitle = document.getElementById("quesTitle").value;
                    var quesImage = document.getElementById("quesImage").value;
                    var opA = document.getElementById("opA").value;
                    var opB = document.getElementById("opB").value;
                    var opC = document.getElementById("opC").value;
                    var opD = document.getElementById("opD").value;
                    var answer = document.getElementById("answer").value;
                    var Explanation = document.getElementById("Explanation").value;
                    var course = document.getElementById("course").value;
                    var section = document.getElementById("section").value;
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

                    if (quesImage == "")
                    {
                        alert("select question image");
                    } else if (opA == "")
                    {
                        alert("enter option A");
                    } else if (opB == "")
                    {
                        alert("enter option B");
                    } else if (opC == "")
                    {
                        alert("enter option C");
                    } else if (opD == "")
                    {
                        alert("enter option D");
                    } else if (answer == "")
                    {
                        alert("enter answer");
                    } else if (Explanation == "")
                    {
                        alert("enter explanation");
                    } else if (course == -1)
                    {
                        alert("select course category");
                    } else if (section == -1)
                    {
                        alert("Select section category");
                    } else if (flag == 1)
                    {
                        alert("Give name attribute to all controls in form");
                    } else if (flag == 2)
                    {
                        alert("Select Files for file controls");
                    } else
                    {
                        // alert(ans);
                        // alert(formdata);

                        var xhr = new XMLHttpRequest();

                        xhr.open("POST", "./addquestion", true);
                        //for response receiving
                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState === 4 && xhr.status == 200)
                            {
                                var res = xhr.responseText.trim();
                                if (res == 'success')
                                {
                                    alert('Question Added Successfully');
                                    //document.getElementById("form1").reset();
                                    $("#myModal11").modal('hide');
                                    $("#form1").trigger('reset');
                                    //document.getElementById("qid").value = "";
                                } else
                                {
                                    alert('Question already exists');
                                    //document.getElementById("form1").reset();
                                    $("#myModal11").modal('hide');
                                    $("#form1").trigger('reset');
                                }

                            }
                        };

                        xhr.send(formdata);
                    }
                } else {
                    alert("select question type");
                }
            }
            function setsid(value)
            {

                document.getElementById("h1").value = value;
            }
            function fetchquestion()
            {
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
                        ans += "<table class='table table-hover'>";

                        ans += "<thead>";
                        ans += "<tr> <th>QUESTION TITLE</th> <th>QUESTION IMAGE</th><th>Edit</th><th>Delete</th></tr>";
                        ans += "</thead>";

                        ans += "<tbody>";


                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];
                            ans += "<tr>";

                            ans += "<td>" + js["quesTitle"] + "</td>";
                            var q = js["quesImage"];
                            if (q !== null) {
                                ans += "<td><img src='" + js["quesImage"] + "' width='50' height='50' /></td>";
                            } else {
                                ans += "<td>----------</td>";
                            }
                            ans += "<td><input type='button' value='Edit' class='btn btn-success'  onclick='showeditmodel(" + i + ")' /></td>";
                            ans += "<td><input type='button' value='Delete' class='btn btn-danger' onclick='del(" + js["qid"] + ")' /></td>";
                            ans += "</tr>";

                        }
                        ans += "</tbody>";
                        ans += "</table>";

                        document.getElementById("d1").innerHTML = ans;
                    }
                };
                xml.open("GET", "./fetchquestion?Sectionid=" + Sectionid, true);
                xml.send();
            }

            function del(qid)
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
                            alert("deleted successfully");
                            fetchquestion();
                        }
                    };
                    xml.open("GET", "deletequestion?qid=" + qid, true);
                    xml.send();
                }
            }

            function showeditmodel(index)
            {

                var js = myjsa[index];
                var quesTitle = js["quesTitle"];
                var opA = js["opA"];
                var opB = js["opB"];
                var opC = js["opC"];
                var opD = js["opD"];
                var answer = js["answer"];
                var Explanation = js["Explanation"];
                var quesImage = js["quesImage"];
                var quesType = js["quesType"];
                var qid = js["qid"];
                //alert(quesImage);
                document.getElementById("quesTitle1").value = quesTitle;
                document.getElementById("opA1").value = opA;
                document.getElementById("opB1").value = opB;
                document.getElementById("opC1").value = opC;
                document.getElementById("opD1").value = opD;
                document.getElementById("answer1").value = answer;
                document.getElementById("Explanation1").value = Explanation;
                document.getElementById("quesType1").value = quesType;
                document.getElementById("qid1").value = qid;
                {
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

                        document.getElementById("quesImage1").src = quesImage;
                    }
                    //if(document.getElementById(quesType)==="TEXT TYPE QUESTION")
                    else if (document.getElementById("quesType1").value === "BOTH TYPES") {
                        document.getElementById("text1").style.display = 'block';
                        document.getElementById("image1").style.display = 'block';

                        document.getElementById("quesImage1").src = quesImage;
                    }
                }
                //document.getElementById("filecaticonedit").innerHTML.value = icon;

                $("#mymodaleditquestion").trigger('reset');
                $("#mymodaleditquestion").modal('show');

            }
            function hello2()
            {
                var quesType = document.getElementById("quesType1").value;
                var quesTitle = document.getElementById("quesTitle1").value;
                if (quesType === "PHOTO TYPE QUESTION" || quesType === "BOTH TYPES") {
                    var quesImage = document.getElementById("quesImage1").src;
                    //alert(quesImage);
                }
                var opA = document.getElementById("opA1").value;
                var opB = document.getElementById("opB1").value;
                var opC = document.getElementById("opC1").value;
                var opD = document.getElementById("opD1").value;
                var answer = document.getElementById("answer1").value;
                var Explanation = document.getElementById("Explanation1").value;
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
                        if (quesType === "PHOTO TYPE QUESTION" || quesType === "BOTH TYPES") {
                            if (controls[i].files.length != 0)
                            {
                                ans = ans + controls[i].name + ": " + controls[i].files[0].name + "\n";
                                formdata.append(controls[i].name, controls[i].files[0]);
                            } else
                            {
                                flag = 2;
                            }
                        } else {

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
//                if (quesType === "PHOTO TYPE QUESTION" || quesType === "BOTH TYPES")
//                {
//                    if (quesImage == "") {
//                        alert("select question image");
//                    } else {
//
//                    }
//                }
                if (quesTitle == "")
                {
                    alert("enter course title");
                } else if (opA == "")
                {
                    alert("enter option A");
                } else if (opB == "")
                {
                    alert("enter option B");
                } else if (opC == "")
                {
                    alert("enter option C");
                } else if (opD == "")
                {
                    alert("enter option D");
                } else if (answer == "")
                {
                    alert("enter answer");
                } else if (Explanation == "")
                {
                    alert("enter explanation");
                } else if (flag == 1)
                {
                    alert("Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("select question image");
                } else
                {
                    //alert(ans);
                    // alert(formdata);

                    var xhr = new XMLHttpRequest();

                    xhr.open("POST", "./editquestion", true);
                    //for response receiving
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            var res = xhr.responseText.trim();
                            if (res == 'success')
                            {
                                alert('Question Edited Successfully');
                                $("#mymodaleditquestion").trigger('reset');
                                $("#mymodaleditquestion").modal('hide');

                                fetchquestion();
                            } else
                            {
                                alert('Question update failed');
                                $("#mymodaleditquestion").trigger('reset');
                                $("#mymodaleditquestion").modal('hide');

                                fetchquestion();
                            }

                        }
                    };

                    xhr.send(formdata);
                }


            }
        </script>
    </head>
    <body onload="fetchcourse1()" >
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

        <div class="container" >
            <label style="padding-left: 120px;"><h1>MANAGE QUESTIONS</h1></label><label style="padding-left: 190px;"><button type="button" class="main-button" id="myBtn2" onclick="fetchcourse()">ADD QUESTION</button></label>
            <br>
            <br>
            <h4>View Questions :</h4>
            <div>
                <div  class="form-group" >
                    <label>Select Course</label><select class="form-control" id="course1" name="course1" onchange="fetchsection1()">
                    </select>
                </div>
                <div  class="form-group" >
                    <label>Select Section</label><select class="form-control" id="section1" name="section1" onchange="fetchquestion()">
                    </select>
                </div>
            </div>

            <br>
            <div id="d1" class="container-fluid"></div>
            <label id="res"></label><br>

            <!-- Modal for add question -->
            <div id="myModal11" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">ADD QUESTION</h4>
                        </div>
                        <div class="modal-body">


                            <form class="form-horizontal" id="form1" name="form1">
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >QUESTION TYPE</label>
                                    <select  id="quesType" name="quesType" onclick="ttq()">
                                        <option value="--SELECT--">--SELECT--</option>
                                        <option value="TEXT TYPE QUESTION">TEXT TYPE QUESTION</option>
                                        <option value="PHOTO TYPE QUESTION">PHOTO TYPE QUESTION</option>
                                        <option value="BOTH TYPES">BOTH TYPES</option>
                                    </select>

                                </div>
                                <br>

                                <div class="form-group" id="text"  >
                                    <label class="control-label col-sm-3" >QUESTION TEXT</label>
                                    <div class="col-sm-9">
                                        <textarea  rows="5" cols="5" id="quesTitle" name="quesTitle" class="input form-control" placeholder="Enter Question"></textarea>

                                    </div>
                                </div>

                                <div class="form-group" id="image" >
                                    <label class="control-label col-sm-3" >QUESTION IMAGE</label>
                                    <div class="col-sm-9">
                                        <input type="file" id="quesImage"  name="quesImage" accept="image/*" onchange="readandpreview(this, 'ques')" class="input form-control" /><br>
                                        <img src="" id="ques" style="width: 350px;height: 200px;" >

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION A.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opA" name="opA" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION B.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opB" name="opB" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION C.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opC" name="opC" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION D.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opD" name="opD" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >.ANSWER.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="answer" name="answer" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >Explanation</label>
                                    <div class="col-sm-9">
                                        <textarea  rows="5" cols="5" id="Explanation" name="Explanation" class="input form-control" ></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >SELECT COURSE::</label>
                                    <div class="col-sm-9">
                                        <select id="course" name="course" onchange="fetchsection()">

                                        </select>                                
                                    </div>
                                </div>
                                <label id="l2"></label>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >SELECT SECTION::</label>
                                    <input type="hidden" name="h1"  id="h1" />
                                    <div class="col-sm-9">
                                        <select id="section" name="section" onchange="setsid(this.value)">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label id="l2" style="display: none;"></label>
                                </div>
                                <input type="button" class="main-button icon-button" id="addquestion" name="addquestion" value="ADD QUESTION"  onclick="hello()"/>
                                <br><br>
                            </form>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="close" name="close" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>

            </div>
            <!-- Modal for edit question -->
            <div id="mymodaleditquestion" class="modal fade" role="dialog"  >
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content" >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit QUESTION</h4>
                        </div>
                        <div class="modal-body">

                            <form class="form-horizontal" id="form2" name="form2" >
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >QUESTION TYPE</label>
                                    <div class="col-sm-9">

                                        <input type="text" id="quesType1" name="quesType1" class="input form-control" readonly/>
                                    </div>

                                </div>
                                <br>

                                <div class="form-group" id="text1"  >
                                    <label class="control-label col-sm-3" >QUESTION TEXT</label>
                                    <div class="col-sm-9">
                                        <textarea  rows="5" cols="5" id="quesTitle1" name="quesTitle1" class="input form-control" placeholder="Enter Question"></textarea>

                                    </div>
                                </div>
                                <input type="hidden" id="qid1" name="qid1" />

                                <div class="form-group" id="image1" >
                                    <label class="control-label col-sm-3" >QUESTION IMAGE</label>
                                    <div class="col-sm-9">
                                        <input type="file" id="ques"  name="ques" accept="image/*" onchange="readandpreview(this, 'quesImage1')" class="input form-control" />
                                        <img src="" id="quesImage1" style="width: 350px;height: 200px;" >

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION A.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opA1" name="opA1" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION B.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opB1" name="opB1" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION C.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opC1" name="opC1" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >OPTION D.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="opD1" name="opD1" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >.ANSWER.</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="answer1" name="answer1" class="input form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3" >Explanation</label>
                                    <div class="col-sm-9">
                                        <textarea  rows="5" cols="5" id="Explanation1" name="Explanation1" class="input form-control" placeholder="Enter Explanation"></textarea>

                                    </div>
                                </div>

                                <label id="l2"></label>

                                <input type="hidden" id="sname11" name="sname11" />
                                <input type="hidden" id="qid1" name="qid1" />


                                <div class="form-group">
                                    <label id="l2" style="display: none;"></label>
                                </div>
                                <input type="button" class="main-button icon-button" id="editquestion" name="editquestion" value="EDIT QUESTION"  onclick="hello2()"/>
                                <br><br>
                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="close" name="close" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>

            </div> 
        </div>
        <%@include file="zFooter.jsp" %>
    </body>
</html>
