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
                编辑
            </div>

            <form action="<%=basePath%>editUser/${users.id}.do" method="POST">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    管理员姓名:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required"
                                           value="${users.name}"
                                           name="name" type="text"
                                           id="name" placeholder="请输入管理员姓名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    所属部门:
                                </label>
                                <div class="input-group">

                                    <c:if test="${user_session.roleId != 0}">
                                        <input class="form-control wk-long-2col-input" name="deptId" type="hidden"
                                               value="${users.deptId}">
                                        <select

                                                disabled style="background-color: #CCCCCC"


                                        >
                                            <c:forEach items="${depts}" var="var">
                                                <c:choose>
                                                    <c:when test="${var.id == users.deptId}">
                                                        <option value="${var.id}"
                                                                selected="selected">${var.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${var.id}">${var.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${user_session.roleId == 0}">
                                        <select class="wk-select" name="deptId"


                                        >
                                            <c:forEach items="${depts}" var="var">
                                                <c:choose>
                                                    <c:when test="${var.id == users.deptId}">
                                                        <option value="${var.id}"
                                                                selected="selected">${var.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${var.id}">${var.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </c:if>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别:
                                </label>
                                <div class="input-group">
                                    <select class="wk-select" name="gender">
                                        <c:choose>
                                            <c:when test="${1 == users.gender}">
                                                <option value="1" selected="selected">男</option>
                                                <option value="2">女</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="1">男</option>
                                                <option value="2" selected="selected">女</option>
                                            </c:otherwise>
                                        </c:choose>

                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    联系电话:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required"
                                           value="${users.telphone}" name="telphone" type="text"
                                           id="telphone" placeholder="请输入联系电话"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    联系地址:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required"
                                           value="${users.address}" name="address" type="text"
                                           id="address" placeholder="请输入联系地址"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    身份证号:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required"
                                           value="${users.idCardNo}" name="idCardNo" type="text"
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
                                            <c:choose>
                                                <c:when test="${var.id == users.nationalId}">
                                                    <option value="${var.id}"
                                                            selected="selected">${var.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${var.id}">${var.name}</option>
                                                </c:otherwise>
                                            </c:choose>
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
                                            <c:choose>
                                                <c:when test="${var.id == users.educationId}">
                                                    <option value="${var.id}"
                                                            selected="selected">${var.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${var.id}">${var.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    毕业学校:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input"
                                           required="required"
                                           value="${users.institute}"
                                           name="institute" type="text"
                                           id="institute" placeholder="请输入毕业学校"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    所学专业:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input"
                                           required="required"
                                           value="${users.major}" name="major"
                                           type="text"
                                           id="major" placeholder="请输入所学专业"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    所属权限:
                                </label>
                                <div class="input-group">

                                    <c:if test="${user_session.roleId != 0}">
                                        <input class="form-control wk-long-2col-input"
                                               name="roleId"
                                               type="hidden" value="${users.roleId}">
                                        <select
                                                disabled

                                                style="background-color: #CCCCCC"
                                        >

                                            <c:choose>
                                                <c:when test="${users.roleId == 0}">
                                                    <option value="0" selected="selected">
                                                        超级管理员
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="0">超级管理员</option>
                                                </c:otherwise>
                                            </c:choose>


                                            <c:choose>
                                                <c:when test="${users.roleId == 1}">
                                                    <option value="1" selected="selected">
                                                        缴费管理员
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="1">缴费管理员</option>
                                                </c:otherwise>
                                            </c:choose>


                                            <c:choose>
                                                <c:when test="${users.roleId == 2}">
                                                    <option value="2" selected="selected">
                                                        维修管理员
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="2">维修管理员</option>
                                                </c:otherwise>
                                            </c:choose>


                                        </select>

                                    </c:if>
                                    <c:if test="${user_session.roleId == 0}">
                                        <select class="wk-select" name="roleId"


                                        >

                                            <c:choose>
                                                <c:when test="${users.roleId == 0}">
                                                    <option value="0" selected="selected">
                                                        超级管理员
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="0">超级管理员</option>
                                                </c:otherwise>
                                            </c:choose>


                                            <c:choose>
                                                <c:when test="${users.roleId == 1}">
                                                    <option value="1" selected="selected">
                                                        缴费管理员
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="1">缴费管理员</option>
                                                </c:otherwise>
                                            </c:choose>


                                            <c:choose>
                                                <c:when test="${users.roleId == 2}">
                                                    <option value="2" selected="selected">
                                                        维修管理员
                                                    </option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="2">维修管理员</option>
                                                </c:otherwise>
                                            </c:choose>


                                        </select>

                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    登录账号:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input"
                                           required="required"
                                           value="${users.account}" name="account"
                                           type="text"
                                           id="account" placeholder="请输入登录账号"
                                            <c:if test="${user_session.roleId != 0}">
                                                readonly
                                            </c:if>
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">
                                    登录密码:
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input"
                                           required="required"
                                           value="${users.password}" name="password"
                                           type="password"
                                           id="password" placeholder="请输入登录密码"

                                            <c:if test="${user_session.roleId != 0}">
                                                readonly
                                            </c:if>
                                    />
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