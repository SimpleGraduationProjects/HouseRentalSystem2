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
        <div class="panel panel-default wk-panel ">
            <div class="panel-heading">
                修改部门信息
            </div>
            <form action="<%=basePath%>editDept/${dept.id}.do" method="POST">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label wk-filed-label">部门名称: </label>
                                <div class="input-group">
                                    <input class="form-control wk-long-2col-input" required="required"
                                           value="${dept.name}" name="name" type="text"
                                           class="form-control wk-long-2col-input" placeholder="请输入部门名称"/>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="panel-footer wk-panel-footer">
                    <button type="submit" class="btn btn-default wk-btn">修&nbsp;&nbsp;改</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>