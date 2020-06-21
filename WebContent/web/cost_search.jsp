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

                <div class="col-md-12  ">
                    <table class="table">
                        <thead>
                        <tr align="center" bgcolor="#FAFAF1" height="22">
                            <th data-halign="center" data-align="center">缴费房屋</th>
                            <th data-halign="center" data-align="center">客户姓名</th>
                            <th data-halign="center" data-align="center">时间</th>
                            <th data-halign="center" data-align="center">缴费名称</th>
                            <th data-halign="center" data-align="center">数量</th>
                            <th data-halign="center" data-align="center">单价</th>
                            <th data-halign="center" data-align="center">总价</th>
                            <th data-halign="center" data-align="center">支付方式</th>
                            <th data-halign="center" data-align="center">支付状态</th>
                            <th data-halign="center" data-align="center">操作</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listData}" var="cost">
                            <tr>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.roomName}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.customerName}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                    <fmt:formatDate value="${cost.createTime}" pattern=" MM月dd日 E"/>
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.costname}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.costnumber}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.price}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.money}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.paytype}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${cost.info}
                                </td>

                                <td bgcolor="#FFFFFF" align="center">
                                    <script language="javascript">
                                        function pay_id(id) {
                                            if (confirm('您确定支付吗？')) {
                                                window.location.href = "<%=path %>/webPayCost/" + id + ".do";
                                            }
                                        }

                                        function return_id(id) {
                                            if (confirm('您确定退款吗？')) {
                                                window.location.href = "<%=path %>/webReturnCost/" + id + ".do";
                                            }
                                        }


                                    </script>

                                    <c:if test="${cost.info eq '待支付'}">
                                        <input type="button" class="btn btn-primary btn-sm" value="在线支付"
                                               onclick="pay_id(${cost.id})"/>
                                    </c:if>
                                    <c:if test="${cost.info eq '已支付'}">
                                    <input type="button" class="btn btn-primary btn-sm" value="退款"
                                           onclick="return_id(${cost.id})"/>
                                    </c:if>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <table width=100%' border='0' style="margin-top:8px;">
                        <TR align="right">
                            <td bgcolor="#FFFFFF" align="center">
                                <form action="" method="post" name="formpage">
                                    <input type="hidden" name="pageCount" value="${pager.pageCount}"/>
                                    <!--//用于给上面javascript传值-->
                                    <input type="hidden" name="page" value="${pager.pageNumber}"/>
                                    <!--//用于给上面javascript传值-->
                                    <input type="hidden" name="jumpurl" value="<%=path%>/webSearchCost.do?"/>
                                    <!--//用于给上面javascript传值-->
                                    <a href="javascript:void(0)" onClick="PageTop()"><strong>首页</strong></a>&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:void(0)" onClick='PagePre()'><strong>上一页</strong></a>&nbsp;&nbsp;&nbsp;
                                    共${pager.rowCountTotal}条记录,
                                    共计${pager.pageCount}页,
                                    当前第${pager.pageNumber}页&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:void(0)" onClick="PageNext()"><strong>下一页</strong></a>&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:void(0)" onClick="PageLast()"><strong>尾页</strong></a>
                                </form>
                                <script type="text/javascript" src="<%=path%>/resource/js/page.js"></script>
                            </TD>
                        </TR>
                    </table>
                </div>


            </div>
        </div>
    </section>


    <jsp:include page="foot.jsp"></jsp:include>
</div>
</body>
</html>
