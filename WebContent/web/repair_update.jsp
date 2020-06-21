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

                            <form class="form-horizontal" action="<%=path %>/webEditRepair/${repair.id}.do" method="post" id="myForm">
                                <input type="hidden" name="repairstatus" value="${repair.repairstatus}">

                                <input type="hidden" name="createTime" value="<fmt:formatDate value="${repair.createTime}" pattern="yyyy-MM-dd"/>">
                                <input type="hidden" name="customer_id" value="0">
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">
                                        房屋：
                                    </label>
                                    <div class="col-xs-4">

                                        <select name="roomId">
                                            <option value="${repair.roomId}">${repair.roomName}
                                            </option>

                                            <c:forEach items="${room}" var="room">

                                                <option value="${room.id}"> ${room.allname}</option>
                                            </c:forEach> </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-5 control-label">报修名称：</label>
                                    <div class="col-xs-4">

                                        <input type=hidden name=reg_type value=person>
                                        <input class="form-control" required value="${repair.title}"
                                               id='title' style="WIDTH: 170px"
                                               type='text' name='title'
                                        >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-5 control-label">故障描述：</label>
                                    <div class="col-xs-4">

                                        <input type=hidden name=reg_type value=person>
                                        <input class="form-control" required value="${repair.info}"
                                               id='info' style="WIDTH: 170px"
                                               type='text' name='info'
                                        >
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-xs-8 col-xs-offset-2 text-center">
                                        <button class="btn btn-primary" type="submit">提交</button>

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
