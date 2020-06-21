<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> 系统</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/bootstrap/css/bootstrap-theme.min.css">
    <script type="text/javascript" src="resource/lib/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="resource/css/wukong-ui.css">
    <link rel="stylesheet" href="resource/bootstrap/css/bootstrap-select.min.css">
    <script type="text/javascript" src="resource/bootstrap/js/bootstrap-select.min.js"></script>

    <script>
        function changeFrameHeight() {
            var ifm = document.getElementById("mainFrame");
            var hh = document.documentElement.clientHeight - $("#banner").height() - 9;

            ifm.height = hh;//(banner顶部高度)
        }
    </script>
</head>

<body>
<div class=" banner" id="banner">
    <div class="row">
        <div class="col-lg-3 logo">
            房屋租赁管理系统
        </div>

        <div class="col-lg-21 info">
            <c:if test="${user_session.roleId=='0'}">
                [超级管理员]
            </c:if>

            <c:if test="${user_session.roleId=='1'}">
                [缴费管理员]
            </c:if>


            <c:if test="${user_session.roleId=='2'}">
                [维修管理员]
            </c:if>


            :${user_session.name},欢迎使用


            <a id="updateBtn" href="javascript:void(0)" onclick="update_password(${user_session.id})">修改密码</a>
            <a href="<%=basePath%>logout.do" class="wk-main-menu-item">注销登录</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-2" id="wk-menu-panel">


        <div class="row">
            <div class="col-lg-12">
                <div class="panel-group wk-accordion-panel-group" id="accordion">


                    <c:if test="${user_session.roleId=='0'}">
                        <%--管理员菜单 --%>
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#AMenu" data-parent="#accordion">管理员信息</a>
                            </div>

                            <div id="AMenu" class="panel-collapse collapse in">
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id="createUser.do"
                                            data-index="createUser.do">>&nbsp;&nbsp;添加管理员
                                    </button>
                                    <button type="button" class="list-group-item" id="searchUser.do">>&nbsp;&nbsp;管理员信息管理</button>
                                    <button type="button" class="list-group-item" id="createDept.do">>&nbsp;&nbsp;添加部门
                                    </button>
                                    <button type="button" class="list-group-item" id="searchDept.do">
                                        >&nbsp;&nbsp;部门信息管理
                                    </button>


                                </div>
                            </div>

                        </div>
                    </c:if>
                    <div class="panel panel-info wk-accordion-header">
                        <div class="panel-heading">
                            <a data-toggle="collapse" href="#BMenu" data-parent="#accordion">公告管理</a>
                        </div>
                        <div id="BMenu" class="panel-collapse collapse">
                            <div class="list-group wk-accordion-list-group">
                                <c:if test="${user_session.roleId=='0'}"><%--超级管理员--%>
                                    <button type="button" class="list-group-item" id="createNews.do" data-index="0">>&nbsp;&nbsp;发布公告</button>
                                </c:if>
                                <button type="button" class="list-group-item" id="searchNews.do">>&nbsp;&nbsp;公告管理
                                </button>
                            </div>
                        </div>
                    </div>
                    <c:if test="${user_session.roleId=='0'}">
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#CMenu" data-parent="#accordion">房屋管理</a>
                            </div>

                            <div id="CMenu" class="panel-collapse collapse">
                                <div class="list-group wk-accordion-list-group">

                                    <button type="button" class="list-group-item" id='searchFloor.do'>>&nbsp;&nbsp;地址
                                    </button>
                                    <button type="button" class="list-group-item" id='createFloor.do'>>&nbsp;&nbsp;添加地址
                                    </button>

                                    <button type="button" class="list-group-item" id='searchRoom.do'>>&nbsp;&nbsp;房屋管理
                                    </button>
                                    <button type="button" class="list-group-item" id='createRoom.do'>>&nbsp;&nbsp;添加房屋
                                    </button>

                                </div>
                            </div>

                        </div>


                    </c:if>
                    <c:if test="${user_session.roleId==0||user_session.roleId==1}">
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#EMenu" data-parent="#accordion">缴费管理</a>
                            </div>
                            <div id="EMenu" class="panel-collapse collapse">
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id='searchCost.do'>>&nbsp;&nbsp;缴费管理
                                    </button>
                                    <button type="button" class="list-group-item" id='createCost.do'>>&nbsp;&nbsp;添加缴费
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${user_session.roleId==0}">
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#FMenu" data-parent="#accordion">客户管理</a>
                            </div>
                            <div id="FMenu" class="panel-collapse collapse">
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id='searchCustomer.do'>>&nbsp;&nbsp;客户管理</button>
                                    <button type="button" class="list-group-item" id='createCustomer.do'>>&nbsp;&nbsp;添加客户</button>
                                </div>
                            </div>
                        </div>

                    </c:if>
                    <c:if test="${user_session.roleId==0||user_session.roleId==2}">


                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#BMenu_2" data-parent="#accordion">报修管理</a>
                            </div>
                            <div id="BMenu_2" class="panel-collapse collapse in">
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id='searchRepair.do'>
                                        >&nbsp;&nbsp;报修管理
                                    </button>
                                    <button type="button" class="list-group-item" id='createRepair.do'>
                                        >&nbsp;&nbsp;添加报修
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${user_session.roleId==0}">
                        <div class="panel panel-info wk-accordion-header">
                            <div class="panel-heading">
                                <a data-toggle="collapse" href="#CMenu_2" data-parent="#accordion">投诉管理</a>
                            </div>

                            <div id="CMenu_2" class="panel-collapse collapse">
                                <div class="list-group wk-accordion-list-group">
                                    <button type="button" class="list-group-item" id='searchComplain.do'>>&nbsp;&nbsp;投诉管理</button>
                                    <button type="button" class="list-group-item" id='createComplain.do'>>&nbsp;&nbsp;添加投诉</button>

                                </div>
                            </div>

                        </div>


                    </c:if>


                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-10" style="padding:0px;">
        <iframe id="mainFrame" src="welcome.jsp" width="100%" frameborder="0" onload="changeFrameHeight()">
        </iframe>
    </div>
