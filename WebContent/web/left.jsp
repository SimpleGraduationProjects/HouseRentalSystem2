<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<style>
    li {
        list-style-type: none;
    }
</style>
<form action="<%=basePath%>webCustomerLogin.do" method="post" id="myForm">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center">
        <tr align="center" bgcolor="#3a8e1b" height="35">
            <td style=" color:#ffffff; font-size:14px; font-weight:bold;" align="center">客户中心</td>
        </tr>
        <tr bgcolor="ffffff">
            <td>
                <c:if test="${customer_session==null}">

                    <table align="center">
                        <tr>
                            <td width="40%" height="35" align="right">用户名：</td>
                            <td width="60%">
                                <input name="loginname" required id="loginname" type="text" size="10" r
                                       onkeypress="return ShortcutKey();" style="height:25px; border:solid 1px #bbbbbb"
                                       value="test">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" height="35">密码：</td>
                            <td>
                                <input name="loginpassword" required id="loginpassword" value="111111" type="password"
                                       onkeypress="return ShortcutKey();" size="10"
                                       style="height:25px; border:solid 1px #bbbbbb">
                            </td>
                        </tr>
                        <tr bgcolor="ffffff">
                            <td colspan="2" align="center" height="35">
                                <input name="login" type="submit" value="登录"/>${info}
                            </td>
                        </tr>
                    </table>
                </c:if>
                <c:if test="${customer_session!=null}">

                    <div style="text-align: center; font-size: 18px"> ${customer_session.name}

                        <li>
                            <a href="<%=path %>/webChangePwd.do"> 密码修改</a>
                            <a href="<%=path %>/webUpdateCustomer/${customer_session.id}.do"> 资料修改</a>
                        </li>



                    </div>

                </c:if>

            </td>
        </tr>
    </table>
</form>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#CFCFCF" align="center" style="margin-top:10px">
    <tr align="center" bgcolor="#3a8e1b" height="35">
        <td style=" color:#ffffff; font-size:14px; font-weight:bold;" align="center"><a href="webSearchNews.do"
                                                                                        style="color: #fff5d4">最新公告</a>
        </td>
    </tr>
    <tr bgcolor="ffffff">
        <td>
            <c:forEach items="${newsList}" var="var">
                <div style="height:35px; line-height:35px;  margin:10px; clear:both; background-color:#D5FBE1"
                     align="center">


                    <a href="webSearchNewsInfo/${var.id}.do"><span
                            style=" color:#666; font-size:14px; font-weight:bold;">
                             <c:if test="${fn:length(var.title)>10 }">${ fn:substring( var.title ,0,10)} ...</c:if>
                                            <c:if test="${fn:length(var.title)<=10 }">${  var.title } </c:if>


                    </span></a>
                </div>
            </c:forEach>

        </td>
    </tr>
</table>

