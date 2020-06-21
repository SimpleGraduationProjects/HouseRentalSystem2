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


    <div class="anchor-title">
        <h3>详细地址</h3>
    </div>
    <div style="width: 100%">
        <div style="height: 500px;">
            <div id='container'style="height: 500px;"></div>
        </div>
    </div>


</div>

    <jsp:include page="foot.jsp"></jsp:include>


    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.11&key=3254c1bd950c279b4a05d66533af3bf0&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>

    <script>

        var map = new AMap.Map("container", {
            zoom: 13,
            center: [${floor.addressLat}, ${floor.addressLon}],
            resizeEnable: true
        });

        // 创建点覆盖物
        var marker = new AMap.Marker({
            position: new AMap.LngLat(${floor.addressLat}, ${floor.addressLon}),
            icon: '//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-default.png',
            offset: new AMap.Pixel(-13, -30)
        });

        map.add(marker);
        map.setCenter([${Details.addressLat}, ${Details.addressLon}]); //设置地图中心点
    </script>


</body>
</html>
