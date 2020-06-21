<%@ page language="java" import="java.text.SimpleDateFormat" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

</head>

<body>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default wk-panel ">
            <div class="panel-heading">
                创建缴费
            </div>
            <form action="<%=path %>/saveCost.do" name="formAdd" method="post">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label wk-filed-label">房屋：
                                </label>
                                <div class="input-group">


                                    <select class="wk-select" name="roomId" id="roomId">
                                        <option value="0">--请选择房屋--</option>

                                        <c:forEach items="${room}" var="room">

                                            <option value="${room.id}"> ${room.allname}</option>
                                        </c:forEach> </select>


                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">客户姓名：
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="customer_id" id="customer_id">
                                        <option value="0">请选择客户</option>

                                        <c:forEach items="${customer}" var="customer">

                                            <option value="${customer.id}"> ${customer.name}</option>
                                        </c:forEach> </select>

                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">缴费时间：
                                </label>
                                <div class="input-group">
                                    <input class="form-control wk-long-2col-input" required="required"
                                           name="createTime"
                                           id="createTime" type="date"
                                           value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">缴费名称：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="costname"
                                           size="20"
                                           value=""/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">单价：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="price" id="price"
                                           size="20"
                                           value="0"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">数量：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="costnumber" id="costnumber"
                                           size="20"
                                           value="0"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">总金额：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="money" id="money"
                                           size="20"
                                           value="0"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">支付方式：
                                </label>
                                <div class="input-group">
                                    <select class="wk-select" name="paytype">
                                        <option value="现金">现金</option>
                                        <option value="银行卡">银行卡</option>
                                        <option value="支票">支票</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">支付状态 ：
                                </label>
                                <div class="input-group">
                                    <select class="wk-select" name="info">
                                        <option value="待支付">待支付</option>
                                        <option value="已支付">已支付</option>
                                        <option value="已退款">已退款</option>
                                    </select>
                                </div>
                            </div>

                            <!--表格数据区------------结束-->
                        </div>
                    </div>
                </div>

                <div class="panel-footer wk-panel-footer">
                    <button type="submit" class="btn btn-default wk-btn">提&nbsp;&nbsp;交</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="resource/js/jquery.min.js"></script><!--jquery框架-->
<!--弹窗插件-->

</body>
<script language="javascript">


    $("#roomId").change(function(){
        console.log($("#roomId").val());

        $.get("<%=path %>/getRoom.do", { id: $("#roomId").val()},
            function(data){
                $("#customer_id").val(data)
            });

    });

    $("#price").change(function(){
       if($("#price").val()!=null && $("#costnumber").val()!=null){
           $("#money").val( $("#price").val()* $("#costnumber").val());
       }else{
           $("#money").val(0);
       }
    });

    $("#costnumber").change(function(){
        if($("#price").val()!=null && $("#costnumber").val()!=null){
            $("#money").val( $("#price").val()* $("#costnumber").val());
        }else{
            $("#money").val(0);
        }
    });
    function check() {
        if (document.formAdd.roomId.value == 0) {
            alert("请选择房屋");
            return false;
        }

        var reg = /^(-[1-9]|[1-9]|(0[.])|(-(0[.])))[0-9]{0,}(([.]*\d{1,2})|[0-9]{0,})$/;
        var money = document.formAdd.money.value;
        if (reg.test(money) == false) {
            alert("请输入正确的总金额");
            return false;
        }

        return true;
    }
</script>
</html>