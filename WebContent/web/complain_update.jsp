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



<form action="<%=path %>/webEditComplain/${complain.id}.do" name="formAdd" method="post">
 



                    <input type="hidden" name="customer_id" value="${complain.customer_id}">
                    <input type="hidden" name="createTime" value="<fmt:formatDate value="${complain.createTime}" pattern="yyyy-MM-dd"/>">
                 
                    <div class="form-group">
                                    <label class="col-xs-5 control-label"> 标题：
                                    </label>
                                    <div class="col-xs-4">   <input required="required" type="text"
                                   name="title"
                                   size="20"
                                   value="${complain.title}"/>
                        </div>
                                </div>

                    <input type="hidden" name="complainstatus" value="${complain.complainstatus}">
                    

                   <div class="form-group">
                                    <label class="col-xs-5 control-label">
                                        投诉内容：
                        </label>
                                    <div class="col-xs-4"><input required="required" type="text"
                                                                              name="info"
                                                                              size="20"
                                                                              value="${complain.info}"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-xs-8 col-xs-offset-2 text-center">
                                        <button class="btn btn-primary" type="submit">提交</button>

                                    </div>
                                </div>
                            </form>
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
