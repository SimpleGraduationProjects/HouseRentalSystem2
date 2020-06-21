<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp">
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
                列表
            </div>
            <form action="<%=basePath%>searchUser.do" method="POST"
                  onsubmit="return check()">


                <div class="panel-body">

                    <div class="row">
                        <div class="form-inline">
                            <div class="col-md-2">
                                <div class="input-group  ">
                                    <input name="keyword" value="${keyword}" id="keyword" type="text"
                                           class="form-control  "
                                           placeholder="请输入关键字">
                                    <div class="input-group-btn">
                                        <script type="text/javascript">

                                            function check() {
                                                var keyword = $("#keyword").val();

                                                if (keyword == null || keyword == "") {
                                                    alert("请输入关键字");
                                                    return false;

                                                }

                                                return true;

                                            }
                                        </script>

                                        <button type="submit" class="btn btn-white">
                                            搜索
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default  wk-panel">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr class="title">
                        <th data-halign="center" data-align="center">管理员编号</th>
                        <th data-halign="center" data-align="center">姓名</th>
                        <th data-halign="center" data-align="center">性别</th>
                        <th data-halign="center" data-align="center">所属部门</th>
                        <th data-halign="center" data-align="center">联系电话</th>
                        <th data-halign="center" data-align="center">联系地址</th>
                        <th data-halign="center" data-align="center">身份证号</th>
                        <th data-halign="center" data-align="center">登录账号</th>
                        <th data-halign="center" data-align="center">登录密码</th>
                        <th data-halign="center" data-align="center">权限</th>
                        <th data-halign="center" data-align="center">操作</th>
                    </tr>
                    </thead>

                    <c:forEach items="${listData}" var="var">
                    <tr>
                        <td bgcolor="#FFFFFF" align="center">${var.number}</td>
                        <td bgcolor="#FFFFFF" align="center">${var.name}</td>
                        <td bgcolor="#FFFFFF" align="center">${var.genderName}</td>
                        <td bgcolor="#FFFFFF" align="center">${var.deptName}</td>

                        <td bgcolor="#FFFFFF" align="center">${var.telphone}</td>
                        <td bgcolor="#FFFFFF" align="center">${var.address}</td>
                        <td bgcolor="#FFFFFF" align="center">${var.idCardNo}</td>
                        <td bgcolor="#FFFFFF" align="center">${var.account}</td>
                        <td bgcolor="#FFFFFF" align="center">${var.password}</td>
                        <td bgcolor="#FFFFFF" align="center">

                            <c:if test="${var.roleId=='0'}">
                                超级管理员
                            </c:if>

                            <c:if test="${var.roleId=='1'}">
                                缴费管理员
                            </c:if>

                            <c:if test="${var.roleId=='2'}">
                                维修管理员
                            </c:if>


                        </td>
                        <td bgcolor="#FFFFFF" align="center">


                            <a id="updateBtn" href="javascript:;" onclick="update_id(${var.id})">编辑</a>


                            <c:if test="${user_session.roleId=='0'}">
                                <a id="deleteBtn" href="javascript:;" onclick="delete_id(${var.id})">删除</a>
                            </c:if>

                        </td>
                    </tr>
                    </c:forEach>


            </div>
        </div>


        <table width='100%' border='0' style="margin-top: 8px;  ">
            <TR align="right">
                <td bgcolor="#FFFFFF" align="center">
                    <form action="" method="get" name="formpage">
                        <input type="hidden" name="pageCount" value="${pager.pageCount}"/>
                        <!--//用于给上面javascript传值-->
                        <input type="hidden" name="page" value="${pager.pageNumber}"/>
                        <!--//用于给上面javascript传值-->
                        <input type="hidden" name="jumpurl" value="searchUser.do?"/>
                        <!--//用于给上面javascript传值-->
                        <a href="javascript:;" onClick="PageTop()"><strong>首页</strong></a>&nbsp;&nbsp;&nbsp;
                        <a href="javascript:;" onClick='PagePre()'><strong>上一页</strong></a>&nbsp;&nbsp;&nbsp;

                        共${pager.rowCountTotal}条记录, 共计${pager.pageCount}页,
                        当前第${pager.pageNumber}页&nbsp;&nbsp;&nbsp;
                        <a href="javascript:;" onClick="PageNext()"><strong>下一页</strong></a>&nbsp;&nbsp;&nbsp;

                        <a href="javascript:;" onClick="PageLast()"><strong>尾页</strong></a>
                    </form>
                    <script type="text/javascript" src="resource/js/page.js"></script>
                </TD>
            </TR>
        </table>


        <script src="resource/js/jquery.min.js"></script><!--jquery框架-->
        <!--弹窗插件-->


        <script>

            function delete_id(id) {

                if (id != "") {
                    if (confirm('您确定删除吗？')) {
                        location.href = "<%=basePath%>deleteUser/" + id + ".do";
                    }
                }
            }


            function update_id(id) {


                if (id != "") {
                    location.href = "<%=basePath%>updateUser/" + id + ".do";
                }
            }


        </script>
</body>
</html>