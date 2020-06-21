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


    <section class="flat-row pd-contact-v2">
        <div class="container">
            <div class="row">
                <!--左栏-->

                <div class="col-md-12 " style="padding-left:100px;margin-top: 60px">

                    <div class="course">
                        <div class="lay4">

                            <form class="form-horizontal" action="<%=path %>/regSave.do" method="post" id="myForm">


                                <div class="form-group">
                                    <label class="col-xs-5 control-label">
                                        用户名：
                                    </label>
                                    <div class="col-xs-4">
                                        <input class="form-control" required value=""
                                               id='loginname' style="WIDTH: 170px"
                                               type='text' name='loginname'
                                        >

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">
                                        密码：
                                    </label>
                                    <div class="col-xs-4">
                                        <input class="form-control" required value=""
                                               id='loginpassword' style="WIDTH: 170px"
                                               type='password' name='loginpassword'
                                        >

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">
                                        确认密码：
                                    </label>
                                    <div class="col-xs-4">
                                        <input class="form-control" required value=""
                                               id='loginpassword_1' style="WIDTH: 170px"
                                               type='password' name='loginpassword_1'
                                        >

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">客户姓名：</label>
                                    <div class="col-xs-4">


                                        <input class="form-control" required value=""
                                               id='name' style="WIDTH: 170px"
                                               type='text' name='name'
                                        >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">性别：</label>
                                    <div class="col-xs-4">

                                        <input required="required" type="radio" name="sex"
                                               value="男"


                                               checked="checked"


                                        />男
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input required="required" type="radio" name="sex"
                                               value="女"

                                        />女

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-5 control-label">年龄：</label>
                                    <div class="col-xs-4">


                                        <input class="form-control" required value=""
                                               id='age' style="WIDTH: 170px"
                                               type='text' name='age'
                                        >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">联系电话：</label>
                                    <div class="col-xs-4">


                                        <input class="form-control" required value=""
                                               id='tel' style="WIDTH: 170px"
                                               type='text' name='tel'
                                        >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">备注：</label>
                                    <div class="col-xs-4">


                                        <input class="form-control" required value=""
                                               id='info' style="WIDTH: 170px"
                                               type='text' name='info'
                                        >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-8 col-xs-offset-2 text-center">
                                        <button class="btn btn-primary" type="submit">注册</button>

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
