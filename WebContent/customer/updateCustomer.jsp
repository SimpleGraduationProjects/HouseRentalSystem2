<%@ page language="java" pageEncoding="UTF-8" %>
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
<script language="javascript">
</script>
</head>

<body>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default wk-panel ">
            <div class="panel-heading">
                客户信息修改
            </div>
            <form action="<%=path %>/editCustomer/${customer.id}.do" name="formAdd" method="post">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label wk-filed-label">登录用户名：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="loginname" size="20"
                                           value="${customer.loginname}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">密码：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="loginpassword" size="20"
                                           value="${customer.loginpassword}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">客户姓名：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="name"
                                           size="20" value="${customer.name}"/>

                                </div>
                            </div><br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">性别：
                                </label>
                                <div class="input-group">

                                    <input required="required" type="radio"
                                           name="sex"
                                           value="男"

                                            <c:if test="${customer.sex=='男'}">
                                                checked="checked"
                                            </c:if>

                                    />男
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input required="required" type="radio"
                                           name="sex"
                                           value="女"
                                            <c:if test="${customer.sex=='女'}">
                                                checked="checked"
                                            </c:if>
                                    />女
                                </div>
                            </div><br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">年龄：
                                </label>
                                <div class="input-group">
                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="age"
                                           size="20" value="${customer.age}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">联系电话：
                                </label>
                                <div class="input-group">
                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="tel"
                                           size="20" value="${customer.tel}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">备注：
                                </label>
                                <div class="input-group">
                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="info"
                                           size="20" value="${customer.info}"/>
                                </div>
                            </div>
                            <input class="form-control wk-long-2col-input" required="required" type="hidden"
                                   name="zhiwei"
                                   value="1"
                                   size="20"/>
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
<script src="resource/js/jquery.min.js"></script><!--jquery框架-->
<!--弹窗插件-->

</body>
</html>