<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8 ]>
<html class="ie" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->

<head>
    <base href="<%=basePath%>">

    <meta charset="UTF-8">
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="web/stylesheet/bootstrap.css"><!--bootstrap框架-->
    <link rel="stylesheet" type="text/css" href="web/stylesheet/style.css"><!--网站主框-->
    <link rel="stylesheet" type="text/css" href="web/stylesheet/responsive.css"><!--自适应屏幕大小使用-->

    <!-- Animation Style -->
    <link rel="stylesheet" type="text/css" href="web/stylesheet/animate.css">
    <script type="text/javascript" src="<%=path %>/resource/js/popup.js"></script>
    <script language="javascript">


        function photo(id) {
            var url = "<%=path %>/getRoomPhoto/" + id + ".do";
            var pop = new Popup({contentType: 1, isReloadOnClose: false, width: 400, height: 300});
            pop.setContent("contentUrl", url);
            pop.setContent("title", "");
            pop.build();
            pop.show();
        }


    </script>
</head>


<body>
<div class="boxed">

    <!--头---------------------------------------------------------------------------------------------->
    <jsp:include page="top.jsp"></jsp:include>
    <!--头---------------------------------------------------------------------------------------------->


    <section class="flat-row pd-contact-v2">
        <div class="container">
            <div class="row">
                <!--左栏-->

                <div class="col-md-12  ">
                    <table class="table">
                        <thead>
                        <tr align="center" bgcolor="#FAFAF1" height="22">
                            <th data-halign="center" data-align="center">楼名称</th>
                            <th data-halign="center" data-align="center">楼层</th>
                            <th data-halign="center" data-align="center">房号</th>
                            <th data-halign="center" data-align="center">户型</th>
                            <th data-halign="center" data-align="center">面积</th>
                            <th data-halign="center" data-align="center">备注</th>
                            <th data-halign="center" data-align="center">照片</th>
                            <th data-halign="center" data-align="center">操作</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listData}" var="room">
                            <tr>

                                <td bgcolor="#FFFFFF" align="center">
                                        ${room.floorName}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${room.unit}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${room.house}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${room.name}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${room.standard}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                        ${room.info}
                                </td>
                                <td bgcolor="#FFFFFF" align="center">
                                    <c:if test="${room.photo!=''&&room.photo!=null}">
                                        <a style="color: red" href="<%=path%>/${room.photo}" target="_blank">房屋图片</a>
                                    </c:if>
                                </td>
                                <td bgcolor="#FFFFFF" align="center">


                                    <a type="button" class="btn btn-primary btn-sm" target="_blank"
                                       href= "<%=path %>/webUpdateRoomMap/${room.floorId}.do">查看地图</a>

                                    <c:if test="${customer_session==null}">
                                        登录后可租赁
                                    </c:if>
                                    <c:if test="${customer_session!=null}">
                                        <script language="javascript">
                                            function update_id(id) {
                                                if (confirm('您确定租赁吗？')) {
                                                    window.location.href = "<%=path %>/webUpdateRoom/" + id + ".do";
                                                }
                                            }
                                        </script>
                                    <c:if test="${room.customer_id!=null && room.customer_id!=0}">
                                       已被租赁
                                    </c:if>

                                        <c:if test="${room.customer_id==null || room.customer_id==0}">
                                            <input type="button" class="btn btn-primary btn-sm" value="租赁"
                                                   onclick="update_id(${room.id})"/>

                                        </c:if>


                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>


                    <table width=100%' border='0' style="margin-top:8px;">
                        <TR align="right">
                            <td bgcolor="#FFFFFF" align="center">
                                <form action="" method="post" name="formpage">
                                    <input type="hidden" name="pageCount" value="${pager.pageCount}"/>
                                    <!--//用于给上面javascript传值-->
                                    <input type="hidden" name="page" value="${pager.pageNumber}"/>
                                    <!--//用于给上面javascript传值-->
                                    <input type="hidden" name="jumpurl" value="<%=path%>/webSearchRoom.do?"/>
                                    <!--//用于给上面javascript传值-->
                                    <a href="javascript:void(0)" onClick="PageTop()"><strong>首页</strong></a>&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:void(0)" onClick='PagePre()'><strong>上一页</strong></a>&nbsp;&nbsp;&nbsp;
                                    共${pager.rowCountTotal}条记录,
                                    共计${pager.pageCount}页,
                                    当前第${pager.pageNumber}页&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:void(0)" onClick="PageNext()"><strong>下一页</strong></a>&nbsp;&nbsp;&nbsp;
                                    <a href="javascript:void(0)" onClick="PageLast()"><strong>尾页</strong></a>
                                </form>
                                <script type="text/javascript" src="<%=path%>/resource/js/page.js"></script>
                            </TD>
                        </TR>
                    </table>
                </div>


            </div>
        </div>
    </section>


    <jsp:include page="foot.jsp"></jsp:include>
</div>
</body>
</html>
