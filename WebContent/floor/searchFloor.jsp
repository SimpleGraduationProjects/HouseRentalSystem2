<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
<script type="text/javascript" src="resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resource/css/wukong-ui.css">
<link rel="stylesheet" href="resource/bootstrap/css/bootstrap-select.min.css">
<script type="text/javascript" src="resource/bootstrap/js/bootstrap-select.min.js"></script>
</head>

<body>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default wk-panel wk-table-tools-panel">
            <div class="panel-heading">
                地址列表
            </div>

        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default  wk-panel">
            <table class="table table-striped table-hover">
                <thead>
                <tr class="title">
                    <th data-halign="center" data-align="center">地址</th>
                    <th data-halign="center" data-align="center">经度</th>
                    <th data-halign="center" data-align="center">纬度</th>
                    <th data-halign="center" data-align="center">介绍</th>
                    <th data-halign="center" data-align="center">选项</th>
                </tr>
                </thead>
                <c:forEach items="${listData}" var="floor">
                <tr>
                    <td bgcolor="#FFFFFF" align="center">
                            ${floor.name}
                    </td>

                    <td bgcolor="#FFFFFF" align="center">
                            ${floor.addressLat}
                    </td>

                    <td bgcolor="#FFFFFF" align="center">
                            ${floor.addressLon}
                    </td>

                    <td bgcolor="#FFFFFF" align="center">
                            ${floor.info}
                    </td>
                    <td bgcolor="#FFFFFF" align="center">
                        <input type="button" class="btn btn-primary btn-sm" value="修改"
                               onclick="update_id(${floor.id})"/>
                        <input type="button" class="btn btn-primary btn-sm" value="删除"
                               onclick="delete_id(${floor.id})"/>
                    </td>
                </tr>
                </c:forEach>
        </div>
    </div>
    <table width='98%' border='0' style="margin-top: 8px; margin-left: 5px;">


        <TR align="right">
            <td bgcolor="#FFFFFF" align="center">
                <form action="" method="post" name="formpage">
                    <input type="hidden" name="pageCount" value="${pager.pageCount}"/>
                    <!--//用于给上面javascript传值-->
                    <input type="hidden" name="page" value="${pager.pageNumber}"/>
                    <!--//用于给上面javascript传值-->
                    <input type="hidden" name="jumpurl" value="<%=path%>/searchFloor.do?"/>
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
    <script src="resource/js/jquery.min.js"></script><!--jquery框架-->
    <!--弹窗插件-->

    <script language="javascript">
        function delete_id(id) {
            if (confirm('您确定删除吗？')) {
                window.location.href = "<%=path %>/deleteFloor/" + id + ".do";
            }
        }

        function update_id(id) {
            window.location.href = "<%=path %>/updateFloor/" + id + ".do";
        }


    </script>

</body>
</html>