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
    <title>首页</title>

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
    <%-- <section class="flat-row flat-callback">
         <div class="container">
             <div class="row">

                 <div class="col-md-12">
                     <div class="text-block-callback">
                         <h2>我致力于让用电变得更简单</h2>
                         <div class="text-callback-content">电气我们最在行</div>
                     </div>

                 </div>


             </div>

         </div>

     </section>--%>

    <section class="flat-row flat-iconbox bg-theme">
        <div class="container">

            <div class="row">

                <div class="col-md-12">

                    <!--左首屏-->
                    <%--<div class="title-section left">
                        <h2>网站新闻</h2>
                    </div>--%>
                    <c:forEach items="${newsList}" var="var" varStatus="i" begin="0" end="8">

                        <div class="col-md-4" style="margin-top: 100px">
                            <div class="iconbox-item">
                                <div class="iconbox style1">
                                    <div class="box-header">
                                        <div class="icon-rounded ion-clipboard"></div><!-- 图标 -->

                                        <div class="box-title">
                                            <a href="webSearchNewsInfo/${var.id}.do"><span
                                                    style=" color:#666;   font-weight:bold;">
                             <c:if test="${fn:length(var.title)>10 }">${ fn:substring( var.title ,0,10)} ...</c:if>
                                            <c:if test="${fn:length(var.title)<=10 }">${  var.title } </c:if>


                    </span></a>
                                        </div>

                                    </div>

                                    <div class="box-content"><fmt:formatDate value="${var.createTime}"
                                                                             pattern="MM月dd日 "/>
                                    </div>

                                </div>

                            </div>

                        </div>


                    </c:forEach>


                </div>


            </div>


        </div>

    </section>


    <jsp:include page="foot.jsp"></jsp:include>
</div>
</body>
</html>
