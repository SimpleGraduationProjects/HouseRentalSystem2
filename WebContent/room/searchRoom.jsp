<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
<script type="text/javascript" src="<%=path %>/resource/js/popup.js"></script>


</head>

<body>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default wk-panel wk-table-tools-panel">
            <div class="panel-heading">
                房屋列表
            </div>

            <form action="<%=basePath%>searchRoom.do" method="POST"
                  onsubmit="return check()">

                <div class="row">
                    <div class="form-inline">
                        <div class="col-md-2">
                            <div class="input-group  ">
                                <select name="floor_id" id="floor_id">

                                    <option value="0">请选择</option>
                                    <c:forEach items="${floor}" var="floor">

                                        <option value="${floor.id}"
                                                <c:if test="${floor_id==floor.id}">selected</c:if>
                                        > ${floor.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="input-group  ">
                                <input name="keyword" value="${keyword}" id="keyword" type="text" class="form-control  "
                                       placeholder="请输入关键字">
                                <div class="input-group-btn">
                                    <script type="text/javascript">


                                    </script>

                                    <button type="submit" class="btn btn-white">
                                        搜索
                                    </button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div><!--工具框   结束-->


    <!--  内容列表   -->


    <!--  内容列表   -->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default  wk-panel">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr class="title">
                        <th data-halign="center" data-align="center">客户姓名</th>
                        <th data-halign="center" data-align="center">楼名称</th>
                        <th data-halign="center" data-align="center">楼层</th>
                        <th data-halign="center" data-align="center">房号</th>
                        <th data-halign="center" data-align="center">户型</th>
                        <th data-halign="center" data-align="center">面积</th>
                        <th data-halign="center" data-align="center">备注</th>
                        <th data-halign="center" data-align="center">照片</th>
                        <th data-halign="center" data-align="center">选项</th>
                    </tr>
                    </thead>
                    <c:forEach items="${listData}" var="room">
                    <tr>
                        <td bgcolor="#FFFFFF" align="center">
                                ${room.customerName}
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                                ${room.floorName}
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                                ${room.unit}
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                                ${room.house}
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                                ${room.name}
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                                ${room.standard}
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                                ${room.info}
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                            <c:if test="${room.photo!=''&&room.photo!=null}">
                                <a style="color: red" href="javascript:void(0)" onclick="photo(${room.id})">房屋图片</a>
                            </c:if>
                        </td>
                        <td bgcolor="#FFFFFF" align="center">
                            <input type="button" class="btn btn-primary btn-sm" value="修改"
                                   onclick="update_id(${room.id})"/>
                            <input type="button" class="btn btn-primary btn-sm" value="删除"
                                   onclick="delete_id(${room.id})"/>
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
                        <input type="hidden" name="jumpurl" value="<%=path%>/searchRoom.do?"/>
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
                    window.location.href = "<%=path %>/deleteRoom/" + id + ".do";
                }
            }


            function photo(id) {
                var url = "<%=path %>/getRoomPhoto/" + id + ".do";
                var pop = new Popup({contentType: 1, isReloadOnClose: false, width: 400, height: 300});
                pop.setContent("contentUrl", url);
                pop.setContent("title", "");
                pop.build();
                pop.show();
            }

            function update_id(id) {
                window.location.href = "<%=path %>/updateRoom/" + id + ".do";
            }


        </script>
</body>
</html>