<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
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
<script type="text/javascript" src="<%=path %>/resource/js/popup.js"></script>
<script language="javascript">
    function up() {
        var pop = new Popup({contentType: 1, isReloadOnClose: false, width: 400, height: 200});
        pop.setContent("contentUrl", "<%=path %>/upload/upload.jsp");
        pop.setContent("title", "文件上传");
        pop.build();
        pop.show();
    }
</script>
<script language="javascript">

    function check() {
        if (document.formAdd.floorId.value == 0) {
            alert("请选择地址楼名称");
            return false;
        }
        if (document.formAdd.name.value == "") {
            alert("请输入户型");
            return false;
        }
        return true;
    }
</script>
</head>

<body>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default wk-panel ">
            <div class="panel-heading">
               房屋添加
            </div>


            <form action="<%=path %>/saveRoom.do" name="formAdd" method="post">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label wk-filed-label">客户姓名：
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="customer_id" id="customer_id">
                                        <option value="0">空置</option>

                                        <c:forEach items="${customer}" var="customer">

                                            <option value="${customer.id}"> ${customer.name}</option>
                                        </c:forEach> </select>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">地址楼名称：
                                </label>
                                <div class="input-group">


                                    <select class="wk-select" name="floorId" id="floorId">
                                        <option value="0">请选择地址楼名称</option>
                                        <c:forEach items="${floor}" var="floor">

                                            <option value="${floor.id}"> ${floor.name}</option>
                                        </c:forEach>
                                    </select>


                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">楼层：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="unit"
                                           size="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">房号：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="house"
                                           size="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">房屋户型：
                                </label>
                                <div class="input-group">
                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="name"
                                           size="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">面积：
                                </label>
                                <div class="input-group">
                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="standard"
                                           size="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">照片：</label>
                                <div class="input-group">


                                    <input required="required" id="photo"
                                           type="text"
                                           name="photo"
                                           style="padding-top: 4px" readonly="readonly"/>

                                    <input required="required"
                                           type="button" class="btn btn-primary btn-sm"
                                           value="上传"
                                           onClick="up()"/>


                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">备注：
                                </label>
                                <div class="input-group">

                                            <textarea name="info"
                                                      style="margin-top:5px; width:300px; height:50px;"></textarea>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer wk-panel-footer">
                    <button type="submit" class="btn btn-default wk-btn">添&nbsp;&nbsp;加</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--表格数据区------------结束-->


<script src="resource/js/jquery.min.js"></script><!--jquery框架-->
<!--弹窗插件-->

</body>
</html>