<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
                地址编辑
            </div>
            <div style="width: 49%;float:left;">
            <form action="<%=path %>/editFloor/${floor.id}.do" name="formAdd" method="post">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label">地址：
                                </label>
                                <input class="form-control " required="required" type="text"
                                       name="name" id="houseAddress"
                                       size="20"
                                       style=" width:450px;" value="${floor.name}"
                                />
                            </div>
                            <div class="form-group">
                                <label class="control-label">经度：
                                </label>
                                <input class="form-control " required="required" type="text"
                                       name="addressLat"
                                       id="addressLat"
                                       size="20"
                                       style=" width:450px;" value="${floor.addressLat}"
                                />
                            </div>
                            <div class="form-group">
                                <label class="control-label">纬度：
                                </label>
                                <input class="form-control " required="required" type="text"
                                       name="addressLon"  id="addressLon"
                                       size="20"
                                       style=" width:450px;" value="${floor.addressLon}"
                                />
                            </div>

                            <div class="form-group">
                                <label class="control-label">介绍：
                                </label>
                                <div class="input-group">


                                        <textarea name="info"
                                                  style="margin-top:5px; width:450px; height:50px;">${floor.info}</textarea>


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
        <div style="width: 50%;float:right;">
            <div style="height: 500px;">
                <div id='container' style="height: 500px;"></div>
            </div>
            <div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                    <legend>帮助信息</legend>
                </fieldset>

                <div class="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">投放地查询</label>
                        <div class="layui-input-block">
                            <input type="text" id='tipinput' name="tipinput" class="layui-input userName "
                                   placeholder="请输入关键字" value="">
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                        <legend>查询定位信息</legend>
                    </fieldset>
                    <div style=" margin-left: 18px;">
                        <p id='pois'></p>
                    </div>

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                        <legend>本地定位信息</legend>
                    </fieldset>
                    <div style=" margin-left: 18px;">
                        定位状态：<span id='status'></span>
                        <p id='result'></p>
                    </div>


                </div>
            </div>
        </div>

    </div>


</div>


</div>
<!--表格数据区------------结束-->


<script src="resource/js/jquery.min.js"></script><!--jquery框架-->
<!--弹窗插件-->

<script type="text/javascript"
        src="https://webapi.amap.com/maps?v=1.4.11&key=3254c1bd950c279b4a05d66533af3bf0&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>


<script type="text/javascript">
    var map = new AMap.Map('container', {
        resizeEnable: true
    });

    var auto = new AMap.Autocomplete({
        input: "tipinput"
    });
    var placeSearch = new AMap.PlaceSearch({
        map: map
    });  //构造地点查询类
    AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
    function select(e) {
        console.log(e);
        placeSearch.setCity(e.poi.adcode);
        placeSearch.search(e.poi.name, function (status, result) {
            // 搜索成功时，result即是对应的匹配数据
            console.log(status);
            console.log(result);
            var pois = result.poiList.pois;
            var str = [];
            for (var i = 0; i < pois.length; i++) {
                str.push('定位地址：' + pois[i].pname + pois[i].cityname + pois[i].adname + pois[i].address + pois[i].name);
                var poStr = pois[i].location.toString();
                var po = poStr.split(",");
                str.push('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经度：' + po[0]);
                str.push('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;纬度：' + po[1] + "<br>");

                if (i == 0) {
                    document.getElementById('houseAddress').value = pois[i].pname + pois[i].cityname + pois[i].adname + pois[i].address + pois[i].name;
                    document.getElementById('addressLat').value = po[0];
                    document.getElementById('addressLon').value = po[1];
                }
            }
            document.getElementById('pois').innerHTML = str.join('<br>');

        });  //关键字查询查询
    }


    AMap.plugin('AMap.Geolocation', function () {
        var geolocation = new AMap.Geolocation({
            enableHighAccuracy: true,//是否使用高精度定位，默认:true
            timeout: 10000,          //超过10秒后停止定位，默认：5s
            buttonPosition: 'RB',    //定位按钮的停靠位置
            buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            zoomToAccuracy: true,   //定位成功后是否自动调整地图视野到定位点

        });
        map.addControl(geolocation);
        geolocation.getCurrentPosition(function (status, result) {
            if (status == 'complete') {
                onComplete(result)
            } else {
                onError(result)
            }
        });
    });

    //解析定位结果
    function onComplete(data) {
        document.getElementById('status').innerHTML = '定位成功'
        var str = [];
        var poStr = data.position.toString();
        var po = poStr.split(",");
        str.push('定位结果：');
        str.push('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经度：' + po[0]);
        str.push('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;纬度：' + po[1]);

        str.push('定位类别：' + data.location_type);
        if (data.accuracy) {
            str.push('精度：' + data.accuracy + ' 米');
        }//如为IP精确定位结果则没有精度信息
        str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
        document.getElementById('result').innerHTML = str.join('<br>');
    }

    //解析定位错误信息
    function onError(data) {
        document.getElementById('status').innerHTML = '定位失败'
        document.getElementById('result').innerHTML = '失败原因排查信息:' + data.message;
    }


</script>
</body>
</html>