</div>


<div class="modal fade" tabindex="-1" role="dialog"
     id="updateConfirm">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header wk-modal-header">
                <button class="close" type="button" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4>修改密码</h4>
            </div>
            <form id="passwordForm" method="POST">
                <div class="modal-body">
                    <div class="form-inline">
                        <div class="form-group">
                            <label class="control-label wk-filed-label">旧&nbsp 密&nbsp 码 : </label>
                            <div class="input-group">
                                &nbsp<input required="required" id="old_password" name="old_password" type="password"
                                            class="form-control wk-normal-input" placeholder="请输入旧密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label wk-filed-label">新&nbsp 密&nbsp 码 : </label>
                            <div class="input-group">
                                &nbsp<input required="required" id="new_password" name="new_password" type="password"
                                            class="form-control wk-normal-input" placeholder="请输入新密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label wk-filed-label">确认密码 : </label>
                            <div class="input-group">
                                <input required="required" id="new_password_1" name="new_password_1" type="password"
                                       class="form-control wk-normal-input" placeholder="再次确认新密码"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer wk-modal-footer">
                    <button id="updateBtnOK" type="submit"
                            class="btn btn-default wk-btn" data-dismiss="modal">确定
                    </button>
                    <button type="button" class="btn btn-default wk-tool-btn"
                            data-dismiss="modal">取消
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    window.onresize = function () {
        changeFrameHeight();
    }

    changeMenuPanelHeight();

    function changeMenuPanelHeight() {
        var panel = $("#wk-menu-panel");
        var dddd = (document.documentElement.clientHeight - $("#banner").height());
        panel.height(dddd);

    }

    window.onresize = function () {
        changeMenuPanelHeight();
    }


    $(".list-group-item").each(function () {
        $(this).on("click", function () {
            var url = "";
            var id = $(this).attr("id");

            $("#mainFrame").attr("src", "<%=basePath%>" + id);
        });
    });


    function update_password(id) {


        if (id != "") {
            $("#updateConfirm").modal();

            $("#updateBtnOK").on("click", function () {
                var password = "${user_session.password}";//数据库的旧密码
                var new_password = $("#new_password").val();
                var new_password_1 = $("#new_password_1").val();
                var old_password = $("#old_password").val();//输入的旧密码

                if (new_password_1 == '' || new_password == '') {
                    alert("新密码必须输入");
                    return false;
                } else if (password != old_password) {
                    alert("旧密码不正确");
                    return false;
                } else if (new_password_1 != new_password) {
                    alert("新密码两次输入要相同");
                    return false;
                } else {
                    $("#passwordForm").attr("action", "<%=basePath%>updateUserPassword/" + id + ".do");
                    $("#passwordForm").submit();
                }
            });
        }
    }


</script>

</body>
</html>


