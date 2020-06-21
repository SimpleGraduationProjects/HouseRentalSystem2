<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script language="javascript">

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
</head>

<body>


<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default wk-panel ">
            <div class="panel-heading">
                编辑
            </div>
            <form action="<%=path %>/editCost/${cost.id}.do" name="formAdd" method="post">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-inline">
                            <div class="form-group">
                                <label class="control-label wk-filed-label">房屋：
                                </label>
                                <div class="input-group">


                                    <select class="wk-select" name="roomId">
                                        <option value="${cost.roomId}">${cost.roomName}
                                        </option>

                                        <c:forEach items="${room}" var="room">

                                            <option value="${room.id}"> ${room.allname}</option>
                                        </c:forEach>


                                    </select>


                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">客户姓名：
                                </label>
                                <div class="input-group">

                                    <select class="wk-select" name="customer_id" id="customer_id">
                                        <option value="${cost.customer_id}">${cost.customerName}
                                        </option>


                                        <c:forEach items="${customer}" var="customer">

                                            <option value="${customer.id}"> ${customer.name}</option>
                                        </c:forEach>
                                    </select>
                                    <img id="indicator1" src="<%=path %>/resource/images/loading.gif"
                                         style="display:none"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">缴费时间：
                                </label>
                                <div class="input-group">


                                    <input class="form-control wk-long-2col-input" required="required" name="createTime"
                                           type="date"
                                           id="createTime"
                                           value="<fmt:formatDate value="${cost.createTime}" pattern="yyyy-MM-dd"/>"/>


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
                                           value="${cost.costname}"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">单价：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="price"
                                           size="20"
                                           value="${cost.price}"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">数量：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="costnumber"
                                           size="20"
                                           value="${cost.costnumber}"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">总金额：
                                </label>
                                <div class="input-group">

                                    <input class="form-control wk-long-2col-input" required="required" type="text"
                                           name="money"
                                           size="20"
                                           value="${cost.money}"/>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">支付方式：
                                </label>
                                <div class="input-group">
                                    <select class="wk-select" name="paytype">
                                        <option value="现金"
                                                <c:if test="${cost.paytype=='现金'}">
                                                    selected="selected"
                                                </c:if>

                                        >现金
                                        </option>
                                        <option value="银行卡"
                                                <c:if test="${cost.paytype=='银行卡'}">
                                                    selected="selected"
                                                </c:if>
                                        >银行卡
                                        </option>
                                        <option value="支票"
                                                <c:if test="${cost.paytype=='支票'}">
                                                    selected="selected"
                                                </c:if>
                                        >支票
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <label class="control-label wk-filed-label">支付状态 ：
                                </label>
                                <div class="input-group">
                                    <select class="wk-select" name="info">
                                        <option value="${cost.info}">${cost.info}</option>
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
</html>