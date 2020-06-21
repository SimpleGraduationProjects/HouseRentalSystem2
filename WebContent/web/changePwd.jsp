<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<!--[if IE 8 ]>
<html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->

<head>
    <base href="<%=basePath%>">

    <meta charset="UTF-8">
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="web/stylesheet/bootstrap.css"><!--bootstrap框架-->
    <link rel="stylesheet" type="text/css" href="web/stylesheet/style.css"><!--网站主框-->
    <link rel="stylesheet" type="text/css" href="web/stylesheet/responsive.css"><!--自适应屏幕大小使用-->

    <!-- Animation Style -->
    <link rel="stylesheet" type="text/css" href="web/stylesheet/animate.css">
    <script>


        function updateBtnOK() {
            var password = "${customer_session.loginpassword}";//数据库的旧密码
            var id = "${customer_session.id}";//
            var new_password = $("#new_password").val();
            var new_password_1 = $("#new_password_1").val();
            var old_password = $("#old_password").val();//输入的旧密码

            if (new_password_1 == '' || new_password == '') {
                alert("新密码必须输入");
                return false;
            } else if (password != old_password) {
                alert("旧密码不正确");
                return false;
            } else if (new_password_1 != new_password) {
                alert("新密码两次输入要相同");
                return false;
            } else {
                $("#passwordForm").attr("action", "<%=basePath%>webUpdatePassword/" + id + ".do");
                $("#passwordForm").submit();
            }
        }


    </script>

</head>


<body>
<div class="boxed">

    <!--头---------------------------------------------------------------------------------------------->
    <jsp:include page="top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <section class="flat-row pd-contact-v2">
        <div class="container">
            <div class="row">
                <!--左栏-->

                <div class="col-md-12 " style="padding-left:100px;margin-top: 60px">

                    <div class="course">
                        <div class="lay4">

                            <form class="form-horizontal"  id="passwordForm"  method="post"  >

                                <div class="form-group">
                                    <label class="col-xs-5 control-label">
                                        旧&nbsp 密&nbsp 码：
                                    </label>
                                    <div class="col-xs-4">

                                        <input class="form-control" id='old_password' required value=""
                                               style="WIDTH: 170px" name='old_password'
                                               type="password"
                                               >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">新&nbsp 密&nbsp 码：</label>
                                    <div class="col-xs-4">

                                        <input type=hidden name=reg_type value=person>
                                        <input class="form-control" required value=""
                                               id='new_password' style="WIDTH: 170px"
                                               type='password' name='new_password'
                                        >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">确认密码：</label>
                                    <div class="col-xs-4">

                                        <input type=hidden name=reg_type value=person>
                                        <input class="form-control" required value=""
                                               id='new_password_1' style="WIDTH: 170px"
                                               type='password' name='new_password_1'
                                        >
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-xs-8 col-xs-offset-2 text-center">
                                        <button  onclick="updateBtnOK()"  class="btn btn-primary" type="submit">提交</button>

                                    </div>
                                </div>


                            </FORM>

                        </div>

                    </div>


                </div>
                <!-- /.col-md-4 -->


            </div>

        </div>

    </section>


    <jsp:include page="foot.jsp"></jsp:include>
</div>
</body>
</html>
