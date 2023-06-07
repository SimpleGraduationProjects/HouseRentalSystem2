<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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

</head>


<body>
<div class="boxed">

    <!--头---------------------------------------------------------------------------------------------->
    <jsp:include page="top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->
    <div class="page-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-title-heading">
                        <h1 class="h1-title">
                            <STRONG>欢迎登陆
                            </STRONG>
                        </h1>
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
        </div>
    </div>


    <section class="flat-row pd-contact-v2">
        <div class="container">
            <div class="row">
                <!--左栏-->

                <div class="col-md-12 " style="padding-left:100px;margin-top: 60px">

                    <div class="course">
                        <div class="lay4">

                            <form class="form-horizontal" action="<%=basePath%>webCustomerLogin.do" method="post" id="myForm">

                                <div class="form-group">
                                    <label class="col-xs-5 control-label">
                                        用户名：
                                    </label>
                                    <div class="col-xs-4">

                                        <input class="form-control" id='loginname' required
                                               style="WIDTH: 170px" name='loginname'
                                               onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                               onkeyup="value=value.replace(/[\W]/g,'')">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">密 码：</label>
                                    <div class="col-xs-4">

                                        <input type=hidden name=reg_type value=person>
                                        <input class="form-control" required
                                               id='loginpassword' style="WIDTH: 170px"
                                               type='password' name='loginpassword'
                                        >
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-xs-8 col-xs-offset-2 text-center">
                                        <button class="btn btn-primary" type="submit">登录</button>

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
