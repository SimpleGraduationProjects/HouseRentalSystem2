<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<footer id="footer">
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>Copyright &copy; 版权所有 房屋租赁管理</p>
                        <p>备案号 京A123456</p> <a href="login.do" class="black">【管理员登录】</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</footer>
<!--返回顶部-->
<div class="button-go-top">
    <a href="#" title="" class="go-top"> <span style="color:white">▲</span>
    </a>
</div>


<script type="text/javascript" src="web/javascript/jquery.min.js"></script><!--jquery主文件-->
<script type="text/javascript" src="web/javascript/bootstrap.min.js"></script><!--bootstrap主文件-->
<script type="text/javascript" src="web/javascript/main.js"></script><!--程序主文件-->
