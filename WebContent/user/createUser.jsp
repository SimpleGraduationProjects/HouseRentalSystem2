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
        <div class="panel panel-default wk-panel ">
            <div class="panel-heading">
                添加
            </div>
            <form action="<%=basePath%>saveUser.do" method="POST" onsubmit="return toVaild()">


                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    管理员姓名:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="name"
                                           type="text"
                                           id="name" placeholder="请输入管理员姓名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    所属部门:
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="deptId">
                                        <c:forEach items="${depts}" var="var">
                                            <option value="${var.id}">${var.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    性别:
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="gender">
                                        <option value="1">男</option>
                                        <option value="2">女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    联系电话:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="telphone"
                                           type="text"
                                           id="telphone" placeholder="请输入联系电话"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    联系地址:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="address"
                                           type="text"
                                           class="form-control " id="address" placeholder="请输入联系地址"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    身份证号:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="idCardNo"
                                           type="text"
                                           id="idCardNo" placeholder="请输入身份证号"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    所属民族:
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="nationalId">
                                        <c:forEach items="${nationals}" var="var">
                                            <option value="${var.id}">${var.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    最高学历:
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="educationId">
                                        <c:forEach items="${educations}" var="var">
                                            <option value="${var.id}">${var.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    毕业学校:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="institute"
                                           type="text"
                                           id="institute" placeholder="请输入毕业学校"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    所学专业:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="major"
                                           type="text"
                                           id="major" placeholder="请输入所学专业"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    所属权限:
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="roleId">
                                        <option value="0">超级管理员</option>
                                        <option value="1">缴费管理员</option>
                                        <option value="2">维修管理员</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    登录账号:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="account"
                                           type="text"
                                           id="account" placeholder="请输入登录账号"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    登录密码:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" name="password"
                                           type="password"
                                           id="password" placeholder="请输入登录密码"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer wk-panel-footer">
                    <button type="submit" class="btn btn-default wk-btn">创&nbsp;&nbsp;建</button>
                </div>

            </form>
        </div>
    </div>
</div>
<script>
    function toVaild() {

        //手机号验证
        var val = document.getElementById("telphone").value;
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test(val)) {
            alert("手机号码格式不对,请输入正确的手机号!");
            return false;
        } else {
            return true;
        }

        //身份证验证
        var validcar = document.getElementById("idCardNo").value;
        var myregidcar = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
        if (!myregidcar.test(validcar)) {
            alert("身份证格式不对,请输入正确的身份证!");
            return false;
        } else {
            return true;
        }


    }
</script>

</body>
</html>