<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<div class="preloader"><!-- 页面加载时的动画 -->
    <div class="clear-loading loading-effect-2">
        <span></span>
    </div>
</div>

<header id="header" class="header bg-color">
    <div class="container">
        <div class="row">
            <div class="header-wrap">
                <div class="col-md-3">
                    <div id="logo" class="logo "> 房屋租赁管理</div>
                    <!-- /#logo -->
                </div>

                <div class="col-md-9">
                    <div class="flat-show-search" id="top-search">
                        <nav id="mainnav" class="mainnav">
                            <ul class="menu">

                                <li><a href="<%=path%>">首页</a></li>
                                <li><a href="webSearchNews.do">公告</a></li>
                                <li>
                                    <a href='<%=path %>/webSearchRoom_public.do'>房屋浏览</a>

                                </li>


                                <c:if test="${customer_session==null}">
                                    <li><a href="web/login.jsp" title="">登录</a></li>
                                    <li><a href="web/reg.jsp" title="">注册 </a></li>
                                </c:if>
                                <c:if test="${customer_session!=null}">

                                <span style="margin-left:120px">
                                       <font color="#faebd7"> ${customer_session.name}</font>
                                       </span>
                                    <li>
                                        <a href="<%=path %>/webChangePwd.do"> 密码修改</a></li>
                                    <li>
                                        <a href="<%=path %>/webUpdateCustomer/${customer_session.id}.do"> 资料修改</a>
                                    </li>

                                    <li class="dropdown  ">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 功能菜单 <b
                                                class="caret"></b> </a>
                                        <ul class="dropdown-menu wk-nav-menu-dropdown-menu">
                                            <li>
                                                <a href='<%=path %>/webSearchRoom.do'>我的房屋</a>

                                            </li>
                                            <li><a href='<%=path %>/webSearchRepair.do'>报修管理</a> <a
                                                    href='<%=path %>/webCreateRepair.do'>添加报修</a>
                                            </li>
                                            <li>
                                                <a href='<%=path %>/webSearchComplain.do'>投诉管理</a>
                                                <a href='<%=path %>/webCreateComplain.do'>添加投诉</a>
                                            </li>
                                            <li>
                                                <a href='<%=path %>/webSearchCost.do'>缴费管理</a>
                                                <a href='<%=path %>/webCustomerLogout.do'>安全退出</a>
                                            </li>


                                        </ul>
                                    </li>

                                </c:if>

                                <%--<li class="dropdown  ">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 下拉菜单 <b
                                            class="caret"></b> </a>
                                    <ul class="dropdown-menu wk-nav-menu-dropdown-menu">

                                        <li>
                                            <a href="list_pic.html" class="wk-main-menu-item">列表</a>
                                        </li>

                                    </ul>
                                </li>--%>
                            </ul>

                        </nav>

                    </div>


                    <div class="nav-wrap">
                        <!--//手机端菜单  -->
                        <div class="btn-menu">
                            <span></span>
                        </div>
                        <nav id="mainnav" class="mainnav">
                            <ul class="menu">

                            </ul>

                        </nav>

                    </div>


                </div>

            </div>

        </div>

    </div>

</header>


<div align="center"><img src="web/images/banner.jpg" style="width: 1200px;height: 426px"></div>
