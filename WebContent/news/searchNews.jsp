<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                公告列表
            </div>
            <form action="<%=basePath%>/searchNews.do" method="POST" onsubmit="return check()">
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
                                        <button class="btn btn-default  " type="submit">搜索</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default  wk-panel">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>公告标题</th>
                    <th>发布人</th>
                    <th>发布时间</th>
                    <c:if test="${user_session.roleId=='0'}">
                        <th>操作</th>
                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listData}" var="var">
                    <tr>
                        <td><a href="searchNewsInfo/${var.id}.do" target="_blank">${var.title}</a></td>
                        <td>${var.userName}</td>
                        <td><fmt:formatDate value="${var.createTime}" pattern="MM月dd日"/></td>
                        <c:if test="${user_session.roleId=='0'}">
                            <td>
                                <a id="updateBtn" href="javascript:;" onclick="update_id(${var.id})">编辑</a>
                                <a id="deleteBtn" href="javascript:;" onclick="delete_id(${var.id})">删除</a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>

        </div>
    </div>


    <table width='98%' border='0' style="margin-top: 8px; margin-left: 5px;">
        <TR align="right">
            <TD>
                <form action="" method="get" name="formpage">
                    <input type="hidden" name="pageCount" value="${pager.pageCount}"/>
                    <!--//用于给上面javascript传值-->
                    <input type="hidden" name="page" value="${pager.pageNumber}"/>
                    <!--//用于给上面javascript传值-->
                    <input type="hidden" name="jumpurl" value="searchNews.do?"/>
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

</div>
</div>
</div>

<div class="modal fade" tabindex="-1" role="dialog"
     id="deleteConfirm">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header wk-modal-header">
                <button class="close" type="button" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4>系统提示</h4>
            </div>
            <div class="modal-body">您确定要删除这些记录？</div>
            <div class="modal-footer wk-modal-footer">
                <button id="deleteBtnOK" type="submit"
                        class="btn btn-default wk-btn" data-dismiss="modal">确定
                </button>
                <button type="button" class="btn btn-default wk-tool-btn"
                        data-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<script>

    function delete_id(id) {

        if (id != "") {
            $("#deleteConfirm").modal();
            $("#deleteBtnOK").on("click", function () {
                location.href = "<%=basePath%>deleteNews/" + id + ".do";
            });
        }
    }


    function update_id(id) {


        if (id != "") {
            location.href = "<%=basePath%>updateNews/" + id + ".do";
        }
    }


</script>
</body>
</html>