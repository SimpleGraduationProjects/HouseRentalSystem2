<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<base href="<%=basePath%>">
<title></title>
<script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="resource/css/login.css"/>
</head>

<body class="loginBody">
<form action="<%=basePath%>userLogin.do" method="POST">
    <div class="login">
        <div class="loginHeader">房屋租赁管理系统</div>
        <ul>
            <li><input required="required" type="text" name="account" placeholder="请输入账户名" value="admin"/></li>
            <li><input required="required" type="password" name="password" placeholder="请输入登录密码" value="111111"/></li>
            <li>
                <select name="roleId">
                    <option value="0">管理员</option>
                    <option value="1">缴费管理员</option>
                    <option value="2">维修管理员</option>
                </select>
            </li>
        </ul>
        <div class="loginTip">
            * ${info}&nbsp;&nbsp;

        </div>
        <input type="submit" class="loginSubmitBtn" value="登录"/>
    </div>
</form>

</body>
</html>
