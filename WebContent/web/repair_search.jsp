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

    <script language="javascript">
        function delete_id(id) {
            if (confirm('您确定删除吗？')) {
                window.location.href = "<%=path %>/webDeleteRepair/" + id + ".do";
            }
        }


        function update_id(id) {
            window.location.href = "<%=path %>/webUpdateRepair/" + id + ".do";
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

                <div class="col-md-12  ">
                    <table class="table">
                        <thead>
                       <%-- <tr align="center" bgcolor="#FAFAF1" height="22">
                            <th data-halign="center" data-align="center">报修房屋</th>
                            <th data-halign="center" data-align="center">客户姓名</th>
                            <th data-halign="center" data-align="center">时间</th>
                            <th data-halign="center" data-align="center">报修名称</th>
                            <th data-halign="center" data-align="center">状态</th>


                            <th data-halign="center" data-align="center">故障描述</th>
                            <th data-halign="center" data-align="center">选项</th>

                        </tr>--%>
                        </thead>
                        <tbody>
                        <c:forEach items="${listData}" var="repair">
                            <tr>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${repair.roomName}
                                </td>

                                <td bgcolor="#FFFFFF" align="center">
                                        ${repair.customerName}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                    <fmt:formatDate value="${repair.createTime}" pattern=" MM月dd日 E"/>
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${repair.title}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${repair.repairstatus}
                                </td>


                                <td bgcolor="#FFFFFF" align="center">
                                        ${repair.info}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                    <c:if test="${repair.repairstatus!='已处理'}">
                                        <input type="button" class="btn btn-primary btn-sm" value="修改"
                                               onclick="update_id(${repair.id})"/>
                                        <input type="button" class="btn btn-primary btn-sm" value="删除"
                                               onclick="delete_id(${repair.id})"/>
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
                                    <input type="hidden" name="jumpurl" value="<%=path%>/webSearchRepair.do?"/>
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