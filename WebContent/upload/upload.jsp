<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script language="javascript">
    function check() {
        if (document.formAdd.fujian.value == "") {
            alert("请选择文件");
            return false;
        }
        return true;
    }
</script>
</head>

<body style="background-color: #fff">
<form action="<%=path %>/upload/upload_re.jsp" name="formAdd" method="post" enctype="multipart/form-data">
    <input type="file" name="fujian" id="fujian" onKeyDown="javascript:alert('此信息不能手动输入');return false;"/>
    <input type="submit" value="提交" onclick="return check()"/>
</form>
<!--表格数据区------------结束-->

</body>
</html>